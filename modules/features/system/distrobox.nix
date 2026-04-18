{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.distrobox;
in
{

  options.features.distrobox = {
    enable = lib.mkEnableOption ''
      Whether to enable distrobox,
    '';
  };

  config = lib.mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
    environment.systemPackages = with pkgs; [
      distrobox
    ];
  };

}
