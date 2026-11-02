{
  pkgs,
  username,
  ...
}:

let
  user-icon = ./user-icon.png;
in
{

  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  # https://discourse.nixos.org/t/setting-the-user-profile-image-under-gnome/36233/10
  systemd.tmpfiles.rules = [
    "f+ /var/lib/AccountsService/users/${username}  0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${username}\\n" # notice the "\\n" we don't want nix to insert a new line in our string, just pass it as \n to systemd
    "L+ /var/lib/AccountsService/icons/${username}  - - - - ${user-icon}" # you can replace the ${....} with absolute path to face icon
  ];

}
