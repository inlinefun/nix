{ defaults, pkgs, ... }:
let
  username = defaults.mainUser;
in
{
  users.users.${username} = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    home = "/home/${username}";
    shell = pkgs.zsh;
  };
}
