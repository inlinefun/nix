{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.spotify;
in
{

  options.packages.spotify = {
    enable = lib.mkEnableOption ''
      Whether to enable Spotify
    '';
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nur.repos.nltch.spotify-adblock
    ];
    settings.nix.allowedUnfree = [
      "spotify"
    ];
  };

}
