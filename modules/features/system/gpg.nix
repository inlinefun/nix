{
  config,
  lib,
  ...
}:

let
  cfg = config.features.gpg;
in
{

  options.features.gpg = {
    enable = lib.mkEnableOption ''
      Whether to enable the GPG Agent
    '';
  };

  config = lib.mkIf cfg.enable {
    programs.gnupg = {
      agent = {
        enable = true;
      };
    };
  };

}
