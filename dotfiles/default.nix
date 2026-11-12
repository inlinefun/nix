args@{
  lib,
  username,
  ...
}:

let
  files = lib.filter (it: lib.hasSuffix ".nix" (toString it) && baseNameOf it != "default.nix") (
    lib.filesystem.listFilesRecursive ./.
  );
  dots = "${./src}";
in
{
  imports = map (
    it:
    import it (
      args
      // {
        inherit username;
        inherit dots;
      }
    )
  ) files;
}
