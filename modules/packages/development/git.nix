{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.git;
in
{

  options.packages.git = {
    enable = lib.mkEnableOption ''
      Whether to enable Git, a distributed version control software system
    '';
    enableLFS = lib.mkEnableOption ''
      Whether to enable `git-lfs` (Large File Storage)
    '';
    # I have no idea what this does lol
    enablePureSSHTransfer = lib.mkEnableOption ''
      Whether to enable pure SSH transfer in server side by installing the `git-lfs-transfer` package
    '';
    package = lib.mkOption {
      default = pkgs.git;
      description = ''
        Specify which package of git to install and configure
      '';
      type = lib.types.package;
    };
    config = lib.mkOption {
      default = {
        init = {
          defaultBranch = "main";
        };
      };
      description = ''
        Git configuration which is written to /etc/gitconfig
      '';
      type = lib.types.attrsOf lib.types.anything;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      package = cfg.package;
      config = cfg.config;
      lfs = {
        enable = cfg.enableLFS;
        enablePureSSHTransfer = cfg.enablePureSSHTransfer;
      };
    };
  };

}
