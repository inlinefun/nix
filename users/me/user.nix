args@{ username, ... }:

{

  imports = [
    (import ../../dotfiles args)
  ];

  users.users.${username} = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    home = "/home/${username}";
  };

}
