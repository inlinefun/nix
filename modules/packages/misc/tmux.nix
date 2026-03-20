{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.tmux;
in
{

  options.packages.tmux = {
    enable = lib.mkEnableOption "Whether to enable tmux, a terminal multiplexer";
    use12HourClock = lib.mkEnableOption "Whether tmux should use a 12h clock format";
    plugins = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs.tmuxPlugins; [
        catppuccin
      ];
    };
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      clock24 = !cfg.use12HourClock;
      plugins = cfg.plugins;
    };
  };

}
