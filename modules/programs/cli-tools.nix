{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Network tools
    whois              # Domain/IP information lookup
    dig                # DNS lookup utility
    nmap               # Network discovery and security auditing
    netcat-gnu         # Network utility for reading/writing network connections
    tcpdump            # Network packet analyzer
    wireshark-cli      # Network protocol analyzer (CLI)
    curl               # Command line tool for transferring data
    wget               # Network downloader
    rsync              # File synchronization tool
    
    # System monitoring and process management
    htop               # Interactive process viewer
    iotop              # I/O monitoring
    lsof               # List open files
    strace             # System call tracer
    ltrace             # Library call tracer
    pstree             # Display running processes as a tree
    
    # File and text utilities
    tree               # Display directory tree
    file               # Determine file type
    which              # Locate command
    findutils          # Find utilities (find, xargs, etc.)
    ripgrep            # Fast text search (modern grep alternative)
    fd                 # Fast and user-friendly alternative to find
    bat                # Cat with syntax highlighting
    eza                # Modern ls replacement (successor to exa)
    du-dust            # More intuitive du
    
    # Archive and compression
    unzip              # Extract ZIP archives
    zip                # Create ZIP archives
    p7zip              # 7-Zip archive utility
    gzip               # GNU compression utility
    bzip2              # Block-sorting file compressor
    xz                 # XZ compression utility
    
    # System utilities
    usbutils           # USB utilities (lsusb)
    pciutils           # PCI utilities (lspci)
    psmisc             # Utilities for /proc filesystem (killall, fuser)
    procps             # Process utilities (ps, top, etc.)
    util-linux         # Essential system utilities
    
    # Text editors and pagers
    less               # Terminal pager
    nano               # Simple text editor
    
    # Development and debugging
    gdb                # GNU debugger
    binutils           # Binary utilities (objdump, nm, etc.)
    hexdump            # Hexadecimal dump
    
    # Version control (if not already included)
    git                # Distributed version control
    
    # Security tools
    gnupg              # GNU Privacy Guard
    openssl            # SSL/TLS toolkit
    
    # Time and scheduling
    cron               # Job scheduler
  ];

  # Enable some services that are commonly expected
  services.locate.enable = true;  # Enable locate/updatedb for fast file searching
  
  # Ensure cron service is enabled
  services.cron.enable = true;
}
