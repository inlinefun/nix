{ pkgs, ... }:

let
  compatibility = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  general = with pkgs; [
    inter
    lato
    roboto
  ];
  monospace = with pkgs; [
    googlesans-code
    jetbrains-mono
  ];
  nerd = with pkgs.nerd-fonts; [
    jetbrains-mono
    roboto-mono
  ];
in
{
  fonts = {
    enableDefaultPackages = true;
    packages = compatibility ++ general ++ monospace ++ nerd;
  };
}
