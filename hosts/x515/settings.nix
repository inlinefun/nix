{ ... }:

{
  settings = {
    locales = {
      default = "en_US.UTF-8";
      extraLocales = [
        "kn_IN/UTF-8"
        "hi_IN/UTF-8"
      ];
    };
    nix = {
      optimisedStore = true;
      nixCommand = true;
      flakes = true;
      experimentalFeatures = [ ];
      allowedUnfree = [
        "osu-lazer-bin"
      ];
    };
    time = {
      timeZone = "Asia/Kolkata";
      useLocalTime = false;
    };
  };
}
