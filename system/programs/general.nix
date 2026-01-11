{ ... }:
{
  programs = {
    firefox = {
      enable = true;
      languagePacks = [
        "en-US"
        "hi-IN"
      ];
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
    nix-ld.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
    xwayland.enable = true;
  };
}
