{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.rust;
in
{

  options.features.rust = {
    enable = lib.mkEnableOption ''
      Whether to enable Rust development features
    '';
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cargo
      rust-analyzer
      rustc
      rustfmt
    ];
  };

}
