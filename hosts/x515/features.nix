{ pkgs, ... }:

{
  features = {
    audio = {
      enable = true;
      alsa = true;
      jack = true;
      pulse = true;
    };
    compatibility = {
      enable = true;
      appimage = true;
      nixld = true;
      xwayland = true;
    };
    displayManager = {
      enable = true;
      manager = "gdm";
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    fonts = {
      core = {
        enable = true;
        extraFontPackages = with pkgs; [
          roboto
          inter
          ibm-plex
        ];
      };
      compat = {
        enable = true;
      };
      monospace = {
        enable = true;
        extraFontPackages = with pkgs; [
          googlesans-code
        ];
      };
      nerdfonts = {
        enable = true;
      };
    };
    gnome = {
      enable = true;
      debug = false;
    };
    libinput = {
      enable = true;
      disableMouseAccel = true;
      disableTouchpadAccel = false;
      allowDragClicking = true;
    };
    niri = {
      enable = true;
      xwayland = true;
      useNautilus = true;
    };
  };
}
