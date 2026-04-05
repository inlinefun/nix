{
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
    };
  };

}
