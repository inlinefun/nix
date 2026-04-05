{ pkgs, ... }:

{

  settings = {
    fonts = {
      enable = true;
      extraFonts = with pkgs; [
        googlesans-code
        nerd-fonts.jetbrains-mono
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
      ];
    };
    input = {
      enable = true;
      allowDoubleClicking = true;
      disableMouseAccel = true;
      mouseSpeed = 0.0;
      disableTouchpadAccel = true;
      touchpadSpeed = 0.0;
    };
    locale = {
      default = "en_US.UTF-8";
      extras = [
        "kn_IN/UTF-8"
        "hi_IN/UTF-8"
      ];
    };
    nix = {
      optimisedStore = true;
      # flakes and nix-command are force enabled
      experimentalFeatures = [ ];
      allowedUnfree = [
        "osu-lazer-bin"
      ];
    };
  };

}
