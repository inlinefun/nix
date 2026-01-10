{ lib, pkgs, ... }:

let
  compat = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  general = with pkgs; [
    inter
  ];
  monospace = with pkgs; [
    jetbrains-mono
  ];
  nerd = with pkgs.nerd-fonts; [
    jetbrains-mono
    liberation
    roboto-mono
  ];
in
{
  fonts = {
    enableDefaultPackages = true;
    packages = compat ++ general ++ monospace ++ nerd;
  };
}
