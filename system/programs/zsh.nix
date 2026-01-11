{ lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    enableCompletion = true;
    enableGlobalCompInit = true;
    enableLsColors = true;
    autosuggestions = {
      enable = true;
      async = true;
      strategy = [
        "completion"
        "match_prev_cmd"
        "history"
      ];
    };
    syntax-highlighting = {
      enable = true;
      highlighters = [
        "main"
        "pattern"
        "root"
        "line"
      ];
      patterns = {
        "rm -rf" = "fg=white,bold,bg=red";
      };
    };
    histFile = "$HOME/.histfile";
    histSize = 1000;
    interactiveShellInit = ''
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

      # ctrl-left/right and ctrl-bspc will limit here
      WORDCHARS='*?_-.[]~=&;!$%^(){}<>|'

      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh

      bindkey "''${key[Up]}" history-substring-search-up
      bindkey "''${key[Down]}" history-substring-search-down
    '';
    setOptions = [
      "AUTO_CD"
      # Do not require a leading `.' in a filename to be matched explicitly.
      "GLOB_DOTS"
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
    ];
    shellAliases = {
      grep = "${lib.getExe pkgs.ripgrep}";
      cat = "${lib.getExe pkgs.bat}";

      l = "ls --color -AGhgl";
      ls = "ls --color";

      c = "clear";
      q = "exit";
      ":q" = "exit";
    };
  };
}
