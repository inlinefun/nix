{
  colors,
  config,
  lib,
  pkgs,
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
      "niri/generated.kdl".text = ''
        layout {
            border {
                active-color "${colors.base0D}"
                inactive-color "${colors.base01}"
                urgent-color "${colors.base08}"
            }
        }
        spawn-at-startup "systemctl" "--user" "start" "hyprpaper.service"
      '';
    };

    dotfiles = {
      kitty.enable = true;
      hyprlock.enable = true;
      hyprpaper.enable = true;
      rofi.enable = true;
    };

    features.niri.enable = true;

    environment.systemPackages = with pkgs; [
      bibata-cursors
      brightnessctl
      hyprpicker
      playerctl
      wl-clipboard
    ];

  };

}
