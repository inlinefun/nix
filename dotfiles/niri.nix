{
  config,
  username,
  ...
}:

let
  dots = config.hjem.users.${username}.impure.dotsDir;
in
{

  config = {
    homeDir.${username}.config.files = {
      "niri/config.kdl".source = "${dots}/niri/config.kdl";
    };
  };

}
