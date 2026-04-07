{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.playit;
  version = "v0.17.1";
  package = pkgs.rustPlatform.buildRustPackage {
    pname = "playit";
    version = version;
    src = pkgs.fetchFromGitHub {
      owner = "playit-cloud";
      repo = "playit-agent";
      tag = version;
      hash = "sha256-kT7NLUcgGM/hxwK4PUDZ71PtYJqjR8i4yj/LhbXX1i0=";
    };
    cargoHash = "sha256-NcRND1lBbRs8/byiAQx0kGgc5Yw5PxhXxo+9FX9lbv0=";
    # disable tests, requires internet access
    doCheck = false;
  };
in
{

  options.packages.playit = {
    enable = lib.mkEnableOption ''
      Whether to install `playit`
    '';
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ package ];
  };

}
