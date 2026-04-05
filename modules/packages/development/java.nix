{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.java;
in
{

  options.packages.java = {
    enable = lib.mkEnableOption ''
      Whether to enable a JRE/JDK to run .jar files
    '';
    package = lib.mkOption {
      default = pkgs.openjdk25;
      description = ''
        Specify which package of a JRE/JDK to use
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    programs.java = {
      enable = true;
      package = cfg.package;
    };
  };

}
