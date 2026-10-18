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
  ];

  nixpkgs.config.allowUnfree = true;

}
