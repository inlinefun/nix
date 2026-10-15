{
  pkgs,
  ...
}:

{

  environment.systemPackages = with pkgs; [
    nil
    nixd
    nixfmt
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

}
