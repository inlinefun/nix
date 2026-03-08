{ ... }:

{

  boot = {
    loader = {
      grub = {
        enable = true;
        backgroundColor = "#000000";
        device = "nodev";
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
