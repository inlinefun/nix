{
  colors,
  lib,
  username,
  ...
}:

{

  config = {
    homeDir.${username}.files = {
      ".scheme.json" = {
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
      ".colors.json" = {
        generator = lib.generators.toPretty { };
        value = {
          background = colors.base00;
          background_variant = colors.base01;
          background_dark = colors.base11;
          foreground = colors.base05;
          foreground_variant = colors.base06;
          foreground_bright = colors.base07;
          red = colors.base08;
          orange = colors.base09;
          yellow = colors.base0A;
          green = colors.base0B;
          cyan = colors.base0C;
          blue = colors.base0D;
          magenta = colors.base0E;
        };
      };
    };
  };

}
