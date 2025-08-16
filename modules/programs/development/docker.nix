{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  users.users.pascha.extraGroups = [ "docker" ];
  
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
