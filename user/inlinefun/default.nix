# explicit declaration of inputs is required
# why? me no know
# fixes the next line (???)
# error: function 'anonymous lambda' called without required argument 'pkgs'

args@{
  lib,
  pkgs,
  ...
}:

let
  username = "inlinefun";
  modules = lib.filter (it: lib.hasSuffix ".nix" (toString it) && baseNameOf it != "default.nix") (
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
        # might as well pass the explicitly declared inputs here
        inherit pkgs;
      }
    )
  ) modules;

}
