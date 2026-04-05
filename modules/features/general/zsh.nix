{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.zsh;
in
{

  options.features.zsh = {
    enable = lib.mkEnableOption ''
      Whether to enable zsh and configure it's default
    '';

    completion =
      lib.mkEnableOption ''
        Whether to enable completion
      ''
      // {
        default = true;
      };
    historyFile = lib.mkOption {
      default = "$HOME/.history";
      description = ''
        Location of zsh's history file
      '';
      type = lib.types.str;
    };
    maxHistory = lib.mkOption {
      default = 2000;
      description = ''
        Maximum history to retain under zsh
      '';
      type = lib.types.int;
    };
    options = lib.mkOption {
      default = [ ];
      description = ''
        List of zsh options to "set"
      '';
      type = lib.types.listOf lib.types.str;
    };
    substringSearch = lib.mkEnableOption ''
      Whether to enable substring search
    '';
    suggestions =
      lib.mkEnableOption ''
        Whether to enable auto suggestions
      ''
      // {
        default = true;
      };
    syntaxHighlight =
      lib.mkEnableOption ''
        Whether to enable syntax highlighting
      ''
      // {
        default = true;
      };
    useStarship = lib.mkEnableOption ''
      Whether to enable starship for the prompt
    '';
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        programs.zsh = {
          enable = true;
          enableBashCompletion = cfg.completion;
          enableCompletion = cfg.completion;
          enableGlobalCompInit = cfg.completion;
          enableLsColors = true;
          histFile = cfg.historyFile;
          histSize = cfg.maxHistory;
          autosuggestions = {
            enable = cfg.suggestions;
            async = true;
            strategy = [
              "completion"
              "match_prev_cmd"
              "history"
            ];
          };
          interactiveShellInit = lib.mkMerge [
            ''
              # emacs binds
              bindkey -e
              # Move cursor to beginning and end of line
              bindkey "\e[5~" beginning-of-line         # Page Up
              bindkey "\e[6~" end-of-line               # Page Down
              # Delete characters and words
              bindkey "^[[3~" delete-char               # DEL
              bindkey '^H' backward-kill-word           # Ctrl+Backspace (delete word backwards)
              bindkey '^[[3;5~' kill-word               # Ctrl+Delete (delete word forwards)
              # Move cursor forward and backward one word at a time
              bindkey "^[[1;5C" forward-word            # CTRL+ARROW_RIGHT
              bindkey "^[[1;5D" backward-word           # CTRL+ARROW_LEFT
              # Undo and redo changes
              bindkey "^Z" undo                         # CTRL+Z
              bindkey "^Y" redo                         # CTRL+Y

              # tells zsh to ignore case when completing commands or filenames.
              zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
              zstyle ':completion:*' use-cache yes

              # ctrl-left/right and ctrl-bspc will limit here
              WORDCHARS='*?_-.[]~=&;!$%^(){}<>|'
            ''
            (lib.mkIf cfg.substringSearch ''
              source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh

              bindkey "''${key[Up]}" history-substring-search-up
              bindkey "''${key[Down]}" history-substring-search-down
            '')
          ];
          syntaxHighlighting = {
            enable = cfg.syntaxHighlight;
            highlighters = [
              "main"
              "pattern"
              "root"
              "line"
            ];
            patterns = {
              "rm -rf *" = "fg=red";
            };
          };
          setOptions = [
            # History
            "EXTENDED_HISTORY"
            "HIST_EXPIRE_DUPS_FIRST"
            "HIST_FIND_NO_DUPS"
            "HIST_SAVE_NO_DUPS"
            "SHARE_HISTORY"
            # Input/Output
            "RM_STAR_WAIT"
            # ZLE
            "EMACS"
            # Prompt substitution
            "PROMPT_SUBST"
          ]
          ++ cfg.options;
          shellAliases = {
            grep = "${lib.getExe pkgs.ripgrep}";
            cat = "${lib.getExe pkgs.bat}";

            md = "mkdir";
            l = "ls -AGhgl";

            c = "clear";
            q = "exit";
            ":q" = "exit";
            ".." = "cd ..";
          };
        };

        programs = {
          bat.enable = true;
        };
        environment.systemPackages = [ pkgs.ripgrep ];

      }
      (lib.mkIf cfg.useStarship {
        features.starship = {
          enable = true;
        };
      })
    ]
  );

}
