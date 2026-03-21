{
  config,
  dots,
  lib,
  username,
  ...
}:

let
  cfg = config.dotfiles.niri;
in
{

  options.dotfiles.niri = {
    enable = lib.mkEnableOption "Whether to configure `niri`";
  };

  config = lib.mkIf cfg.enable {
    homeDir.${username}.config.files = {
      # @TODO: coloring through a color palette
      "niri" = {
        source = dots + "/niri";
      };
    };
  };

}
