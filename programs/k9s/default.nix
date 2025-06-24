{
  programs.k9s = {
    enable = true;
    settings = {
      k9s = {
        refreshRate = 2;
        ui = {
          headless = false;
          logoless = true;
          skin = "catppuccin-macchiato-transparent";
        };
        logger = {
          fullScreen = false;
        };
      };

    };

    views = import ./views.nix;
    plugins = import ./plugins.nix;

    skins = import ./skins.nix;
  };
}
