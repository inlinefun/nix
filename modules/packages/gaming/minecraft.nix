{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.minecraft;
  package = pkgs.prismlauncher.override {
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
    enable = lib.mkEnableOption ''
      Whether to enable THE Minecraft launcher, PrismLauncher
    '';
    runtimes = lib.mkOption {
      default = with pkgs; [
        openjdk21
        openjdk25
      ];
      description = ''
        A List of java runtimes to make available for PrismLauncher
      '';
      type = lib.types.listOf lib.types.package;
    };
    extraLibs = lib.mkOption {
      default = [ ];
      description = ''
        A list of packages to make available for PrismLauncher
        Super helpful for launching mods which require some library and break without it
      '';
      type = lib.types.listOf lib.types.package;
    };
    mcsr = lib.mkEnableOption ''
      Whether to enable packages specific to Minecraft Speedrunning (MCSR)
      waywall, libraries for ninjabrain-bot and so on
    '';
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ package ];
    packages.waywall.enable = lib.mkDefault cfg.mcsr;
  };

}
