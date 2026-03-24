{ pkgs, ... }:

{
  packages = {
    adb = {
      enable = true;
    };
    git = {
      enable = true;
      enableLFS = true;
      enablePureSSHTransfer = true;
      config = {
        init = {
          defaultBranch = "main";
        };
      };
    };
    intellij = {
      enable = true;
      package = pkgs.jetbrains.idea-oss;
    };
    java = {
      enable = true;
      package = pkgs.temurin-bin-21;
    };
    webdev = {
      enable = true;
      npm = true;
      npmPackage = pkgs.nodejs_24;
      bun = true;
      deno = true;
    };
    zed = {
      enable = true;
    };
  };
}
