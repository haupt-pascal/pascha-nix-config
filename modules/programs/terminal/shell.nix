{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    
    ohMyZsh = {
      enable = true;
      plugins = [ 
        "git" "docker" "node" "npm" "golang" "rust" "python" 
        "sudo" "history" "colored-man-pages" "tmux"
      ];
      theme = "";
    };
    
    interactiveShellInit = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      
      # FNM (Fast Node Manager) setup
      if command -v fnm >/dev/null 2>&1; then
        eval "$(fnm env --use-on-cd --shell zsh)"
      fi
      
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
    
    shellAliases = {
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
    };
  };
  
  users.defaultUserShell = pkgs.zsh;
  
  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    eza
    bat
    ripgrep
    fd
    nushell                    # Modern shell with structured data support
  ];
  
  # Create Nushell config directory and files
  environment.etc."nushell/config.nu".text = ''
    # Nushell configuration
    $env.config = {
      show_banner: false
      completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "fuzzy"
      }
      history: {
        max_size: 10000
        sync_on_enter: true
        file_format: "plaintext"
      }
      edit_mode: emacs
      table: {
        mode: rounded
        index_mode: always
        show_empty: true
      }
      use_grid_icons: true
      use_ansi_coloring: true
      use_ls_colors: true
    }
    
    # Custom aliases for Nushell
    alias ll = ls -la
    alias la = ls -la  
    alias c = clear
    alias q = exit
    alias grep = rg
    alias find = fd
    
    # Git aliases
    alias gs = git status
    alias ga = git add
    alias gc = git commit
    alias gp = git push
    alias gl = git pull
  '';
  
  environment.etc."nushell/env.nu".text = ''
    # Environment variables for Nushell
    $env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.local/bin")
    $env.EDITOR = "nano"
    $env.BROWSER = "firefox"
  '';
}
