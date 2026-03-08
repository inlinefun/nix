{ pkgs, ... }:

let
  packages = with pkgs; [
    bibata-cursors
    brightnessctl
    hyprlock
    hyprpaper
    hyprpicker
    hyprpolkitagent
    kitty
    matugen
    playerctl
    power-profiles-daemon
    quickshell
    rofi
    wl-clipboard
    xwayland-satellite
  ];
  gnomeApps = with pkgs; [
    baobab
    gnome-system-monitor
    gnome-font-viewer
    nautilus
  ];
  qtPackages = with pkgs.qt6Packages; [
    qt6ct
  ];
in
{

  environment.systemPackages = packages ++ gnomeApps ++ qtPackages;

  programs = {
    niri = {
      enable = true;
      useNautilus = true;
    };
  };

}
