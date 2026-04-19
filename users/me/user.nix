args@{
  username,
  pkgs,
  ...
}:

{

  imports = [
    (import ../../dotfiles args)
  ];

  users.users.${username} = {
    extraGroups = [
      "wheel"
      "adbusers"
      "input"
      "networkmanager"
    ];
    isNormalUser = true;
    home = "/home/${username}";
    shell = pkgs.zsh;
  };

  features = {
    starship = {
      enable = true;
      style = true;
    };
    zsh = {
      enable = true;
      completion = true;
      substringSearch = true;
      suggestions = true;
      syntaxHighlight = true;
    };
  };

}
