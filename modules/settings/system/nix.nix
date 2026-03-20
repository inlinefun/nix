{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.nix;
in
{

  options.settings.nix = {
    optimisedStore =
      lib.mkEnableOption ''
        Specify if the nix store should be automatically optimised
        Defaults to true
      ''
      // {
        default = true;
      };
    nixCommand =
      lib.mkEnableOption ''
        Whether to enable the usage of the `nix` command
        Defaults to true
      ''
      // {
        default = true;
      };
    flakes =
      lib.mkEnableOption ''
        Whether to enable flake(s) support or not
        Defaults to true
      ''
      // {
        default = true;
      };
    experimentalFeatures = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = ''A list of "experimental features" to enable'';
    };
    allowedUnfree = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "List of unfree programs to allow, by name";
    };
  };

  config = {
    nix.settings = {
      auto-optimise-store = cfg.optimisedStore;
      experimental-features =
        cfg.experimentalFeatures
        ++ lib.optionals cfg.nixCommand [ "nix-command" ]
        ++ lib.optionals cfg.flakes [ "flakes" ];
    };
    nixpkgs.config = {
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) cfg.allowedUnfree;
    };
  };
}
