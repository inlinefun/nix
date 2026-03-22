{
  config,
  lib,
  username,
  ...
}:

let
  cfg = config.dotfiles.hyprpaper;
in
{

  options.dotfiles.hyprpaper = {
    enable = lib.mkEnableOption "Whether to configure `hyprpaper`";
    wallpaper = lib.mkOption {
      type = lib.types.path;
      default = ./src/john-rodenn-castillo-rQqWOHZ96OM-unsplash.jpg;
      description = "Specify a wallpaper to configure hyprpaper with";
    };
    useRandom = lib.mkEnableOption "Whether to use any random wallpaper";
  };

  config = lib.mkIf cfg.enable {
    homeDir.${username}.config.files = {
      "hypr/hyprpaper.conf".text = ''
        wallpaper {
          monitor =
          path = ${if cfg.useRandom then ./src else cfg.wallpaper}
          fit_mode = cover
          # random order is applied only when a directory is passed, not a path to an image
          # order = random
        }
      '';
    };
  };

}
