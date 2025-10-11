{ pkgs, ... }:

{
  
  programs = {

    adb.enable = true;
    
    command-not-found.enable = false; # Conflicts with nix-index

    firefox = {
      enable = true;
      languagePacks = [ "en-US" ];
    };

    git = {
      enable = true;
      lfs = {
        enable = true;
        enablePureSSHTransfer = true;
      };
      config = {
        init = {
          defaultBranch = "main";
        };
      };
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    java = {
      enable = true;
      package = pkgs.zulu;
    };

    neovim.enable = true;

    nix-index.enable = true;
    nix-ld.enable = true;

    npm = {
      enable = true;
      package = pkgs.nodejs_24;
    };

    tmux = {
      enable = true;
      clock24 = false;
      newSession = true;
    };

    zsh.enable = true;

  };

}