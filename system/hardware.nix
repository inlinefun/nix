{
  config,
  defaults,
  lib,
  modulesPath,
  ...
}:

{

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
      ];
      kernelModules = [ ];
    };
    extraModulePackages = [ ];
    kernelModules = [ "kvm-intel" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/2e2d2a28-9b6b-4afe-acbf-85486bce3046";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/2e2d2a28-9b6b-4afe-acbf-85486bce3046";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/2e2d2a28-9b6b-4afe-acbf-85486bce3046";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };
    "/swap" = {
      device = "/dev/disk/by-uuid/2e2d2a28-9b6b-4afe-acbf-85486bce3046";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/B542-1C62";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault defaults.system;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
