# Hardware configuration for Desktop PC
# Ryzen 7 5800X + RTX 2080 Super
# This file uses flexible device detection instead of hardcoded UUIDs

{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Ryzen 7 5800X optimized kernel modules
  boot.initrd.availableKernelModules = [ 
    "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" 
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # Flexible filesystem configuration using labels instead of UUIDs
  # This prevents hardcoded UUID issues during installation
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos-root";
    fsType = "ext4";
    options = [ "defaults" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/nixos-boot";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  # No swap devices configured
  swapDevices = [ ];

  # Network configuration
  networking.useDHCP = lib.mkDefault true;

  # AMD Ryzen 7 5800X specific settings
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  
  # Ryzen optimizations
  boot.kernelParams = [
    "amd_pstate=guided"  # Better power management for Ryzen
  ];

  # Hardware acceleration handled by nvidia.nix module
  # No graphics configuration needed here to avoid conflicts

  # Enable hardware acceleration
  hardware.enableRedistributableFirmware = true;
}
