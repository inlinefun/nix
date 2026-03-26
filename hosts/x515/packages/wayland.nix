{ inputs, ... }:

{

  packages = {
    hyprpaper = {
      enable = true;
    };
    kitty = {
      enable = true;
    };
    quickshell = {
      enable = true;
      package = inputs.quickshell.packages.x86_64-linux.default;
    };
    rofi = {
      enable = true;
    };
    waybar = {
      enable = true;
    };
  };

}
