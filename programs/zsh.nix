{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    dotDir = ".config/zsh";

    plugins = [
      # Vi keybindings
      {
        name = "zsh-vi-mode";
        file = "./share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        src = pkgs.zsh-vi-mode;
      }

    ];
    oh-my-zsh = {
      enable = true;
      # theme = "robbyrussell";
      plugins = [ 
        "git" 
      ];
    };

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
      EDITOR = "nvim";
      ZVM_VI_ESCAPE_BINDKEY = "kl";
    };

    shellAliases = rec {
      ".." = "cd ..";
      # ls =
      #   "${pkgs.eza}/bin/exa --color=auto --group-directories-first --classify";
      # lst = "${ls} --tree";
      # la = "${ls} --all";
      # ll = "${ls} --all --long --header --group";
      # llt = "${ll} --tree";
      # tree = "${ls} --tree";
      cdtemp = "cd `mktemp -d`";
      cp = "cp -iv";
      ln = "ln -v";
      mkdir = "mkdir -vp";
      mv = "mv -iv";
      rm = lib.mkMerge [
        (lib.mkIf pkgs.stdenv.targetPlatform.isDarwin "rm -v")
        (lib.mkIf (!pkgs.stdenv.targetPlatform.isDarwin) "rm -Iv")
      ];
      dh = "du -h";
      df = "df -h";
      su = "sudo -E su -m";
      sysu = "systemctl --user";
      jnsu = "journalctl --user";
      svim = "sudoedit";
      zreload =
        "export ZSH_RELOADING_SHELL=1; source $ZDOTDIR/.zshenv; source $ZDOTDIR/.zshrc; unset ZSH_RELOADING_SHELL";
      t = "task";
      tg = "task -g";
      cd = "z";
      k = "kubectl";
      cat = "${pkgs.bat}/bin/bat --paging=never";
    };

    # initExtra = (builtins.readFile ./scripts/zshInitExtra.sh);
    initContent = (builtins.readFile ./scripts/zshInitExtra.sh);

  };
}
