{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.fonts;
in
{

  options.settings.fonts = {
    enable = lib.mkEnableOption ''
      Whether to enable the installation of font packages
    '';
    baseFonts = lib.mkOption {
      default = with pkgs; [
        adwaita-fonts
        ibm-plex
        jetbrains-mono
        noto-fonts
        roboto
      ];
      description = ''
        A list of base packages for overriding, to be used to disable installing any base font packages
      '';
      type = lib.types.listOf lib.types.package;
    };
    extraFonts = lib.mkOption {
      default = [ ];
      description = ''
        A list of font packages to install
      '';
      type = lib.types.listOf lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    fonts = {
      enableDefaultPackages = true;
      packages = cfg.baseFonts ++ cfg.extraFonts;
    };
  };

}
