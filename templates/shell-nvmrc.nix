# NixOS alternative to .nvmrc
# This shell.nix automatically detects .nvmrc files and uses the specified Node version

{ pkgs ? import <nixpkgs> {} }:

let
  # Read .nvmrc file if it exists
  nvmrcFile = if builtins.pathExists ./.nvmrc 
    then builtins.readFile ./.nvmrc 
    else "";
  
  # Clean up the version string (remove whitespace/newlines)
  nodeVersion = builtins.replaceStrings ["\n" "\r" " "] ["" "" ""] nvmrcFile;
  
  # Map common version patterns to nixpkgs versions
  # Note: Node.js 18 has reached EOL and is no longer available
  selectedNode = 
    if nodeVersion == "18" || nodeVersion == "18.x" || pkgs.lib.hasPrefix "18." nodeVersion
    then pkgs.nodejs_20  # Fallback to 20 for EOL 18.x requests
    else if nodeVersion == "20" || nodeVersion == "20.x" || pkgs.lib.hasPrefix "20." nodeVersion  
    then pkgs.nodejs_20
    else if nodeVersion == "22" || nodeVersion == "22.x" || pkgs.lib.hasPrefix "22." nodeVersion
    then pkgs.nodejs_22
    else pkgs.nodejs_20; # default fallback
    
in
pkgs.mkShell {
  name = "node-nvmrc-shell";
  
  buildInputs = with pkgs; [
    selectedNode
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm
  ];
  
  shellHook = ''
    echo "🔍 Detected Node.js version from .nvmrc: ${nodeVersion}"
    echo "🚀 Using Node.js $(node --version)"
    echo "📦 NPM $(npm --version) ready"
    echo ""
    
    # Add local node_modules to PATH
    export PATH="$PWD/node_modules/.bin:$PATH"
    
    # Check if package.json exists and show scripts
    if [ -f "package.json" ]; then
      echo "📋 Available npm scripts:"
      ${pkgs.jq}/bin/jq -r '.scripts | keys[]' package.json 2>/dev/null | sed 's/^/  npm run /' || echo "  (No scripts found)"
      echo ""
    fi
  '';
}
