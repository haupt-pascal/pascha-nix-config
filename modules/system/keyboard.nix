{ config, pkgs, ... }:

{
  services.xserver.autoRepeatDelay = 200;
  services.xserver.autoRepeatInterval = 30;
  
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
