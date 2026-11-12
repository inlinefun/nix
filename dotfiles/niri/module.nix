{
  username,
  ...
}:

{

  config = {
    homeDir.${username}.config.files = {
      "niri/config.kdl".source = ./src/config.kdl;
    };
  };

}
