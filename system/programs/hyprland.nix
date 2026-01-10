{ pkgs, ... }:

let
  packages = with pkgs; [
    bibata-cursors
    hyprcursor
    hyprland-qt-support
    hyprland-protocols
    hyprlock
    hyprpaper
    hyprpolkitagent
    kitty
    matugen
    mako
    rofi
  ];
in
{
  environment.systemPackages = packages;
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
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
