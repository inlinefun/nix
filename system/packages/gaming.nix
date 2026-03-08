{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    prismlauncher
    waywall
  ];
}
