# ~/.config/home-manager/home.nix
{
  config,
  pkgs,
  lib,
  username,
  ...
}:

{
  # Allow unfree packages (required for GitHub Copilot)
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./common.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username; # Replace with your username
  home.homeDirectory = "/home/${username}"; # Replace with your home paths

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when updating Home Manager. Use the version you chose in flake.nix.
  # It's recommended to leave this unchanged and instead bump it manually
  # periodically after confirming compatibility.
  home.stateVersion = "24.11"; # Set this to the version you're using

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # This is required for using Home Manager with non-NixOS Linux distributions (like WSL)
  targets.genericLinux.enable = true;

}
