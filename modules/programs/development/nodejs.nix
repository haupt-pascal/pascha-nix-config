{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs_20 
    nodejs_22
    
    bun
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm
  ];
}
