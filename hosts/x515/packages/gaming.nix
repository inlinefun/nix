{
  pkgs,
  ...
}:

{

  packages = {
    minecraft = {
      enable = true;
      mcsr = true;
      extraLibs = [ ];
      runtimes = with pkgs; [
        temurin-bin-17
        temurin-bin-21
        temurin-bin-25
      ];
    };
    osu = {
      enable = true;
      package = pkgs.osu-lazer-bin;
    };
    waywall = {
      enable = true;
      package = pkgs.waywall;
    };
  };

}
