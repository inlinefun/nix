{ defaults, pkgs, ... }:
{

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [
      "kn_IN/UTF-8"
      "hi_IN/UTF-8"
    ];
  };

  networking = {
    hostName = defaults.hostName;
    firewall = {
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };

  time = {
    hardwareClockInLocalTime = false;
    timeZone = "Asia/Kolkata";
  };

}
