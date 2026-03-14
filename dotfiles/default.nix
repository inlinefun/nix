args@{ lib, username, ... }:

let
  files = lib.filter (p: lib.hasSuffix ".nix" (toString p) && baseNameOf p != "default.nix") (
    lib.filesystem.listFilesRecursive ./.
  );
in
{
  imports = map (p: import p (args // { inherit username; })) files;
}
