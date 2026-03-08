{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      lfs = {
        enable = true;
        enablePureSSHTransfer = true;
      };
    };
    java = {
      enable = true;
      package = pkgs.zulu21;
    };
    npm = {
      enable = true;
      package = pkgs.nodejs_24;
    };
  };
}
