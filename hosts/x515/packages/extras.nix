{ pkgs, ... }:

{
  environment.systemPackages =
    with pkgs;
    [
      nil
      nixd
      nixfmt
    ]
    ++ [
      qt6Packages.qtbase
      qt6Packages.qtdeclarative
      qt6Packages.qtlanguageserver
      qt6Packages.qtsvg
    ];
}
