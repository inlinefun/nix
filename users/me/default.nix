args@{ lib, pkgs, ... }:

let
  username = "me";
  files = lib.filter (it: lib.hasSuffix ".nix" (toString it) && baseNameOf it != "default.nix") (
    lib.filesystem.listFilesRecursive ./.
  );
in
{
  imports = map (it: import it (args // { inherit username; })) files;
}
