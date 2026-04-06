{
  colors,
  config,
  lib,
  pkgs,
  username,
  ...
}:

let
  cfg = config.dotfiles.waywall;
  ninjabrain_bot = pkgs.fetchurl {
    url = "https://github.com/Ninjabrain1/Ninjabrain-Bot/releases/download/1.5.2/Ninjabrain-Bot-1.5.2.jar";
    hash = "sha256-mAmfYyGpDUrOwTQA6G0F96+NYOVjnC84Qn6WjccUUP8=";
  };
in
{

  options.dotfiles.waywall = {
    enable = lib.mkEnableOption ''
      Whether to configure `waywall`, a wayland compositor for minecraft speedrunning
    '';
  };

  config = lib.mkIf cfg.enable {

    homeDir.${username}.config.files = {
      "waywall/assets/eye_measure_overlay.png".source = ./src/assets/eye_measure_overlay.png;
      "waywall/assets/ninjabrain_bot.jar".source = ninjabrain_bot;
      "waywall/actions.lua".source = ./src/actions.lua;
      "waywall/appearance.lua".source = ./src/appearance.lua;
      "waywall/config.lua".source = ./src/config.lua;
      "waywall/init.lua".source = ./src/init.lua;
      "waywall/input.lua".source = ./src/input.lua;
      "waywall/mirrors.lua".source = ./src/mirrors.lua;
      "waywall/overlays.lua".source = ./src/overlays.lua;
      "waywall/remaps.lua".source = ./src/remaps.lua;
      "waywall/resolutions.lua".source = ./src/resolutions.lua;
      "waywall/shaders.lua".source = ./src/shaders.lua;
      "waywall/util.lua".source = ./src/util.lua;
      "waywall/colors.lua".text = ''
        return {
            background = "${colors.base00}",
            on_background = "${colors.base05}",
            primary = "${colors.base0D}",
            on_primary = "${colors.base00}",
            secondary = "${colors.base0C}",
            on_secondary = "${colors.base00}",
            container = "${colors.base01}",
            on_container = "${colors.base05}",
        }
      '';
    };
    packages.waywall.enable = true;
  };

}
