{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.jetbrains-toolbox;
in
{

  options.packages.jetbrains-toolbox = {
    enable = lib.mkEnableOption "Enable Jetbrains Toolbox";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      jetbrains-toolbox
    ];
  };

}
