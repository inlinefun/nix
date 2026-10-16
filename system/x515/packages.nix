{
  pkgs,
  ...
}:

{

  environment.systemPackages = with pkgs; [
    vim
    wget
    zed-editor
    jetbrains-toolbox
  ];

  nixpkgs.config.allowUnfree = true;

}
