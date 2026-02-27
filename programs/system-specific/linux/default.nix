# System-specific configurations
{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacrity
    ./ghostty
  ];
}
