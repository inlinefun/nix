{ username, ... }:

{

  users.users.${username} = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    home = "/home/${username}";
  };

}
