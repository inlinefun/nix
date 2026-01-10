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

  nix.settings.extra-sandbox-paths = [
    "/var/cache/sccache"
    "/var/cache/cpm"
  ];
  systemd.tmpfiles.rules = [
    "d /var/cache/sccache 0775 root nixbld - -"
    "d /var/cache/cpm     0775 root nixbld - -"
  ];

  time = {
    hardwareClockInLocalTime = false;
    timeZone = "Asia/Kolkata";
  };

}
