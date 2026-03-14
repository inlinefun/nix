{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fastfetch
    home-manager
    patchelf
  ];
}
