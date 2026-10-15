{
  pkgs,
  ...
}:

{

  users.users."inlinefun" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

}
