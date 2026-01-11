{ pkgs, ... }:

let
  cliPackages = with pkgs; [
    fastfetch
    home-manager
    patchelf
  ];
in
{
  environment.systemPackages = cliPackages;
}
