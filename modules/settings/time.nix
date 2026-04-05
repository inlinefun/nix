{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.time;
in
{

  options.settings.time = {
    timeZone = lib.mkOption {
      default = "Asia/Kolkata";
      description = ''
        Specify a TimeZone for the system to use
      '';
      type = lib.types.str;
    };
    useLocalTime = lib.mkEnableOption ''
      Whether the time should be configured to use local time over the default of UTC time
      Useful for dual booting, windows appears to save time in local time by default
      To keep time in sync, set either windows to use UTC or set linux to use local time
    '';
  };

  config = {
    time = {
      timeZone = cfg.timeZone;
      hardwareClockInLocalTime = cfg.useLocalTime;
    };
  };

}
