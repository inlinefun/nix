{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.webdev;
in
{

  options.packages.webdev = {
    # i fucking hate javascript
    enable = lib.mkEnableOption "Whether to enable packages related to web development";
    npm = lib.mkEnableOption "Whether to enable Node Package Manager";
    npmPackage = lib.mkOption {
      type = lib.types.package;
      default = pkgs.nodejs;
      description = "Specify which NodeJS package to enable";
    };
    bun = lib.mkEnableOption "Whether to enable `bun`, a JavaScript runtime";
    deno = lib.mkEnableOption "Whether to enable deno, a JavaScript runtime";
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      (lib.mkIf cfg.npm {
        programs.npm = {
          enable = true;
          package = cfg.npmPackage;
        };
      })
      (lib.mkIf cfg.bun {
        environment.systemPackages = [ pkgs.bun ];
      })
      (lib.mkIf cfg.deno {
        environment.systemPackages = [ pkgs.deno ];
      })
    ]
  );

}
