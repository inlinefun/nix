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
    enable = lib.mkEnableOption ''
      Whether to enable Niri, the scrolling wayland compositor
    '';
    xwayland = lib.mkEnableOption ''
      Whether to enable the usage of `xwayland-satellite` for x11 app compat
    '';
    useNautilus = lib.mkEnableOption ''
      Whether to configure niri to use `nautilus` as the default file chooser
    '';
    package = lib.mkOption {
      default = pkgs.niri;
      description = ''
        Specify which package of `niri` to configure and use.
      '';
      type = lib.types.package;
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
        environment.systemPackages = with pkgs; [
          xwayland-satellite
        ];
      })
      (lib.mkIf cfg.useNautilus {
        environment.systemPackages = with pkgs; [
          nautilus
        ];
      })
    ]
  );

}
