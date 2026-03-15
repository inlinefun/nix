{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.prismlauncher;
in
{

  options.packages.prismlauncher = {
    enable = lib.mkEnableOption "Enable PrismLauncher, the minecraft launcher";
    mcsr = lib.mkEnableOption "Enable extra libraries for MCSR and related";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages =
      with pkgs;
      [
        (prismlauncher.override {
          jdks = [
            temurin-jre-bin-8
            temurin-jre-bin-17
            temurin-jre-bin-21
          ];
          additionalLibs = [
            libxt
            libxtst
            libxkbcommon
            libxinerama
          ];
        })
      ]
      ++ lib.optionals cfg.mcsr [
        waywall
      ];

  };

}
