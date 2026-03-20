{ inputs, username, ... }:

{

  hjem = {
    extraModules = [
      inputs.hjem-impure.hjemModules.default
    ];
    users.${username} = {
      user = username;
      directory = "/home/${username}";
      impure.enable = true;
    };
  };

}
