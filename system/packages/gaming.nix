{ pkgs, ... }:
{
  nixpkgs.config.eden.cacheBuilds = true;
  environment.systemPackages = with pkgs; [
    prismlauncher
    eden
    waywall
  ];
}
