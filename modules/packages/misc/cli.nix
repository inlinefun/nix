{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.cli;
in
{

  options.packages.cli = {
    enable = lib.mkEnableOption "Whether to enable basic CLI tools" // {
      default = true;
    };
    bat = lib.mkEnableOption "Whether to enable bat, a cat alternative";
    fastfetch = lib.mkEnableOption "Whether to enable fastfetch";
    less = lib.mkEnableOption "Whether to enable less, a file pager";
    nano = lib.mkEnableOption "Whether to enable nano, a simple console text editor";
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      (lib.mkIf cfg.bat {
        programs.bat.enable = true;
      })
      (lib.mkIf cfg.fastfetch {
        environment.systemPackages = with pkgs; [ fastfetch ];
      })
      (lib.mkIf cfg.less {
        programs.less.enable = true;
      })
      (lib.mkIf cfg.nano {
        programs.nano = {
          enable = true;
          syntaxHighlight = true;
        };
      })
    ]
  );

}
