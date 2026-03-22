{
  colors,
  config,
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
      "kitty/kitty.conf".source = ./src/kitty.conf;
      "kitty/colors.conf".text = ''
        cursor                          ${colors.base07}
        cursor_text_color               ${colors.base05}

        background                      ${colors.base00}
        foreground                      ${colors.base05}
        selection_background            ${colors.base05}
        selection_foreground            ${colors.base00}

        # base colors
        # red, green, yellow, blue, magenta, cyan
        color1                          ${colors.base08}
        color2                          ${colors.base0B}
        color3                          ${colors.base0A}
        color4                          ${colors.base0D}
        color5                          ${colors.base0E}
        color6                          ${colors.base0C}

        # bright colors
        # red, green, yellow, blue, magenta, cyan
        color9                          ${colors.base12}
        color10                         ${colors.base14}
        color11                         ${colors.base13}
        color12                         ${colors.base16}
        color13                         ${colors.base17}
        color14                         ${colors.base15}
      '';
    };
  };

}
