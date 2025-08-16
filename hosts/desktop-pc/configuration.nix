{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/system/base.nix
    ../../modules/system/keyboard.nix
    ../../modules/system/aliases.nix
  ];

  # System identification
  networking.hostName = "desktop-pc";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "24.11";
}
