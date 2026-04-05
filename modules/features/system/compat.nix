{
  config,
  lib,
  ...
}:

let
  cfg = config.features.compat;
in
{

  options.features.compat = {
    enable = lib.mkEnableOption ''
      Whether to enable compatibility tweaks for a higher(not really) chance running apps off the internet without much of a hassle
    '';
    appImage = lib.mkEnableOption ''
      Whether to enable the 'appimage-run' wrapper script for running `.AppImage`s
    '';
    nixLD = lib.mkEnableOption "Whether to enable `nix-ld`" // {
      default = true;
    };
    nixLDLibraries = lib.mkOption {
      default = [ ];
      description = ''
        A list of packages to add as libraries to `nix-ld`
      '';
      type = lib.types.listOf lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      (lib.mkIf cfg.appImage {
        programs.appimage.enable = true;
      })
      (lib.mkIf cfg.nixLD {
        programs.nix-ld = {
          enable = true;
          libraries = cfg.nixLDLibraries;
        };
      })
    ]
  );

}
