{
  lib,
  ...
}:

{

  imports = lib.filter (it: lib.hasSuffix ".nix" (toString it) && baseNameOf it != "default.nix") (
    lib.filesystem.listFilesRecursive ./.
  );

}
