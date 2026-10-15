{
  description = "inlinefun's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    inputs@{
      nixpkgs,
      ...
    }:
    {
      nixosConfigurations = {
        x515 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./modules
            ./system/x515
            ./user/inlinefun
          ];
        };
      };
    };
}
