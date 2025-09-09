{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Node.js 22 as default (latest LTS)
    nodejs_22
    nodejs_20  # Keep 20 as fallback
    nodejs-slim_20  # Smaller Node.js build
    
    # Package managers
    bun
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm
    
    # FNM removed - causes issues with generic Linux binaries on NixOS
  ];

  # Node.js 22 is available system-wide
  # For project-specific versions, use nix-shell or direnv with shell.nix files
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
