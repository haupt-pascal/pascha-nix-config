{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
    };
  };
  
  environment.systemPackages = with pkgs; [
    git
    gh
    gitui
  ];
}
