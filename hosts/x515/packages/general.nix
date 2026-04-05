{
  pkgs,
  ...
}:

{

  packages = {
    firefox = {
      enable = true;
    };
    discord = {
      enable = true;
      package = pkgs.vesktop;
    };
  };

}
