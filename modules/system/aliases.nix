{ config, pkgs, ... }:

{
  programs.zsh.shellAliases = {
    # System
    ll = "eza -la --icons";
    la = "eza -la --icons"; 
    ls = "eza --icons";
    tree = "eza --tree --icons";
    c = "clear";
    q = "exit";
    reload = "source ~/.zshrc";
    cat = "bat";
    grep = "rg";
    find = "fd";
    
    # NixOS
    nrs = "sudo nixos-rebuild switch --flake ~/pascha-nix-config#framework-13";
    nrt = "sudo nixos-rebuild test --flake ~/pascha-nix-config#framework-13";
    nfu = "cd ~/pascha-nix-config && nix flake update";
    ncc = "sudo nix-collect-garbage -d";
    nls = "nixos-rebuild list-generations";
    
    # Git
    gs = "git status";
    ga = "git add .";
    gc = "git commit -m";
    gca = "git commit -am";
    gp = "git push";
    gpl = "git pull";
    gl = "git log --oneline";
    gd = "git diff";
    gb = "git branch";
    gco = "git checkout";
    
    # Docker
    d = "docker";
    dc = "docker-compose";
    dps = "docker ps";
    di = "docker images";
    up = "docker compose up -d";
    down = "docker compose down";
    
    # Development
    serve = "python -m http.server 8000";
    myip = "curl ifconfig.me";
    ports = "netstat -tuln";
    weather = "curl wttr.in";
  };
}
