{
  lib,
  palette,
  username,
  ...
}:

{

  config = {
    homeDir.${username}.files = {
      ".color-palette.json" = {
        generator = lib.generators.toJSON { };
        value = {
          base00 = palette.base00;
          base01 = palette.base01;
          base02 = palette.base02;
          base03 = palette.base03;
          base04 = palette.base04;
          base05 = palette.base05;
          base06 = palette.base06;
          base07 = palette.base07;
          base08 = palette.base08;
          base09 = palette.base09;
          base0A = palette.base0A;
          base0B = palette.base0B;
          base0C = palette.base0C;
          base0D = palette.base0D;
          base0E = palette.base0E;
          base0F = palette.base0F;
          base10 = palette.base10;
          base11 = palette.base11;
          base12 = palette.base12;
          base13 = palette.base13;
          base14 = palette.base14;
          base15 = palette.base15;
          base16 = palette.base16;
          base17 = palette.base17;
        };
      };
    };
  };

}
