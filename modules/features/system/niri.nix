{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.niri;
in
{

  options.features.niri = {
    # i think that is what it is called
    enable = lib.mkEnableOption "Whether to enable niri, the scrolling wayland compositor";
    xwayland = lib.mkEnableOption "Whether to enable `xwayland-satellite` for xwayland app compat" // {
      default = true;
    };
    # why is only nautilus an option lol
    useNautilus = lib.mkEnableOption "Whether to enable nautilus as the primary file chooser" // {
      default = true;
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.niri;
      description = "Specify a package providing niri";
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        programs.niri = {
          enable = true;
          package = cfg.package;
          useNautilus = cfg.useNautilus;
        };
      }
      (lib.mkIf cfg.xwayland {
        environment.systemPackages = [ pkgs.xwayland-satellite ];
      })
      (lib.mkIf cfg.useNautilus {
        environment.systemPackages = [ pkgs.nautilus ];
      })
    ]
  );

}
