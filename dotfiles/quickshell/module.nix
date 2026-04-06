{
  config,
  lib,
  pkgs,
  username,
  ...
}:

let
  cfg = config.dotfiles.quickshell;
  qtPackages = with pkgs.qt6Packages; [
    qt5compat
    qtbase
    qtdeclarative
    qtdoc
    qtlanguageserver
    qtquick3d
  ];
in
{

  options.dotfiles.quickshell = {
    enable = lib.mkEnableOption ''
      Whether to configure quickshell
    '';
  };

  config = lib.mkIf cfg.enable {
    homeDir.${username}.config.files = {

    };
    packages.quickshell.enable = true;
    userPackages.${username}.install =
      with pkgs;
      [
        bluez
        brightnessctl
        playerctl
        power-profiles-daemon
      ]
      ++ qtPackages;
  };

}
