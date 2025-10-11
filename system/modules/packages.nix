{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    fastfetch
    vscodium
    nixd
    nixfmt-rfc-style
    vesktop
    prismlauncher
    gnome-tweaks
    bun

    jetbrains.idea-community-src
    jetbrains-toolbox
  ];

}
