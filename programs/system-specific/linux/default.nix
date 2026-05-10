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
    ./telegram
    ./zed
    ./microsoft-edge
  ];
}
