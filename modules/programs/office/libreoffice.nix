{ config, pkgs, ... }:

let
  office = pkgs.libreoffice-qt6-fresh;
  # If uno python development is needed uncomment below and switch to -fresh-unwrapped variant
  # office = pkgs.libreoffice-fresh-unwrapped;
in {
  environment.systemPackages = with pkgs; [
    libreoffice-qt6-fresh
    hunspell
    # Add or adjust dictionaries as needed
    hunspellDicts.en_US
    hunspellDicts.de_DE
  ];

  # UNO Python integration (optional). Uncomment if you need Python uno library.
  # environment.sessionVariables = {
  #   PYTHONPATH = "${office}/lib/libreoffice/program";
  #   URE_BOOTSTRAP = "vnd.sun.star.pathname:${office}/lib/libreoffice/program/fundamentalrc";
  # };
}
