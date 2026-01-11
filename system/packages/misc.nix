{ pkgs, ... }:

let
  cliPackages = with pkgs; [
    fastfetch
    patchelf
  ];
in
{
  environment.systemPackages = cliPackages;
}
