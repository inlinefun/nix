{
  config,
  lib,
  pkgs,
  username,
  ...
}:

let
  cfg = config.dotfiles.fastfetch;
in
{

  options.dotfiles.fastfetch = {
    enable = lib.mkEnableOption ''
      Whether to configure `fastfetch`
    '';
  };

  config = lib.mkIf cfg.enable {
    homeDir.${username}.config.files = {
      "fastfetch/config.jsonc" = {
        generator = lib.generators.toJSON { };
        value = {
          "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json";
          logo = {
            source = ./src/image.png;
            type = "kitty-direct";
            position = "left";
            preserveAspectRatio = true;
          };
          display = {
            separator = "";
            color = {
              keys = "blue";
              output = "white";
              title = "blue";
            };
            key = {
              width = 16;
            };
          };
          general = { };
          modules = [
            "break"
            "break"
            {
              type = "title";
              format = "{user-name-colored}@{host-name-colored}";
            }
            "break"
            {
              type = "os";
              format = "{name}";
            }
            {
              type = "cpu";
              format = "{name}";
            }
            {
              type = "gpu";
              format = "{name}";
            }
            {
              type = "memory";
              key = "RAM";
              format = "{used} / {total} ({percentage})";
            }
            {
              type = "swap";
              format = "{used} / {total} ({percentage})";
            }
            {
              type = "disk";
              format = "{size-used} / {size-total} ({filesystem}) ({size-percentage})";
            }
            {
              type = "battery";
              key = "Power";
              format = "{status} ({capacity})";
            }
            "break"
            "break"
          ];
        };
      };
    };
    userPackages.${username}.install = [ pkgs.fastfetch ];
  };

}
