{ ... }:
{
  imports = [
    ./overlays.nix
    ./packages
    ./programs
    ./boot.nix
    ./desktop.nix
    ./drivers.nix
    ./hardware.nix
    ./misc.nix
    ./services.nix
    ./users.nix
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  system.stateVersion = "25.11";
}
