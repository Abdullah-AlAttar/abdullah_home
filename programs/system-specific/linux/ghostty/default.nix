{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.programs.system-specific.enableNativeLinux {
    home.file.".config/ghostty/config" = {
      source = ./config;
    };
  };
}
