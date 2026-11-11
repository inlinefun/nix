{
  lib,
  pkgs,
  ...
}:

let
  windowsPartitionUUID = "353f95c5-f6cd-472b-a7f1-c6db933b34d2";
in
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
        extraEntries = ''
          /Windows 11
              protocol: efi
              path: guid(${windowsPartitionUUID}):/EFI/Microsoft/Boot/bootmgfw.efi
              comment: :woe:
        '';
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
