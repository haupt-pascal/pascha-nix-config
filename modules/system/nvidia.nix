{ config, lib, pkgs, ... }:

{
  # NVIDIA RTX 2080 Super configuration for development/office work
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Power management (experimental)
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Use the proprietary driver (not open source)
    open = false;

    # Enable the nvidia-settings menu
    nvidiaSettings = true;

    # Select the appropriate driver version
    # RTX 2080 Super works well with stable drivers
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Graphics configuration for development/office work
  hardware.graphics = {
    enable = true;
    # No 32-bit support needed for development work
    
    # NVIDIA specific packages
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };

  # NVIDIA tools removed to prevent undefined variable errors
  # nvidia-settings can be installed manually if needed: nix-shell -p nvidia-settings
  environment.systemPackages = with pkgs; [
    # No NVIDIA packages here to avoid unfree loading issues
  ];

  # Kernel parameters for NVIDIA
  boot.kernelParams = [
    "nvidia-drm.modeset=1"  # Enable DRM kernel mode setting
  ];

  # Blacklist nouveau driver
  boot.blacklistedKernelModules = [ "nouveau" ];
}
