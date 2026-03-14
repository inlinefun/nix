{
  description = "inlinefun's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        x515 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            inputs.stylix.nixosModules.stylix
            inputs.hjem.nixosModules.default
            ./modules
            ./system/x515
            ./users/me
          ];
        };
      };
    };
}
