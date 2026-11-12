{
  dots,
  username,
  ...
}:

{

  config = {
    homeDir.${username}.config.files = {
      "niri/config.kdl".source = "${dots}/niri/config.kdl";
    };
  };

}
