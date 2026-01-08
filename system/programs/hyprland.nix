{ pkgs, ... }:

let
  packages = with pkgs; [
    kitty
  ];
in
{
  environment.systemPackages = packages;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
