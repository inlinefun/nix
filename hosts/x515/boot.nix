{ ... }:

{

  features = {
    grub = {
      enable = true;
      osProber = true;
    };
    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };

  networking.hostName = "x515";
  system.stateVersion = "26.05";

}
