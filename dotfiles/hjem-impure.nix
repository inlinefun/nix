{
  dots,
  inputs,
  username,
  ...
}:

{

  hjem = {
    users.${username}.impure = {
      enable = true;
      dotsDir = "${dots}";
      dotsDirImpure = "/home/${username}/nix/dotfiles/src";
    };
    extraModules = [
      inputs.hjem-impure.hjemModules.default
    ];
  };

}
