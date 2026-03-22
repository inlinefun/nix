{
  colors,
  config,
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
      "niri/appearance.kdl".source = ./src/appearance.kdl;
      "niri/binds.kdl".source = ./src/binds.kdl;
      "niri/config.kdl".source = ./src/config.kdl;
      "niri/devices.kdl".source = ./src/devices.kdl;
      "niri/misc.kdl".source = ./src/misc.kdl;
      "niri/rules.kdl".source = ./src/rules.kdl;
      "niri/colors.kdl".text = ''
        layout {
            border {
                active-color "${colors.base0D}"
                inactive-color "${colors.base01}"
                urgent-color "${colors.base08}"
            }
        }
      '';
    };
  };

}
