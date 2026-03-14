{
  config,
  lib,
  username,
  ...
}:

let
  cfg = config.dots.waywall;
in
{

  options.dots.waywall = {
    enable = lib.mkEnableOption "Configure waywall";
  };

  config = lib.mkIf cfg.enable {
    dotfiles.${username} = {
      ".config/waywall".source = ./src;
    };
  };

}
