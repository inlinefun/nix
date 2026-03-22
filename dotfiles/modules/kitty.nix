{
  config,
  dots,
  lib,
  username,
  ...
}:

let
  cfg = config.dotfiles.kitty;
in
{

  options.dotfiles.kitty = {
    enable = lib.mkEnableOption "Whether to configure `kitty`";
  };

  config = lib.mkIf cfg.enable {
    homeDir.${username}.config.files = {
      "kitty".source = dots + "/kitty";
    };
  };

}
