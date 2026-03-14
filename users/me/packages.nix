{ username, ... }:

{

  packages = {
    zsh = {
      enable = true;
      user = username;
    };
  };

}
