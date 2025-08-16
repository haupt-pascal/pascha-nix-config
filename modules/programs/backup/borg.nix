{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        borgbackup
        borgmatic
    ];

    systemd.services.borgmatic = {
    description = "Borgmatic Backup";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    
    serviceConfig = {
      Type = "oneshot";
      User = "pascha";
      Group = "users";
      ExecStart = "${pkgs.borgmatic}/bin/borgmatic";
      
      Environment = [
        "HOME=/home/pascha"
        "PATH=${pkgs.borgbackup}/bin:${pkgs.borgmatic}/bin"
      ];
    };
  };

  systemd.timers.borgmatic = {
    description = "Run borgmatic backup daily";
    wantedBy = [ "timers.target" ];
    
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      RandomizedDelaySec = "15m";
    };
  };

  systemd.timers.borgmatic.enable = true;
  
}