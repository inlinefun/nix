{
  config,
  lib,
  ...
}:

let
  cfg = config.features.compatibility;
in
{

  options.features.compatibility = {
    enable =
      lib.mkEnableOption "Whether to enable compatibility tweaks for a higher chance running apps off the internet without much of a hassle"
      // {
        default = true;
      };
    appimage = lib.mkEnableOption "Whether to enable appimage-run wrapper script for executing appimages";
    commonLibraries = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "List of packages to include";
    };
    nixld = lib.mkEnableOption "Whether to enable nix-ld";
    xwayland =
      lib.mkEnableOption "Whether to enable Xwayland (an X server for interfacing X11 apps with the Wayland protocol)"
      // {
        default = true;
      };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      (lib.mkIf cfg.appimage {
        programs.appimage.enable = true;
      })
      (lib.mkIf cfg.nixld {
        programs.nix-ld = {
          enable = true;
          libraries = cfg.commonLibraries;
        };
      })
      (lib.mkIf cfg.xwayland {
        programs.xwayland.enable = true;
      })
    ]
  );

}
