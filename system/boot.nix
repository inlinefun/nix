{ ... }:
{

  boot = {
    loader = {
      grub = {
        backgroundColor = "#000000";
        device = "nodev";
        enable = true;
        efiSupport = true;
        fontSize = 18;
        splashImage = null;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };

}
