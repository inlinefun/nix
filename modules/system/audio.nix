{
  config,
  lib,
  ...
}:

let
  cfg = config.cfg.audio;
in
{

  options.cfg.audio = {
    enable = lib.mkEnableOption "Enable the use of pipewire" // {
      default = true;
    };
    alsa = lib.mkEnableOption "Enable ALSA for pipewire";
    jack = lib.mkEnableOption "Enable Jack for pipewire";
    pulseaudio = lib.mkEnableOption "Enable ALSA for pipewire";
  };

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = cfg.alsa;
      jack.enable = cfg.jack;
      pulse.enable = cfg.pulseaudio;
    };
  };

}
