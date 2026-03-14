{ pkgs, ... }:

{

  cfg = {
    audio = {
      enable = true;
      alsa = true;
      jack = true;
      pulseaudio = true;
    };
    desktop = {
      enable = true;
      desktopEnvironment = "gnome";
      loginManager = "gdm";
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    fonts = {
      enable = true;
      core = {
        enable = true;
        extraFonts = with pkgs; [
          inter
        ];
      };
      compat = {
        enable = true;
      };
      mono = {
        enable = true;
      };
      nerd = {
        enable = true;
      };
    };
    input = {
      enable = true;
      disableMouseAccel = true;
      disableTouchpadAccel = true;
      allowDragClicking = true;
    };
    locale = {
      default = "en_US.UTF-8";
      extraLocales = [
        "kn_IN/UTF-8"
        "hi_IN/UTF-8"
      ];
    };
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
        networkmanager-ssh
        networkmanager-sstp
      ];
    };
  };

}
