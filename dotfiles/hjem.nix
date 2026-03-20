{ username, ... }:

{

  hjem.users = {
    ${username} = {
      user = username;
      directory = "/home/${username}";
    };
  };

}
