{ pkgs, ... }:

{

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  console.keyMap = "us";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time = { 
    timeZone = "Asia/Kolkata";
    hardwareClockInLocalTime = false; # If dual booting windows, set windows to use UTC
  };

  users.users.me = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "adbusers" # for adb (android debug bridge)
      "docker" 
    ];
  };

}
