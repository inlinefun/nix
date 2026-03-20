{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.minecraft;
  prismLauncher = pkgs.prismlauncher.override {
    jdks = cfg.runtimes;
    additionalLibs =
      cfg.extraLibs
      ++ lib.optionals cfg.mcsr (
        with pkgs;
        [
          # libraries required by NinjaBrain bot
          libxt
          libxtst
          libxkbcommon
          libxinerama
        ]
      );
  };
in
{

  options.packages.minecraft = {
    enable = lib.mkEnableOption "Whether to enable PrismLauncher for Minecraft";
    runtimes = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        temurin-jre-bin-8
        temurin-jre-bin-17
        temurin-jre-bin-21
      ];
      description = "Specify Java Runtimes to make available for PrismLauncher";
    };
    extraLibs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "Specify additional libraries to make available for PrismLauncher";
    };
    mcsr = lib.mkEnableOption "Whether to tweak prismlauncher making it compatible with Minecraft Speedrunning";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ prismLauncher ] ++ lib.optionals cfg.mcsr [ pkgs.waywall ];
  };

}
