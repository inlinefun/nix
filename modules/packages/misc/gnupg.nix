{
  config,
  lib,
  ...
}:

let
  cfg = config.packages.gnupg;
in
{

  options.packages.gnupg = {
    enable = lib.mkEnableOption "Whether to enable GNUPG agent";
  };

  config = lib.mkIf cfg.enable {
    programs.gnupg = {
      agent.enable = true;
    };
  };

}
