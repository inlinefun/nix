{ pkgs, defaults, ... }:

let
  username = defaults.primaryUser;
in
{

  users.users.${username} = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    home = "/home/${username}";
    shell = pkgs.zsh;
  };
}
