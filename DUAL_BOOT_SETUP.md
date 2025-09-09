# Desktop PC Config Installation

## Übersicht
- **Hardware:** Desktop PC (AMD Ryzen 7 5800X + RTX 2080 Super)
- **Setup:** Dual Boot mit Windows (separate Festplatten)
- **Profil:** Development/Work (gleiche Software wie Framework-13)
- **Voraussetzung:** NixOS bereits installiert und funktionsfähig

## Installation der Configs

### 1. Konfiguration laden

**Option A: Git Clone (empfohlen)**
```bash
# Klone die komplette Konfiguration
git clone https://github.com/haupt-pascal/pascha-nix-config.git /etc/nixos-config
```

**Option B: ZIP Download**
```bash
# Falls Git nicht verfügbar ist
sudo mkdir -p /etc/nixos-config

# Download ZIP
curl -L https://github.com/haupt-pascal/pascha-nix-config/archive/main.zip -o /tmp/config.zip

# Entpacke
cd /tmp
unzip config.zip
sudo cp -r pascha-nix-config-main/* /etc/nixos-config/
```

### 2. System rebuilden
```bash
# Konfiguration anwenden
cd /etc/nixos-config
sudo nixos-rebuild switch --flake .#desktop-pc
```

**Wichtig:** 
- Nutzt die desktop-pc Hardware-Konfiguration
- NVIDIA RTX 2080 Super wird automatisch konfiguriert
- Development-Tools werden installiert

### 3. Reboot (optional)

```bash
# Empfohlen nach größeren Änderungen
sudo reboot
```

## Was installiert wird

**Desktop Software:**
- KDE Plasma Desktop
- VS Code, Vim, Neovim  
- Git, Node.js, Docker
- Terminal: Ghostty, Tmux
- Discord, Borg Backup

**Hardware:**
- NVIDIA RTX 2080 Super Treiber (development-optimiert)
- AMD Ryzen 7 5800X Optimierungen  
- Dual Boot automatisch (Windows wird erkannt)

## Troubleshooting

### Node.js Setup

**Standard:** Node.js 22 ist system-weit verfügbar (aus Nixpkgs).

```bash
# Node.js Version prüfen
node --version  # v22.x.x
npm --version   # Sollte funktionieren

# Für AdonisJS direkt verwenden:
npm init adonisjs@latest webmon_api -- --db=postgres --kit=api
```

**Für andere Node.js Versionen:** 
```bash
# Temporär Node.js 20 nutzen
nix-shell -p nodejs_20 nodePackages.npm

# Projekt-spezifische shell.nix erstellen:
echo 'with import <nixpkgs> {}; mkShell { buildInputs = [ nodejs_20 nodePackages.npm postgresql ]; }' > shell.nix
nix-shell
```

**Hinweis:** FNM wurde entfernt da es generische Linux-Binaries lädt, die auf NixOS nicht funktionieren.

### Config Updates von GitHub
```bash
cd /etc/nixos-config
git pull
sudo nixos-rebuild switch --flake .#desktop-pc
```

### Lokale Änderungen

```bash
# Nach lokalen Änderungen rebuilden:
cd /etc/nixos-config
sudo nixos-rebuild switch --flake .#desktop-pc
```

### Hardware-spezifische Anpassungen

Falls du andere Hardware als Ryzen 7 5800X + RTX 2080 Super hast:
```bash
# Hardware-Konfiguration neu generieren:
sudo nixos-generate-config --dir /tmp
# Dann relevante Teile in hosts/desktop-pc/hardware-configuration.nix übernehmen
```

## Erfolgreich! 🎉

Nach der Config-Installation hast du:
- ✅ Desktop PC Development-Umgebung 
- ✅ NVIDIA RTX 2080 Super Support
- ✅ KDE Plasma + alle Development-Tools
- ✅ Automatische Updates via Git
- ✅ Gleiche Software wie auf dem Framework-13

**Happy Coding! 🚀**
