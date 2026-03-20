{ inputs, username, ... }:

let
  dots = ./src;
in
{

  hjem = {
    extraModules = [
      inputs.hjem-impure.hjemModules.default
    ];
    users.${username} = {
      user = username;
      directory = "/home/${username}";
      impure = {
        enable = true;
        dotsDir = dots;
        dotsDirImpure = "/home/${username}/nix/dotfiles/src";
      };
    };
  };

}
