{ pkgs, config, lib, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    luajitPackages.jsregexp
  ];


  # How do i make this dynamic? Hardcoded doesn't seem so nice but it's the only way i can make the symlink work.
  # Relevant issue: https://github.com/nix-community/home-manager/issues/3514

  # xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink (toString ./astro_template);

  # Symlink individual files and directories instead of the whole nvim config
  # This allows lazy-lock.json to be writable
  xdg.configFile = {
    "nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink (toString ./astro_template/init.lua);
    "nvim/lua".source = config.lib.file.mkOutOfStoreSymlink (toString ./astro_template/lua);
    # Add other files/dirs from astro_template as needed, but exclude lazy-lock.json
    # For example:
    "nvim/selene.toml".source = config.lib.file.mkOutOfStoreSymlink (toString ./astro_template/selene.toml);
    "nvim/neovim.yml".source = config.lib.file.mkOutOfStoreSymlink (toString ./astro_template/neovim.yml);
    "nvim/.neoconf.json".source = config.lib.file.mkOutOfStoreSymlink (toString ./astro_template/.neoconf.json);
    "nvim/.stylua.toml".source = config.lib.file.mkOutOfStoreSymlink (toString ./astro_template/.stylua.toml);
    # "nvim/lazy-lock.json".source = config.lib.file.mkOutOfStoreSymlink (toString ./astro_template/lazy-lock.json);
    "nvim/README.md".source = config.lib.file.mkOutOfStoreSymlink (toString ./astro_template/README.md);
    # Add other files/dirs from astro_template as needed
  };
}
