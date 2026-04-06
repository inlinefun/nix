{
  colors,
  lib,
  username,
  ...
}:

{

  config = {
    homeDir.${username}.files = {
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
