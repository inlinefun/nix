{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bottles
    vesktop
  ];
}
