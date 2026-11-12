{
  dots,
  username,
  ...
}:

{

  config = {
    homeDir.${username}.config.files = {
      "niri/animations.kdl".source = "${dots}/niri/animations.kdl";
      "niri/binds.kdl".source = "${dots}/niri/binds.kdl";
      "niri/config.kdl".source = "${dots}/niri/config.kdl";
      "niri/input.kdl".source = "${dots}/niri/input.kdl";
      "niri/layout.kdl".source = "${dots}/niri/layout.kdl";
      "niri/misc.kdl".source = "${dots}/niri/misc.kdl";
      "niri/output.kdl".source = "${dots}/niri/output.kdl";
      "niri/rules.kdl".source = "${dots}/niri/rules.kdl";
    };
  };

}
