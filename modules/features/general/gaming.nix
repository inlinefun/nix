{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.gaming;
in
{

  options.features.gaming = {
    enable = lib.mkEnableOption ''
      Whether to enable support, compatibility or QOL tools for gaming
    '';
    gamemode =
      lib.mkEnableOption ''
        Whether to enable GameMode to optimize system performance on demand
      ''
      // {
        default = true;
      };
    gamescope = lib.mkEnableOption ''
      Whether to enable GameScope, the SteamOS session compositing window manager
    '';
    powerProfiles =
      lib.mkEnableOption ''
        Whether to enable power profiles daemon, to use switch between power profiles
      ''
      // {
        default = true;
      };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      (lib.mkIf cfg.gamemode {
        programs.gamemode = {
          enable = true;
          enableRenice = true;
        };
      })
      (lib.mkIf cfg.gamescope {
        programs.gamescope.enable = true;
      })
      (lib.mkIf cfg.powerProfiles {
        environment.systemPackages = [
          pkgs.power-profiles-daemon
        ];
      })
    ]
  );

}
