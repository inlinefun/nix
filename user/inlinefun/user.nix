{
  pkgs,
  ...
}:

{

  users.users."inlinefun" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

}
