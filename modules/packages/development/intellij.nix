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
    enable = lib.mkEnableOption "Whether to enable IntelliJ Idea";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.jetbrains.idea-oss;
      description = "Package of IntelliJ idea to enable";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
