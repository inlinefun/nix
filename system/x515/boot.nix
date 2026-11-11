{
  lib,
  pkgs,
  ...
}:

{

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        efiSupport = true;
        secureBoot = {
          enable = true;
        };
      };
      systemd-boot.enable = lib.mkForce false;
      grub.enable = lib.mkForce false;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];

}
