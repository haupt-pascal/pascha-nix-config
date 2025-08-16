# ❄️ NixOS Configuration

> A modular NixOS configuration supporting both Framework Laptop 13 (AMD AI 300) and Desktop PC (Ryzen 7 5800X + RTX 2080 Super)

<div align="center">

![NixOS](https://img.shields.io/badge/NixOS-5277C3?style=for-the-badge&logo=nixos&logoColor=white)
![Framework](https://img.shields.io/badge/Framework-FF6B35?style=for-the-badge&logo=framework&logoColor=white)
![Desktop](https://img.shields.io/badge/Desktop-AMD-ED1C24?style=for-the-badge&logo=amd&logoColor=white)
![KDE](https://img.shields.io/badge/KDE-1D99F3?style=for-the-badge&logo=kde&logoColor=white)

</div>

A clean, modular NixOS configuration that just works™️

## ✨ Features

- 🖥️ **Desktop**: KDE Plasma 6 with auto-login
- ⚡ **Multi-Hardware**: Framework Laptop 13 AMD AI 300 + Desktop PC support  
- 🛠️ **Development**: Complete dev environment with Python, Node.js, Docker
- � **Python**: Full pip support with user installations enabled
- 🎨 **Terminals**: Zsh + Powerlevel10k, Ghostty, Tmux, Nushell
- 🧰 **CLI Tools**: Modern replacements (bat, eza, ripgrep, fd, whois, etc.)
- 🎮 **Gaming**: Optional gaming profile with Lutris, Bottles, Heroic
- 📦 **Modular**: Clean structure for easy maintenance and customization

## 🚀 Quick Start

### Framework Laptop 13

```bash
# Clone this repository
git clone https://github.com/haupt-pascal/pascha-nix-config.git ~/nix-config
cd ~/nix-config

# ⚠️ WICHTIG: Benutzername anpassen
# Ersetze "pascha" in folgenden Dateien mit deinem Benutzernamen:
# - users/pascha.nix
# - modules/programs/development/docker.nix
# - modules/programs/backup/borg.nix
# - modules/desktop/plasma.nix
# - modules/system/aliases.nix

# Copy your hardware configuration
sudo cp /etc/nixos/hardware-configuration.nix hosts/framework-13/

# Apply configuration
sudo nixos-rebuild switch --flake .#framework-13

# Reboot to ensure all hardware modules load correctly
sudo reboot
```

### Desktop PC (Dual Boot)

```bash
# Clone this repository  
git clone https://github.com/haupt-pascal/pascha-nix-config.git ~/nix-config
cd ~/nix-config

# ⚠️ WICHTIG: Benutzername anpassen (siehe oben)

# Copy your hardware configuration
sudo cp /etc/nixos/hardware-configuration.nix hosts/desktop-pc/

# Apply configuration  
sudo nixos-rebuild switch --flake .#desktop-pc

# Reboot
sudo reboot
```

## 📂 Structure

```
❄️ nix-config/
├── 📁 hosts/
│   ├── 🖥️ framework-13/           # Framework Laptop configuration
│   │   ├── default.nix           # Framework-specific settings
│   │   ├── configuration.nix     # Base framework config
│   │   └── hardware-configuration.nix
│   └── 🖥️ desktop-pc/            # Desktop PC configuration
│       ├── default.nix           # Desktop-specific settings
│       ├── configuration.nix     # Base desktop config
│       └── hardware-configuration.nix
├── 📁 modules/
│   ├── 🖥️ desktop/
│   │   └── plasma.nix            # KDE Plasma 6 setup
│   ├── 💻 programs/
│   │   ├── backup/
│   │   │   └── borg.nix         # Borgmatic backup
│   │   ├── communication/
│   │   │   └── discord.nix      # Discord
│   │   ├── development/
│   │   │   ├── git.nix          # Git + GitHub CLI + GitUI
│   │   │   ├── nodejs.nix       # Node.js 20/22 + Bun + npm/yarn/pnpm
│   │   │   ├── python.nix       # Python 3 + pip user support
│   │   │   └── docker.nix       # Docker + docker-compose
│   │   ├── editors/
│   │   │   ├── vscode.nix       # Visual Studio Code
│   │   │   ├── vim.nix          # Vim with full features
│   │   │   └── neovim.nix       # Neovim with plugins
│   │   ├── terminal/
│   │   │   ├── shell.nix        # Zsh + Powerlevel10k + Nushell
│   │   │   ├── ghostty.nix      # Modern terminal emulator
│   │   │   └── tmux.nix         # Terminal multiplexer
│   │   └── cli-tools.nix        # Modern CLI utilities
│   └── ⚙️ system/
│       ├── base.nix             # Core system (audio, network, locale)
│       ├── boot.nix             # GRUB dual boot configuration
│       ├── nvidia.nix           # NVIDIA RTX 2080 Super drivers
│       ├── keyboard.nix         # Keyboard settings
│       └── aliases.nix          # System-wide shell aliases
├── 📁 profiles/
│   ├── development.nix          # Development profile
│   └── gaming.nix               # Gaming profile (optional)
├── 👤 users/
│   └── pascha.nix               # ⚠️ Rename this to your username!
├── flake.nix                    # Main flake configuration
├── DUAL_BOOT_SETUP.md           # Desktop PC dual boot guide
└── README.md                    # You are here! 👋
```

## 🛠️ What's Included

### Development Environment
- **Editors**: VS Code, Vim (with themes & plugins), Neovim
- **Python**: Full Python 3 + pip user installation support + common packages
- **Node.js**: Multiple versions (20/22) + Bun + package managers
- **Version Control**: Git + GitHub CLI + GitUI with beautiful diffs
- **Containers**: Docker + docker-compose with user permissions

### Terminal Experience  
- **Shells**: Zsh (default) with Powerlevel10k + Nushell for structured data
- **Terminals**: Ghostty (modern GPU-accelerated) + Tmux (multiplexer)
- **Modern CLI Tools**: 
  - `bat` (better cat), `eza` (better ls), `ripgrep` (better grep)
  - `fd` (better find), `du-dust` (better du), `whois`, `nmap`
  - System monitoring: `htop`, `iotop`, `lsof`, `strace`

### System Features
- **Multi-Platform**: Framework Laptop 13 AMD AI 300 + Desktop PC Ryzen 7 5800X
- **Graphics**: NVIDIA RTX 2080 Super drivers (desktop) + Intel integrated (laptop)
- **Desktop**: KDE Plasma 6 with auto-login
- **Audio**: PipeWire for modern audio handling
- **Dual Boot**: Windows dual boot support (desktop PC)
- **Backup**: Borgmatic automated backup system

### Python Development
- **Full pip support**: User installations enabled with `PIP_USER=1`
- **Virtual environments**: virtualenv, virtualenvwrapper, pipenv, poetry
- **Common packages**: requests, numpy, pandas, matplotlib, pillow, yaml, click
- **Development tools**: black, flake8, pytest, ipython, jupyter

### Optional Gaming (Desktop PC)
- **Game managers**: Lutris, Bottles, Heroic  
- **Performance**: MangoHUD, Goverlay
- **Emulation**: RetroArch, Dolphin, PCSX2 (commented out)

## 🔧 Customization

### ⚠️ Before First Use - Username Anpassung

**WICHTIG**: Du musst "pascha" durch deinen Benutzernamen in folgenden Dateien ersetzen:

```bash
# 1. Benutzer-Datei umbenennen und anpassen
mv users/pascha.nix users/IHR_USERNAME.nix
nano users/IHR_USERNAME.nix  # users.users.pascha → users.users.IHR_USERNAME

# 2. Docker-Gruppe anpassen
nano modules/programs/development/docker.nix  # users.users.pascha → users.users.IHR_USERNAME

# 3. Backup-Service anpassen  
nano modules/programs/backup/borg.nix  # User = "pascha" → User = "IHR_USERNAME"

# 4. Auto-Login anpassen
nano modules/desktop/plasma.nix  # services.displayManager.autoLogin.user = "pascha"

# 5. Aliases anpassen (optional)
nano modules/system/aliases.nix  # Pfade von ~/pascha-nix-config anpassen

# 6. Profile-Imports anpassen
nano profiles/development.nix  # ../users/pascha.nix → ../users/IHR_USERNAME.nix  
nano profiles/gaming.nix       # ../users/pascha.nix → ../users/IHR_USERNAME.nix
```

### Adding Software
Edit the appropriate module and rebuild:

```bash
# Python packages
pip3 install --user PACKAGE_NAME

# Development tools
nano modules/programs/development/git.nix

# System packages  
nano modules/programs/cli-tools.nix

# User packages
nano users/IHR_USERNAME.nix

# Apply changes
sudo nixos-rebuild switch --flake .#framework-13  # or #desktop-pc
```

### Switching Between Profiles

```bash
# Development profile (default)
sudo nixos-rebuild switch --flake .#desktop-pc

# Gaming profile (desktop PC only)
# Change in flake.nix: ./profiles/development.nix → ./profiles/gaming.nix
# Then rebuild
```

## 📋 Useful Commands

```bash
# 🔄 Rebuild system
sudo nixos-rebuild switch --flake .#framework-13  # or #desktop-pc

# 🧪 Test changes (temporary)
sudo nixos-rebuild test --flake .#framework-13

# 📦 Update all packages
nix flake update && sudo nixos-rebuild switch --flake .#framework-13

# 🗑️ Clean old generations
sudo nix-collect-garbage -d

# 📟 Update Framework firmware (laptop only)
fwupdmgr update

# � Python package management
pip3 install --user PACKAGE_NAME
pip3 list --user
python3 -m venv myproject && source myproject/bin/activate

# 📊 System monitoring
htop          # Process monitor
iotop         # I/O monitor  
lsof          # Open files
whois domain.com
nmap -sn 192.168.1.0/24
```

## 🚨 Troubleshooting

### Rollback if something breaks
```bash
sudo nixos-rebuild switch --rollback
```

### Detailed error output
```bash
sudo nixos-rebuild switch --flake .#framework-13 --show-trace
```

### Check what changed
```bash
nixos-rebuild list-generations
```

### Python pip issues
```bash
# If pip installations fail, check environment variables
echo $PIP_USER
echo $PIP_BREAK_SYSTEM_PACKAGES
echo $PATH | grep .local

# Re-source shell configuration
source ~/.zshrc
```

## 🎯 Profiles

### Development Profile (Default)
- Full development stack (Python, Node.js, Docker)
- All editors and CLI tools
- Communication tools (Discord)
- Backup system

### Gaming Profile (Optional)  
- Everything from development profile
- Gaming platforms (Steam via separate module)
- Game launchers (Lutris, Bottles, Heroic)
- Performance tools (MangoHUD, Goverlay)

## 🤝 Contributing

Feel free to steal anything useful! This is a personal config, but PRs with improvements are welcome.

### Contribution Guidelines
- Keep modules focused and single-purpose
- Update this README when adding features
- Test changes on both laptop and desktop before committing  
- Remember to update username references in examples

## 📝 License

MIT - Do whatever you want with this config!

---

<div align="center">

**Made with ❄️ and ☕ for the NixOS community**

*NixOS: Because reproducible systems are beautiful*

**⚠️ Don't forget to replace "pascha" with your username before using! ⚠️**

</div>
