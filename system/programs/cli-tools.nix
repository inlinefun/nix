{ ... }:
{
  programs = {
    bat.enable = true;
    less.enable = true;
    nano.enable = true;
    neovim.enable = true;
    tmux = {
      enable = true;
      clock24 = false;
    };
  };
}
