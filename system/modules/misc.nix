{ pkgs, ... }:

{

  fonts = {
    enableDefaultPackages = true;
    # fontconfig = {
    #   antialias = true;
    #   hinting.style = "full";
    # };
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-extra

      roboto
      inter
      ubuntu-sans
      roboto

      nerd-fonts.jetbrains-mono
      nerd-fonts.roboto-mono
      inter-nerdfont
    ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

}
