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

    # CLI stuff
    fastfetch
    ripgrep
    less
    bat
  ];

  nixpkgs.config.allowUnfree = true;

}
