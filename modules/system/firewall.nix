{ config, lib, ... }:

let
  cfg = config.cfg.firewall;
in
{

  options.cfg.firewall = {
    enable = lib.mkEnableOption "Enable the firewall" // {
      default = true;
    };
    allowedUDPPorts = lib.mkOption {
      type = lib.types.listOf lib.types.int;
      default = [ ];
      description = "List of open UDP ports";
    };
    allowedTCPPorts = lib.mkOption {
      type = lib.types.listOf lib.types.int;
      default = [ ];
      description = "List of open TCP ports.";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = cfg.allowedTCPPorts;
      allowedUDPPorts = cfg.allowedUDPPorts;
    };
  };

}
