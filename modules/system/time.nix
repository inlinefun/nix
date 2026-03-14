{
  config,
  lib,
  ...
}:

let
  cfg = config.cfg.time;
in
{

  options.cfg.time = {
    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "Asia/Kolkata";
      description = "Timezone for the system clock";
    };
    useUTC =
      lib.mkEnableOption ''
        Specify if system time is already used in UTC
        Disable if dual booting with windows AND windows does not UTC
      ''
      // {
        default = true;
      };
  };

  config = {
    time = {
      timeZone = cfg.timeZone;
      hardwareClockInLocalTime = !cfg.useUTC;
    };
  };

}
