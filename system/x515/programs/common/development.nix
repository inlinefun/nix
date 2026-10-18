{
  ...
}:

{

  programs = {
    git = {
      enable = true;
      lfs = {
        enable = true;
        enablePureSSHTransfer = true;
      };
    };
  };

}
