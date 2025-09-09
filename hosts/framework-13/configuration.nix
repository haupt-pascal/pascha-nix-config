{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/system/base.nix
    ../../modules/system/keyboard.nix
    ../../modules/system/aliases.nix
  ];

  # Framework-13 specific bootloader (systemd-boot, not GRUB)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Override GRUB from development profile
  boot.loader.grub.enable = lib.mkForce false;
  
  environment.systemPackages = with pkgs; [
    wget
    htop
    pciutils
    tree
  ];
  
  # System identification
  networking.hostName = "framework-13";
}
