{
  colors,
  config,
  lib,
  pkgs,
  username,
  ...
}:

let
  cfg = config.dotfiles.hyprlock;
in
{

  options.dotfiles.hyprlock = {
    enable = lib.mkEnableOption ''
      Whether to configure `hyprlock`
    '';
  };

  config = lib.mkIf cfg.enable {
    homeDir.${username}.config.files = {
      "hypr/hyprlock.conf".text = ''
        $font = IBM Plex Sans

        general {
            hide_cursor = true
            ignore_empty_input = true
        }

        animations {
            enabled = true

            bezier = e_decel, 0.05, 0.7, 0.1, 1.0
            bezier = linear, 1, 1, 1, 1

            animation = fadeIn, 1, 4, e_decel
            animation = fadeOut, 1, 2.5, e_decel

            animation = inputFieldColors, 1, 2, linear
            animation = inputFieldDots, 1, 2, linear
            animation = inputFieldFade, 1, 2, linear
            animation = inputFieldWidth, 1, 2, linear
        }

        background {
            monitor =
            path = screenshot
            blur_passes = 3
        }

        input-field {
            monitor =
            size = 200, 40
            invert_numlock = true
            fade_on_empty = false
            hide_input = false
            inner_color = rgb(${lib.strings.removePrefix "#" colors.base00})
            outer_color = rgb(${lib.strings.removePrefix "#" colors.base05})
            font_color = rgb(${lib.strings.removePrefix "#" colors.base05})
            fail_color = rgb(${lib.strings.removePrefix "#" colors.base08})
            check_color = rgb(${lib.strings.removePrefix "#" colors.base0D})
            outline_thickness = 2
            rounding = 5
            placeholder_text = <i> Password </i>
            halign = center
            valign = center
            position = 0, -60
        }

        label {
            monitor =
            text = $TIME12
            font_family = $font
            font_size = 72
            halign = center
            valign = center
            position = 0, 80
        }
      '';
    };
    userPackages.${username}.install = with pkgs; [
      ibm-plex
      hyprlock
    ];
  };

}
