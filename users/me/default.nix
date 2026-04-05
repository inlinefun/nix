args@{
  lib,
  pkgs,
  ...
}:

let
  username = "me";
  files = lib.filter (it: lib.hasSuffix ".nix" (toString it) && baseNameOf it != "default.nix") (
    lib.filesystem.listFilesRecursive ./.
  );
in
{

  imports = map (
    it:
    import it (
      args
      // {
        inherit username;
        # needs to be explicitly mentioned in imports
        # might as well do this so that there isn't an 'unused_binding'
        # surely this doesn't cause any issues :clueless:
        inherit pkgs;
      }
    )
  ) files;

}
