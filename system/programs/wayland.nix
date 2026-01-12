{ pkgs, ... }:

let
  packages = with pkgs; [
    bibata-cursors
    brightnessctl
    grim
    hyprcursor
    hyprland-qt-support
    hyprland-protocols
    hyprlock
    hyprpaper
    hyprpicker
    hyprpolkitagent
    kitty
    mako
    matugen
    playerctl
    power-profiles-daemon
    quickshell
    slurp
    starship
    rofi
    wl-clipboard
    xwayland-satellite
  ];
  qt6Packages = with pkgs.qt6Packages; [
    qt6ct
  ];
in
{
  environment.systemPackages = packages ++ qt6Packages;
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    niri.enable = true;
    starship.enable = true;
    uwsm = {
      enable = true;
      waylandCompositors = {
        hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/start-hyprland";
        };
      };
    };
  };
}
