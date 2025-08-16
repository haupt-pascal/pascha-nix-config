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
  ];
}
