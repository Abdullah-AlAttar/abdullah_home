{
  config,
  pkgs,
  lib,
  ...
}:

let
  hasZed = builtins.hasAttr "zed" pkgs || builtins.hasAttr "zed-editor" pkgs;
  zedPkg = if builtins.hasAttr "zed" pkgs then pkgs.zed else pkgs."zed-editor";
in
{
  config = lib.mkMerge [
    (lib.mkIf (config.programs.system-specific.enableGuiApps && hasZed) {
      home.packages = [ zedPkg ];

      home.file.".config/zed/settings.json" = {
        source = ./settings.json;
      };

      home.file.".config/zed/keymap.json" = {
        source = ./keymap.json;
      };
    })
    {
      warnings =
        lib.optional (config.programs.system-specific.enableGuiApps && !hasZed)
          "programs.system-specific.zed: zed is not available for this platform; skipping installation.";
    }
  ];
}