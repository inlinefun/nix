{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.cfg.fonts;
  fontOption = lib.types.submodule {
    options = {
      enable = lib.mkEnableOption "Enable the use of the font set" // {
        default = true;
      };

      extraFonts = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
        description = "Extra font packages to add along with the defaults";
      };
    };
  };
in
{
  options.cfg.fonts = {
    enable = lib.mkEnableOption "Enable font configuration and default fonts";

    compat = lib.mkOption {
      default = {
        enable = true;
      };
      description = "Compatibility font packages";
      type = fontOption;
    };

    core = lib.mkOption {
      default = {
        enable = true;
      };
      description = "Core font packages";
      type = fontOption;
    };

    mono = lib.mkOption {
      default = {
        enable = true;
      };
      description = "Monospace font packages";
      type = fontOption;
    };

    nerd = lib.mkOption {
      default = {
        enable = false;
      };
      description = "Nerd font packages";
      type = fontOption;
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.packages =
      lib.optionals cfg.core.enable (
        (with pkgs; [
          adwaita-fonts
          noto-fonts
          roboto
        ])
        ++ cfg.core.extraFonts
      )
      ++ lib.optionals cfg.compat.enable (
        (with pkgs; [
          noto-fonts-cjk-sans
          noto-fonts-cjk-serif
          noto-fonts-color-emoji
        ])
        ++ cfg.compat.extraFonts
      )
      ++ lib.optionals cfg.nerd.enable (
        (with pkgs.nerd-fonts; [
          jetbrains-mono
          roboto-mono
        ])
        ++ cfg.nerd.extraFonts
      )
      ++ lib.optionals cfg.mono.enable (
        (with pkgs; [
          googlesans-code
          jetbrains-mono
          roboto-mono
        ])
        ++ cfg.mono.extraFonts
      );
  };
}
