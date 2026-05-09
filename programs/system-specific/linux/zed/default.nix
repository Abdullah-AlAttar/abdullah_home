{
  config,
  pkgs,
  lib,
  ...
}:

let
  hasZedEditor = builtins.hasAttr "zed-editor" pkgs;
in
{
  config = lib.mkMerge [
    (lib.mkIf (config.programs.system-specific.enableGuiApps && hasZedEditor) {
      home.packages = [ pkgs."zed-editor" ];

      home.file.".config/zed/settings.json" = {
        source = ./settings.json;
      };

      home.file.".config/zed/keymap.json" = {
        source = ./keymap.json;
      };
    })
    {
      warnings =
        lib.optional (config.programs.system-specific.enableGuiApps && !hasZedEditor)
          "programs.system-specific.zed: zed-editor is not available for this platform; skipping installation.";
    }
  ];
}