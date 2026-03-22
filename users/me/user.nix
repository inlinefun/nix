args@{ pkgs, username, ... }:

{

  imports = [
    (import ../../dotfiles args)
  ];

  users.users.${username} = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    home = "/home/${username}";
    shell = pkgs.zsh;
  };

  features.zsh = {
    enable = true;
    completion = true;
    substringSearch = true;
    suggestions = true;
    syntaxHighlight = true;
  };

}
