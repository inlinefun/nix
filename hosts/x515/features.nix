{
  pkgs,
  ...
}:

{

  features = {
    audio = {
      enable = true;
      alsa = true;
      jack = true;
      pulseAudio = true;
    };
    bluetooth = {
      enable = true;
      enableOnBoot = false;
      enableServices = true;
    };
    compat = {
      enable = true;
      appImage = true;
      nixLD = true;
      nixLDLibraries = [ ];
    };
    displayManager = {
      enable = true;
      manager = "gdm";
    };
    firewall = {
      enable = true;
    };
    gaming = {
      enable = true;
      gamemode = true;
      gamescope = true;
      powerProfiles = true;
    };
    gnome.enable = true;
    gpg.enable = true;
    networkManager = {
      enable = true;
      connectivityChecking = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    niri = {
      enable = true;
      useNautilus = true;
      xwayland = true;
    };
    rust = {
      enable = true;
    };
  };

}
