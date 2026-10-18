{
  pkgs,
  ...
}:

{

  environment.systemPackages = with pkgs; [
    wl-clipboard
    rofi
  ];

}
