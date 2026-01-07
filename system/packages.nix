{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git

    nixd
    nil
    nixfmt

    prismlauncher
    zulu21

    zed-editor
  ];
}
