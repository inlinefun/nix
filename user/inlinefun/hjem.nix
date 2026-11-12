args@{
  username,
  ...
}:

{

  imports = [
    (import ../../dotfiles args)
  ];

  hjem = {
    clobberByDefault = true;
    users.${username} = {
      enable = true;
      user = username;
      directory = "/home/${username}";
    };
  };

}
