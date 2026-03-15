{
  lib,
  ...
}:

{

  options.theme.wallpaper = lib.mkOption {
    type = lib.types.path;
    default = "./wallpapers/wallhaven-4lx66p.jpg";
    description = "global default wallpaper option";
  };

}
