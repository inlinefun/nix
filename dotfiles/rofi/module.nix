{
  colors,
  config,
  lib,
  pkgs,
  username,
  ...
}:

let
  cfg = config.dotfiles.rofi;
in
{

  options.dotfiles.rofi = {
    enable = lib.mkEnableOption "Whether to configure `rofi`";
  };

  config = lib.mkIf cfg.enable {
    homeDir.${username}.config.files = {
      "rofi/config.rasi".source = ./src/config.rasi;
      "rofi/colors.rasi".text = ''
        * {
          primary: ${colors.base0D};
          background: ${colors.base00};
          foreground: ${colors.base05};
          background-variant: ${colors.base01};
        }
      '';
    };
    userPackages.${username}.install = with pkgs; [ rofi ];
  };

}
