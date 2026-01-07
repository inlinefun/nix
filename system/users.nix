{ defaults, pkgs, ... }:
{
  users.users.${defaults.mainUser} = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
