{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bottles
    chezmoi
    vesktop
  ];
}
