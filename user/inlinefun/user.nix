{
  pkgs,
  username,
  ...
}:

{

  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

}
