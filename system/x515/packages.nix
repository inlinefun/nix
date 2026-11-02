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

    vesktop

    osu-lazer-bin

    # CLI stuff
    fastfetch
    ripgrep
    less
    bat

    android-tools
  ];

  nixpkgs.config.allowUnfree = true;

}
