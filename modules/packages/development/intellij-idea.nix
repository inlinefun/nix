{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.intellij-idea;
in
{

  options.packages.intellij-idea = {
    enable = lib.mkEnableOption "Enable Jetbrains IntelliJ Idea";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs.jetbrains; [
      idea-oss
    ];
  };

}
