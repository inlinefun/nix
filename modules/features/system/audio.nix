{
  config,
  lib,
  ...
}:

let
  cfg = config.features.audio;
in
{

  options.features.audio = {
    enable = lib.mkEnableOption "Whether to enable PipeWire service" // {
      default = true;
    };
    alsa = lib.mkEnableOption "Whether to enable ALSA support";
    jack = lib.mkEnableOption "Whether to enable JACK audio emulation";
    pulse = lib.mkEnableOption "Whether to enable PulseAudio server emulation";
  };

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = cfg.alsa;
      jack.enable = cfg.jack;
      pulse.enable = cfg.pulse;
    };
  };

}
