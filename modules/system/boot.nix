{ config, pkgs, ... }:

{
  # Dual boot configuration with Windows
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  # Fix system time for dual boot with Windows
  time.hardwareClockInLocalTime = true;

  # Enable os-prober to detect Windows
  environment.systemPackages = with pkgs; [
    os-prober
  ];
}
