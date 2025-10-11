{
  description = "inlinefun's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let 
      arch = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = arch;
        # nixpkgs.hostPlatform = lib.mkDefault arch;
        specialArgs = { inherit inputs; };
        modules = [
          ./system
        ];
      };
    };
}
