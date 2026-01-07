{ pkgs, ... }:

let
  cliPackages = with pkgs; [
    fastfetch
  ];
in
{
  environment.systemPackages = cliPackages;
}
