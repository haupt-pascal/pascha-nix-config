{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "framework-13";
  services.power-profiles-daemon.enable = true;
  services.fwupd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "25.05";
}
