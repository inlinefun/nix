{ pkgs, ... }:

# some defaults because lazy
let
  compilers = with pkgs; [
    cmake
    gnumake
    rustc
  ];
  editors = with pkgs; [
    zed-editor
  ];
  formatters = with pkgs; [
    nixfmt
    rustfmt
  ];
  languageServers = with pkgs; [
    gopls
    nil
    nixd
    rust-analyzer
  ];
  runtimes = with pkgs; [
    bun
    cargo
    go
  ];
in
{
  environment.systemPackages = compilers ++ editors ++ formatters ++ languageServers ++ runtimes;
}
