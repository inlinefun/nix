{
  description = "inlinefun's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
        mainUser = "me";
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
        ];
      };
    };
}
