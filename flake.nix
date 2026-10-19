{
  description = "inlinefun's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    basix = {
      url = "github:NotAShelf/basix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      nixpkgs,
      basix,
      ...
    }:
    {
      nixosConfigurations = {
        x515 = nixpkgs.lib.nixosSystem {
          specialArgs =
            let
              scheme = "0x96f";
            in
            {
              inherit inputs;
              theme = basix.schemeData.base24."${scheme}";
              palette = basix.schemeData.base24."${scheme}".palette;
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
