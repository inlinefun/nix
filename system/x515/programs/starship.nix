{
  ...
}:

{

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    interactiveOnly = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      directory = {
        truncation_length = 4;
        truncation_symbol = "../";
        truncate_to_repo = true;
        format = "[$path ]($style)";
        home_symbol = "~";
      };
    };
  };

}
