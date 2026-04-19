{
  inputs,
  pkgs,
  ...
}:

{

  packages = {
    discord = {
      enable = true;
      package = pkgs.vesktop;
    };
    firefox = {
      enable = true;
    };
    quickshell = {
      enable = true;
      package = inputs.quickshell.packages."x86_64-linux".default.withModules [
        pkgs.qt6Packages.qt3d
        pkgs.qt6Packages.qt5compat
        pkgs.qt6Packages.qtsvg
        pkgs.qt6Packages.qtimageformats
        pkgs.qt6Packages.qtmultimedia
        pkgs.qt6Packages.qtquick3d
        pkgs.qt6Packages.qtquick3dphysics
        pkgs.qt6Packages.qttools
        pkgs.kdePackages.qtquicktimeline
      ];
    };
    spotify = {
      enable = true;
    };
  };

}
