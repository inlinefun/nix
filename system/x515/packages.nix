{
  pkgs,
  ...
}:

{

  environment.systemPackages = with pkgs; [
    vim
    wget
    zed-editor
  ];

}
