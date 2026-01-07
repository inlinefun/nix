{ pkgs, ... }:
{
  # literally ONE entire package, lmao
  environment.systemPackages = with pkgs; [
    prismlauncher
  ];
}
