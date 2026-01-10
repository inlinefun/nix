{ inputs, ... }:
let
  overlays = [
    inputs.custom-packages.overlays.default
  ];
in
{
  nixpkgs.overlays = overlays;
}
