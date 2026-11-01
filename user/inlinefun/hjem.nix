args@{
  username,
  ...
}:

{

  imports = [
    (import ../../dotfiles args)
  ];

  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = "/home/${username}";
  };

}
