{ pkgs, ... }:

{
  packages = {
    discord = {
      enable = true;
      package = pkgs.vesktop;
    };
    firefox = {
      enable = true;
      languagePacks = [
        "kn"
        "hi-IN"
      ];
    };
    gnupg = {
      enable = true;
    };
  };
}
