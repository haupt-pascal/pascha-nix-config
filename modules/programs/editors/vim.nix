{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.vim-full;
  };
  
  environment.systemPackages = with pkgs; [
    vim-full
  ];
}
