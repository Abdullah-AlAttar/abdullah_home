# System-specific configurations
{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./alacrity
    ./ghostty
    ./fonts
    ./obs
    ./obsidian
    ./telegram
    ./zed
    ./microsoft-edge
  ];
}
