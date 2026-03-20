{
  description = "inlinefun's flake based NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations.x515 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./modules
          ./hosts/x515
          ./users/me
        ];
      };
    };
}
