{ pkgs, username, ... }:

{
  hjem.users.${username} = {
    packages = with pkgs; [
      bibata-cursors
      brightnessctl
      ibm-plex
      playerctl
    ];
  };
}
