{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Multiple Node.js versions available (nodejs_18 removed - EOL)
    nodejs_20 
    nodejs_22
    nodejs-slim_20  # Smaller Node.js build
    
    # Package managers
    bun
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm
    
    # Node version management tools
    fnm  # Fast Node Manager (alternative to NVM)
    # nodePackages.n not available - use fnm instead
  ];

  # FNM shell integration is handled in shell.nix module
  
  # Alternative: You can also use direnv with shell.nix files
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
