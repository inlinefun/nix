{
  config,
  lib,
  ...
}:

let
  cfg = config.packages.git;
in
{

  options.packages.git = {
    enable = lib.mkEnableOption "Whether to enable git";
    enableLFS = lib.mkEnableOption "Whether to enable git-lfs (Large File Storage)";
    enablePureSSHTransfer = lib.mkEnableOption "Whether to enable Enable pure SSH transfer in server side";
    config = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = {
        init = {
          defaultBranch = "main";
        };
      };
      description = "Git Configuration written to /etc/gitconfig";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      config = cfg.config;
      lfs = {
        enable = cfg.enableLFS;
        enablePureSSHTransfer = cfg.enablePureSSHTransfer;
      };
    };
  };

}
