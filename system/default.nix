{ ... }:
{
  imports = [
    ./programs
    ./boot.nix
    ./desktop.nix
    ./hardware.nix
    ./misc.nix
    ./packages.nix
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
