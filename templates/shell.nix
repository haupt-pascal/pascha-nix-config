# Template for project-specific Node.js environment
# Copy this file to your project root and modify as needed
# Run `nix-shell` in the project directory to activate

{ pkgs ? import <nixpkgs> {} }:

let
  # Choose your Node.js version here
  nodeVersion = pkgs.nodejs_20; # or nodejs_18, nodejs_22, etc.
in
pkgs.mkShell {
  name = "node-project-shell";
  
  buildInputs = with pkgs; [
    nodeVersion
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm
    
    # Optional: Add other development tools
    # nodePackages.typescript
    # nodePackages.eslint
    # nodePackages.prettier
  ];
  
  shellHook = ''
    echo "🚀 Node.js $(node --version) environment ready!"
    echo "📦 NPM $(npm --version) available"
    
    # Set up local node_modules/.bin in PATH
    export PATH="$PWD/node_modules/.bin:$PATH"
    
    # Optional: Set NPM config for local packages
    # export NPM_CONFIG_PREFIX="$HOME/.npm-global"
    
    # Show available commands
    echo ""
    echo "Available commands:"
    echo "  node --version"
    echo "  npm --version"
    echo "  yarn --version (if installed)"
    echo ""
  '';
}
