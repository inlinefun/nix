{ pkgs, ... }:

let
  editors = with pkgs; [
    zed-editor
  ];
  languageServers = with pkgs; [
    nil
    nixd
    nixfmt
  ];
  # should this be using flakes on every project? probably
  # would I do that? probably not
  runtimes = with pkgs; [
    bun
    go
  ];
  compilers = with pkgs; [
    cmake
    gnumake
  ];
in
{
  environment.systemPackages = languageServers ++ editors ++ runtimes ++ compilers;
}
