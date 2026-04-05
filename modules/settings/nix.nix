{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.nix;
in
{

  options.settings.nix = {
    optimisedStore = lib.mkEnableOption ''
      Whether to auto optimise the nix store or not
    '';
    experimentalFeatures = lib.mkOption {
      default = [ ];
      description = ''
        List of experimental features to enable.
        The experimental features of `nix-command` and `flakes` are enabled by default since this very configuration makes use of them
      '';
      type = lib.types.listOf lib.types.str;
    };
    allowedUnfree = lib.mkOption {
      default = [ ];
      description = ''
        List of unfree programs to allow
      '';
      type = lib.types.listOf lib.types.str;
    };
  };

  config = {
    nix.settings = {
      auto-optimise-store = cfg.optimisedStore;
      experimental-features = cfg.experimentalFeatures ++ [
        "nix-command"
        "flakes"
      ];
    };
    nixpkgs.config = {
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) cfg.allowedUnfree;
    };
    environment.systemPackages = with pkgs; [
      nil
      nixd
      nixfmt
    ];
  };

}
