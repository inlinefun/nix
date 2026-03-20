{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.fonts;
  mkFontOption =
    basePackages:
    lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "Whether to enable installation of the font sets" // {
            default = true;
          };
          baseFontPackages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = basePackages;
            description = "Default font packages to include in the font set";
          };
          extraFontPackages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [ ];
            description = "Extra font packages to include in the font set";
          };
        };
      };
      default = { };
    };
  collectPackages = option: option.baseFontPackages ++ option.extraFontPackages;
in
{

  options.features.fonts = {
    enable = lib.mkEnableOption "Enable configuring default fonts" // {
      default = true;
    };
    core = mkFontOption (
      with pkgs;
      [
        adwaita-fonts
        noto-fonts
      ]
    );
    compat = mkFontOption (
      with pkgs;
      [
        noto-fonts-color-emoji
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
      ]
    );
    monospace = mkFontOption (
      with pkgs;
      [
        fira-code
        jetbrains-mono
        roboto-mono
      ]
    );
    nerdfonts = mkFontOption (
      with pkgs.nerd-fonts;
      [
        jetbrains-mono
        roboto-mono
      ]
    );
  };

  config = lib.mkIf cfg.enable {
    fonts.packages =
      lib.optionals cfg.core.enable (collectPackages cfg.core)
      ++ lib.optionals cfg.compat.enable (collectPackages cfg.compat)
      ++ lib.optionals cfg.monospace.enable (collectPackages cfg.monospace)
      ++ lib.optionals cfg.nerdfonts.enable (collectPackages cfg.nerdfonts);
  };

}
