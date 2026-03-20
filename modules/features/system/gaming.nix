{
  config,
  lib,
  ...
}:

let
  cfg = config.features.gaming;
in
{

  options.features.gaming = {
    enable = lib.mkEnableOption "Whether to enable compatibility tools for playing games";
    gamemode = lib.mkEnableOption "Whether to enable GameMode to optimise system performance on demand";
    gamescope = lib.mkEnableOption "Whether to enable gamescope, the SteamOS session compositing window manager";
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      (lib.mkIf cfg.gamemode {
        programs.gamemode.enable = true;
      })
      (lib.mkIf cfg.gamescope {
        programs.gamescope.enable = true;
      })
    ]
  );

}
