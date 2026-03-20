{ pkgs, ... }:

{
  packages = {
    cli = {
      enable = true;
      bat = true;
      less = true;
      fastfetch = true;
      nano = true;
    };
    tmux = {
      enable = true;
      use12HourClock = true;
      plugins = with pkgs.tmuxPlugins; [
        catppuccin
        dotbar
      ];
    };
  };
}
