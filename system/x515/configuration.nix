{
  pkgs,
  ...
}:

{

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "x515";
    firewall = {
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
      settings = {
        connectivity.uri = "http://nmcheck.gnome.org/check_network_status.txt";
      };
    };
  };

  time.timeZone = "Asia/Kolkata";

}
