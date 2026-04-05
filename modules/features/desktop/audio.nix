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
    enable = lib.mkEnableOption ''
      Whether to enable Pipewire for audio and video streams
    '';
    alsa = lib.mkEnableOption ''
      Whether to enable ALSA support in Pipewire
    '';
    jack = lib.mkEnableOption ''
      Whether to enable Jack support in Pipewire
    '';
    pulseAudio = lib.mkEnableOption ''
      Whether to enable PulseAudio support in Pipewire
    '';
  };

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = cfg.alsa;
      pulse.enable = cfg.pulseAudio;
      jack.enable = cfg.jack;
    };
  };

}
