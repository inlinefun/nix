{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.intellij;
in
{

  options.packages.intellij = {
    enable = lib.mkEnableOption ''
      Whether to enable Jetbrains IntelliJ Idea, the Java/Kotlin IDE
    '';
    package = lib.mkOption {
      default = pkgs.jetbrains.idea-oss;
      description = ''
        Specify which package of IntelliJ to install
      '';
      type = lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
