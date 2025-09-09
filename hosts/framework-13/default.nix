{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];

  # Framework-13 specific services
  services.power-profiles-daemon.enable = true;
  services.fwupd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "25.05";
}
