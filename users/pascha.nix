{ config, pkgs, ... }:

{
  users.users.pascha = {
    isNormalUser = true;
    description = "Pascal Haupt";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      firefox
    ];
  };
}
