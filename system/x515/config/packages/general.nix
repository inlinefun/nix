{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chezmoi
    firefox-devedition
    vesktop
  ];
}
