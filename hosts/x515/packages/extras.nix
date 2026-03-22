{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    nixd
    nixfmt
    qt6Packages.qtlanguageserver
  ];
}
