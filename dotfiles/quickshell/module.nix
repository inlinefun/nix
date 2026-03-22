{
  colors,
  config,
  lib,
  username,
  ...
}:

let
  cfg = config.dotfiles.quickshell;
in

{

  options.dotfiles.quickshell = {
    enable = lib.mkEnableOption "Whether to configure `quickshell`";
  };

  config = lib.mkIf cfg.enable {

    homeDir.${username}.config.files = {
      "quickshell/default".source = ./src;
      "quickshell/colors.json" = {
        generator = lib.generators.toJSON { };
        value = {
          base00 = colors.base00;
          base01 = colors.base01;
          base02 = colors.base02;
          base03 = colors.base03;
          base04 = colors.base04;
          base05 = colors.base05;
          base06 = colors.base06;
          base07 = colors.base07;
          base08 = colors.base08;
          base09 = colors.base09;
          base0A = colors.base0A;
          base0B = colors.base0B;
          base0C = colors.base0C;
          base0D = colors.base0D;
          base0E = colors.base0E;
          base0F = colors.base0F;
          base10 = colors.base10;
          base11 = colors.base11;
          base12 = colors.base12;
          base13 = colors.base13;
          base14 = colors.base14;
          base15 = colors.base15;
          base16 = colors.base16;
          base17 = colors.base17;
        };
      };
    };
  };

}
