{
  config,
  lib,
  ...
}:

let
  cfg = config.dotfiles.waywall;
in
{

  options.dotfiles.waywall = {
    enable = lib.mkEnableOption ''
      Whether to configure `waywall`, a wayland compositor for minecraft speedrunning
    '';
  };

  config = lib.mkIf cfg.enable {
    packages.waywall.enable = true;
  };

}
