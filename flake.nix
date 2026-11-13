{
  description = "inlinefun's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    basix = {
      url = "github:NotAShelf/basix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem-impure = {
      url = "github:Rexcrazy804/hjem-impure";
      inputs.nixpkgs.follows = "";
      inputs.hjem.follows = "";
    };
  };
  outputs =
    inputs@{
      nixpkgs,
      basix,
      hjem,
      hjem-impure,
      ...
    }:
    {
      nixosConfigurations = {
        x515 = nixpkgs.lib.nixosSystem {
          specialArgs =
            let
              scheme = "catppuccin-mocha";
              theme = basix.schemeData.base24."${scheme}";
            in
            {
              inherit inputs;
              theme = theme;
              primary = theme.palette.base0E;
              secondary = theme.palette.base0D;
              palette = theme.palette;
            };
          modules = [
            hjem.nixosModules.default

            ./modules
            ./system/x515
            ./user/inlinefun
          ];
        };
      };
    };
}
