{ lib, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    settings = { 
      theme = "catppuccin-macchiato";
    };
    extraConfig = ''
      keybinds {
        normal {
          bind "Ctrl f" { SwitchToMode "Scroll"; }
        }
      }
    '';
  };

}
