{
  username,
  ...
}:

{

  config = {
    configDir.${username}.files = {
      "niri/config.kdl".source = ./src/config.kdl;
    };
  };

}
