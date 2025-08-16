{ config, pkgs, ... }:

{
  imports = [
    ../modules/system/base.nix
    ../modules/system/boot.nix
    ../modules/system/nvidia.nix
    ../modules/system/keyboard.nix
    ../modules/system/aliases.nix
    ../modules/desktop/plasma.nix
    ../modules/programs/backup/borg.nix
    ../modules/programs/gaming/steam.nix
    ../modules/programs/terminal/shell.nix
    ../modules/programs/terminal/tmux.nix
    ../modules/programs/terminal/ghostty.nix
    ../modules/programs/editors/vscode.nix
    ../modules/programs/editors/vim.nix
    ../modules/programs/editors/neovim.nix
    ../modules/programs/development/git.nix
    ../modules/programs/development/nodejs.nix
    ../modules/programs/development/docker.nix
    ../modules/programs/cli-tools.nix
    ../modules/programs/communication/discord.nix
    ../users/pascha.nix
  ];

  # Gaming-spezifische Pakete (Steam wird durch steam.nix Modul gehandhabt)
  environment.systemPackages = with pkgs; [
    # Gaming tools
    lutris
    bottles
    heroic
    mangohud
    goverlay
    
    # Emulation
    # retroarch
    # dolphin-emu
    # pcsx2
    
    # Game launchers
    # minecraft
  ];
}
