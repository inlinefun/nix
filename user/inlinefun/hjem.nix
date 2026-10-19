{
  username,
  ...
}:

{

  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = "/home/${username}";
  };

}
