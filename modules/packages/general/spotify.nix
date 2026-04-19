{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.spotify;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{

  options.packages.spotify = {
    enable = lib.mkEnableOption ''
      Whether to enable Spotify
    '';
  };

  config = lib.mkIf cfg.enable {
    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        aiBandBlocker
        hidePodcasts
        shuffle
      ];
    };
    settings.nix.allowedUnfree = [
      "spotify"
    ];
  };

}
