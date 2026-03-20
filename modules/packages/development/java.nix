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
    enable = lib.mkEnableOption "Whether to enable Java Runtime Environment(JRE) to run java programs(jar files)";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.openjdk21;
      description = "JRE/JDK package to enable";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.java = {
      enable = true;
      package = cfg.package;
    };
  };

}
