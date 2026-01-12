{ defaults, ... }:
{
  imports = [ ];
  home = {
    username = "me";
    homeDirectory = "/home/${defaults.mainUser}";
    stateVersion = "25.11";
    file = {
      "test.txt".text = ''test content fr fr '';
    };
  };
}
