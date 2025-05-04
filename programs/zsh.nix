{ config, pkgs, lib, ... }:


{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    plugins = [
      # Vi keybindings
      {
        name = "zsh-vi-mode";
        file = "./share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        src = pkgs.zsh-vi-mode;
      }
    ];

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
      path = "${config.xdg.dataHome}/zsh/history";
      share = false;
      size = 100000;
      save = 100000;
    };

    sessionVariables = {
      COLORTERM = "truecolor";
      TERM = "xterm-256color";
      EDITOR = "vi";
      ZVM_VI_ESCAPE_BINDKEY = "kl";
    };

    shellAliases = rec {
      ".."   = "cd ..";
      ls      = "${pkgs.eza}/bin/exa --color=auto --group-directories-first --classify";
      lst     = "${ls} --tree";
      la      = "${ls} --all";
      ll      = "${ls} --all --long --header --group";
      llt     = "${ll} --tree";
      tree    = "${ls} --tree";
      cdtemp  = "cd `mktemp -d`";
      cp      = "cp -iv";
      ln      = "ln -v";
      mkdir   = "mkdir -vp";
      mv      = "mv -iv";
      rm      = lib.mkMerge [
        (lib.mkIf pkgs.stdenv.targetPlatform.isDarwin "rm -v")
        (lib.mkIf (!pkgs.stdenv.targetPlatform.isDarwin) "rm -Iv")
      ];
      dh      = "du -h";
      df      = "df -h";
      su      = "sudo -E su -m";
      sysu    = "systemctl --user";
      jnsu    = "journalctl --user";
      svim    = "sudoedit";
      zreload = "export ZSH_RELOADING_SHELL=1; source $ZDOTDIR/.zshenv; source $ZDOTDIR/.zshrc; unset ZSH_RELOADING_SHELL";
      t       = "task";
      tg      = "task -g";
    };

    profileExtra = ''
      setopt incappendhistory
      setopt histfindnodups
      setopt histreduceblanks
      setopt histverify
      setopt correct                                                  # Auto correct mistakes
      setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
      setopt nocaseglob                                               # Case insensitive globbing
      setopt rcexpandparam                                            # Array expension with parameters
      #setopt nocheckjobs                                              # Don't warn about running processes when exiting
      setopt numericglobsort                                          # Sort filenames numerically when it makes sense
      unsetopt nobeep                                                 # Enable beep
      setopt appendhistory                                            # Immediately append history instead of overwriting
      unsetopt histignorealldups                                      # If a new command is a duplicate, do not remove the older one
      setopt interactivecomments
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"       # Colored completion (different colors for dirs/files/etc)
      zstyle ':completion:*' rehash true                              # automatically find new executables in path
      # Speed up completions
      zstyle ':completion:*' accept-exact '*(N)'
      zstyle ':completion:*' use-cache on
      mkdir -p "$(dirname ${config.xdg.cacheHome}/zsh/completion-cache)"
      zstyle ':completion:*' cache-path "${config.xdg.cacheHome}/zsh/completion-cache"
      zstyle ':completion:*' menu select
      WORDCHARS=''${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
    '';

    initExtra = ''

      unset RPS1 RPROMPT
    ''
    # '' + lib.readFile ./kubectl_aliases.sh;
  };
}