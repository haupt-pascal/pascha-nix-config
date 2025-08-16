{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    extraConfig = ''
      # Better colors
      set -g default-terminal "screen-256color"
      
      # Mouse support
      set -g mouse on
      
      # Start windows and panes at 1
      set -g base-index 1
      setw -g pane-base-index 1
      
      # Better splitting
      bind | split-window -h
      bind - split-window -v
      
      # Reload config
      bind r source-file ~/.tmux.conf \; display-message "Config reloaded!"
      
      # Status bar
      set -g status-bg colour235
      set -g status-fg colour15
      set -g status-left-length 40
      set -g status-left "#[fg=colour39]Session: #S #[fg=colour240]"
      set -g status-right "#[fg=colour39]%d %b %R"
    '';
  };
  
  environment.systemPackages = with pkgs; [
    tmux
  ];
}
