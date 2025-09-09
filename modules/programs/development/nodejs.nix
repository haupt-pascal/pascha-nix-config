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

  # Enable shell integration for fnm (NVM alternative)
  programs.bash.shellInit = ''
    # FNM (Fast Node Manager) setup
    if command -v fnm >/dev/null 2>&1; then
      eval "$(fnm env --use-on-cd)"
    fi
  '';

  programs.zsh.shellInit = ''
    # FNM (Fast Node Manager) setup
    if command -v fnm >/dev/null 2>&1; then
      eval "$(fnm env --use-on-cd)"
    fi
  '';

  # Alternative: You can also use direnv with shell.nix files
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
