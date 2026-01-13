{ pkgs, ... }:
{
  nixpkgs.config.eden.cacheBuilds = true;
  environment.systemPackages = with pkgs; [
    eden

    ninjabrain-bot
    prismlauncher
    waywall
  ];
}
