# ❄️ nix-config

> My personal NixOS configuration for the Framework Laptop 13 (AMD AI 300 Series)

<div align="center">

![NixOS](https://img.shields.io/badge/NixOS-5277C3?style=for-the-badge&logo=nixos&logoColor=white)
![Framework](https://img.shields.io/badge/Framework-FF6B35?style=for-the-badge&logo=framework&logoColor=white)
![KDE](https://img.shields.io/badge/KDE-1D99F3?style=for-the-badge&logo=kde&logoColor=white)

</div>

A clean, modular NixOS configuration that just works™️

## ✨ Features

- 🖥️ **Desktop**: KDE Plasma 6 with auto-login
- ⚡ **Hardware**: Full Framework Laptop 13 AMD AI 300 support
- 🛠️ **Development**: Complete dev environment with modern tooling
- 🐳 **Container**: Docker ready for development
- 🎨 **Terminal**: Beautiful Zsh + Powerlevel10k setup
- 📦 **Modular**: Clean structure for easy maintenance

## 🚀 Quick Start

```bash
# Clone this repository
git clone https://github.com/yourusername/nix-config ~/pascha-nix-config
cd ~/pascha-nix-config

# Copy your hardware configuration
sudo cp /etc/nixos/hardware-configuration.nix hosts/framework-13/

# Apply configuration
sudo nixos-rebuild switch --flake .#framework-13

# Reboot to ensure all hardware modules load correctly
sudo reboot
```

## 📂 Structure

```
❄️ nix-config/
├── 📁 hosts/
│   └── 🖥️ framework-13/           # Host-specific configuration
│       ├── default.nix           # Main host config
│       ├── configuration.nix     # Base system settings
│       └── hardware-configuration.nix
├── 📁 modules/
│   ├── 🖥️ desktop/
│   │   └── plasma.nix            # KDE Plasma 6 setup
│   ├── 💻 programs/
│   │   └── development.nix       # Development tools & editors
│   ├── 🔧 services/
│   │   └── docker.nix           # Docker configuration
│   └── ⚙️ system/
│       ├── base.nix             # Core system configuration
│       └── shell.nix            # Zsh + Powerlevel10k + Aliases
├── 👤 users/
│   └── pascha.nix               # User configuration
├── flake.nix                    # Main flake configuration
└── README.md                    # You are here! 👋
```

## 🛠️ What's Included

### Development Environment
- **Editors**: VS Code, Vim (with themes & language support), Neovim
- **Languages**: Node.js, Bun, Git
- **Terminal**: Ghostty, Zsh with Starship prompt
- **Tools**: GitHub CLI, GitUI, Docker

### System Features
- **Framework Support**: Latest kernel, power management, firmware updates
- **Audio**: PipeWire for modern audio handling
- **Bluetooth**: Ready to use out of the box
- **Printing**: CUPS enabled

### Vim Configuration
Includes syntax highlighting and themes for:
- 🎨 **Themes**: Gruvbox, Nord, OneDark
- 📝 **Languages**: YAML, JSON, JavaScript, TypeScript, Rust, Go, Python, Nix, Markdown
- 🔧 **Plugins**: NERDTree, Git integration, fuzzy search, multiple cursors

## 🔧 Customization

### Adding Software
Edit the appropriate module and rebuild:

```bash
# Development tools
nano modules/programs/development.nix

# System services
nano modules/services/docker.nix

# User packages
nano users/pascha.nix

# Apply changes
sudo nixos-rebuild switch --flake .#framework-13
```

### Adding New Modules
1. Create new module file in appropriate directory
2. Add import to `flake.nix`
3. Rebuild system

## 📋 Useful Commands

```bash
# 🔄 Rebuild system
sudo nixos-rebuild switch --flake .#framework-13

# 🧪 Test changes (temporary)
sudo nixos-rebuild test --flake .#framework-13

# 📦 Update all packages
nix flake update && sudo nixos-rebuild switch --flake .#framework-13

# 🗑️ Clean old generations
sudo nix-collect-garbage -d

# 📟 Update Framework firmware
fwupdmgr update

# 📊 Check system status
systemctl status power-profiles-daemon
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

## 🎯 Future Plans

- [ ] Home Manager integration for dotfiles
- [ ] Multiple host configurations (desktop, server)
- [ ] Custom overlays for packages
- [ ] Automatic system updates

## 🤝 Contributing

Feel free to steal anything useful! This is a personal config, but PRs with improvements are welcome.

## 📝 License

MIT - Do whatever you want with this config!

---

<div align="center">

**Made with ❄️ and ☕ for the Framework community**

*NixOS: Because reproducible systems are beautiful*

</div>
