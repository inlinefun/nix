{
  description = "inlinefun's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      defaults = {
        hostName = "nixos";
        system = "x86_64-linux";
        primaryUser = "me";
      };
    in
    {
      nixosConfigurations.${defaults.hostName} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit defaults;
        };
        modules = [
          ./system

          ./home
          inputs.hjem.nixosModules.default
        ];
      };
    };
}
