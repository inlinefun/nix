{
  ...
}:

{

  services = {
    desktopManager.gnome.enable = true;
    displayManager.ly.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };

}
