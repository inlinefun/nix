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

    steam
    steam-run

    # CLI stuff
    fastfetch
    ripgrep
    less
    bat

    android-tools
  ];

  nixpkgs.config.allowUnfree = true;

}
