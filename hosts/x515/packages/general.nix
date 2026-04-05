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
      package = inputs.quickshell.packages."x86_64-linux".default;
    };
  };

}
