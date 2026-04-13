{
  pkgs,
  ...
}:

{

  packages = {
    adb.enable = true;
    androidStudio = {
      enable = true;
      package = pkgs.androidStudioPackages.stable;
    };
    git = {
      enable = true;
      enableLFS = true;
      enablePureSSHTransfer = true;
    };
    intellij = {
      enable = true;
      package = pkgs.jetbrains.idea-oss;
    };
    java = {
      enable = true;
      package = pkgs.openjdk21;
    };
    zed = {
      enable = true;
      package = pkgs.zed-editor;
    };
  };

}
