args@{
  inputs,
  username,
  ...
}:

{

  imports = [
    (import ../../dotfiles args)
  ];

  hjem.extraModules = [
    inputs.hjem-impure.hjemModules.default
  ];
  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = "/home/${username}";
    impure.enable = true;
  };

}
