{ defaults, ... }:

{
  hjem = {
    users.${defaults.primaryUser} = {
      enable = true;
      user = defaults.primaryUser;
      directory = "/home/${defaults.primaryUser}";
      files = {
        "test.txt".text = "real test file";
      };
    };
    clobberByDefault = true;
  };
}
