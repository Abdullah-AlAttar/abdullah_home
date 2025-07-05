# System-specific configurations
{ config, pkgs, lib, ... }:

let
  # Check if running in WSL by looking for WSL-specific environment
  isWSL = builtins.pathExists /proc/sys/fs/binfmt_misc/WSLInterop 
         || builtins.pathExists /run/WSL
         || (builtins.getEnv "WSL_DISTRO_NAME" != "");
  
  # Enable native Linux configurations only on real Linux (not WSL)
  enableNativeLinux = pkgs.stdenv.isLinux && !isWSL;
in
{
  imports = [
    ./linux
  ];
  
  # Option to enable native Linux configurations
  options.programs.system-specific.enableNativeLinux = lib.mkOption {
    type = lib.types.bool;
    default = enableNativeLinux;
    description = "Enable native Linux configurations (excludes WSL/generic Linux)";
  };
}
