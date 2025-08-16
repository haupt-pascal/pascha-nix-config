{ config, pkgs, ... }:

{
  # Steam configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # GameMode for better gaming performance
  programs.gamemode.enable = true;

  # Gaming packages
  environment.systemPackages = with pkgs; [
    # Game launchers and stores
    lutris
    bottles
    heroic
    legendary-gl
    
    # Performance monitoring
    mangohud
    goverlay
    
    # Gaming utilities
    gamemode
    gamescope
    
    # Wine and compatibility
    wine
    winetricks
    
    # Optional emulators (uncomment as needed)
    # retroarch
    # dolphin-emu
    # pcsx2
    # rpcs3
    # cemu
    
    # Optional games (uncomment as needed)
    # minecraft
    # prismlauncher  # Minecraft launcher
  ];

  # Enable 32-bit support for games (neue API)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Gamepad support
  hardware.xpadneo.enable = true; # Xbox One controllers via Bluetooth
}
