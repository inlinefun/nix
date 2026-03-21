{ pkgs, username, ... }:

{
  hjem.users.${username} = {
    packages = with pkgs; [
      bibata-cursors
      ibm-plex
    ];
  };
}
