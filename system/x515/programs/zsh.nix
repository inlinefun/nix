{
  lib,
  pkgs,
  ...
}:

{

  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    enableCompletion = true;
    enableGlobalCompInit = true;
    enableLsColors = true;
    histFile = "$HOME/.zsh_history";
    histSize = 2000;
    autosuggestions = {
      enable = true;
      async = true;
      strategy = [
        "completion"
        "match_prev_cmd"
        "history"
      ];
    };
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
      zstyle ':completion:*' use-cache yes

      # ctrl-left/right and ctrl-bspc will limit here
      WORDCHARS='*?_-.[]~=&;!$%^(){}<>|'

      # history substring searching
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
      bindkey "''${key[Up]}" history-substring-search-up
      bindkey "''${key[Down]}" history-substring-search-down
    '';
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "pattern"
        "root"
        "line"
      ];
      patterns = {
        "rm -rf" = "fg=red";
      };
    };
    setOptions = [
      "EXTENDED_HISTORY"
      "HIST_EXPIRE_DUPS_FIRST"
      "HIST_FIND_NO_DUPS"
      "HIST_SAVE_NO_DUPS"
      "SHARE_HISTORY"
      "EMACS"
      "PROMPT_SUBST"
    ];
    shellAliases = {
      grep = "${lib.getExe pkgs.ripgrep}";
      cat = "${lib.getExe pkgs.bat}";

      md = "mkdir";
      ".." = "cd ..";

      c = "clear";
      q = "exit";
      ":q" = "exit";
    };
  };

}
