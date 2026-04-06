{
  colors,
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.starship;
in
{

  options.features.starship = {
    enable = lib.mkEnableOption ''
      Whether to enable `starship`, a minimal, blazing-fast, and infinitely customizable prompt
    '';
    package = lib.mkOption {
      default = pkgs.starship;
      description = ''
        Specify a package of starship to use and configure
      '';
      type = lib.types.package;
    };
    style = lib.mkEnableOption ''
      Whether to style starship
    '';
  };

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      settings = lib.mkIf cfg.style {
        format = ''
          [ ](fg:green)$username[ ](fg:green bg:cyan)$directory[ ](fg:cyan bg:blue)$git_branch$git_status[ ](fg:blue bg:magenta)$cmd_duration[ ](fg:magenta)$line_break$character
        '';
        username = {
          style_root = "bold fg:background bg:green";
          style_user = "bold fg:background bg:green";
          show_always = true;
          format = "[ $user ]($style)";
        };
        directory = {
          truncation_length = 4;
          truncation_symbol = "../";
          truncate_to_repo = false;
          style = "bold fg:background bg:cyan";
          format = "[$path ]($style)";
          home_symbol = "~";
        };
        git_branch = {
          symbol = "󰘬";
          style = "bold fg:background bg:blue";
          format = "[$symbol ]($style)[$branch ]($style)";
        };
        git_status = {
          style = "bold fg:background bg:blue";
          format = "[[($all_status$ahead_behind )](bold fg:background bg:blue)]($style)";
        };
        cmd_duration = {
          min_time = 2000;
          show_milliseconds = false;
          format = "[ $duration]($style)";
          style = "bold fg:background bg:magenta";
        };
        "palette" = "default";
        palettes.default = {
          foreground = colors.base05;
          background = colors.base00;
          background_variant = colors.base02;
          red = colors.base08;
          yellow = colors.base0A;
          green = colors.base0B;
          cyan = colors.base0C;
          blue = colors.base0D;
          magenta = colors.base0E;
        };
      };
    };
    environment.systemPackages = [ pkgs.nerd-fonts.jetbrains-mono ];
  };

}
