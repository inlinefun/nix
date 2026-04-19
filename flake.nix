{
  description = "inlinefun's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem-impure = {
      url = "github:Rexcrazy804/hjem-impure";
      inputs.nixpkgs.follows = "";
      inputs.hjem.follows = "";
    };
    basix = {
      url = "github:NotAShelf/Basix";
    };
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      hjem,
      basix,
      nur,
      ...
    }@inputs:

    {
      nixosConfigurations.x515 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          colors = basix.schemeData.base24."0x96f".palette;
        };
        modules = [
          hjem.nixosModules.default
          nur.modules.nixos.default
          ./modules
          ./hosts/x515
          ./users/me
        ];
      };
    };
}
