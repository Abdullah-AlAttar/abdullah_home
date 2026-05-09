# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A personal [Home Manager](https://nix-community.github.io/home-manager/) configuration managed as a Nix flake. It targets a single user (`ab_dullah`) on `x86_64-linux`, primarily running under WSL2. Home Manager is used in standalone mode (not as a NixOS module).

## Key Commands

All common tasks are defined in `taskfile.yml` and can be run with `task <name>` (alias: `t`):

| Command | Effect |
|---|---|
| `task hm:switch` | Apply the configuration: `home-manager switch --flake .#ab_dullah` |
| `task flake:update` | Update all flake inputs (`nix flake update`) |
| `task nix:clean` | Garbage-collect the Nix store |
| `task astrovim:sync` | Sync the AstroVim lazy-lock.json from `~/.config/nvim/` back into this repo |

To check for evaluation errors without switching: `nix flake check` or `nix eval .#homeConfigurations.ab_dullah.activationPackage`.

Format Nix files with `nixfmt <file.nix>` (available in the environment).

## Architecture

The entry point is `flake.nix`, which defines a single `homeConfigurations.ab_dullah` output. It pulls in `home.nix` as the root module, passing `username` and `inputs` as `extraSpecialArgs`.

`home.nix` is the top-level Home Manager module. It:
- Imports all program sub-modules from `programs/`
- Declares `home.packages` (the flat list of imperatively-installed packages)
- Sets `targets.genericLinux.enable = true` (required for non-NixOS Linux)

### Programs directory layout

Each program lives in `programs/<name>/`. A directory module uses `default.nix` as its entry; a single-file module is `programs/<name>.nix`.

- **Shell**: `programs/zsh/` and `programs/bash/` — zsh is primary. Shell init content is sourced from plain `.sh` files (`zshInitContent.sh`, `bashrcExtra.sh`) and read with `builtins.readFile`.
- **Editor**: `programs/neovim/` — configured via [nixvim](https://github.com/nix-community/nixvim) (`inputs.nixvim.homeModules.nixvim`). Config is split into `autocommands.nix`, `completion.nix`, `keymappings.nix`, `options.nix`, and `plugins/`. Extra Lua is loaded from `extraConfigLua.lua`.
- **Helix**: `programs/helix/` — config and language settings loaded from TOML files via `builtins.fromTOML`.
- **Prompt**: `programs/starship/theme.toml` — Catppuccin Mocha palette, powerline-style.
- **Dev environments**: `programs/direnv/` — nix-direnv enabled; the stdlib injects `devenv` direnv helpers so `use devenv` works in `.envrc` files.
- **System-specific**: `programs/system-specific/` — detects WSL at eval time via `builtins.pathExists /proc/sys/fs/binfmt_misc/WSLInterop`. Native Linux-only configs (Alacritty, Ghostty terminals) live under `programs/system-specific/linux/`.

### Best practice: GUI-only on NixOS

Use one explicit context flag plus one central gate:

- Pass `isNixOS = true` when Home Manager is used via the NixOS module.
- Pass `isNixOS = false` for standalone Home Manager (WSL/Ubuntu).
- In `programs/system-specific/default.nix`, compute `enableGuiApps = isNixOS && pkgs.stdenv.isLinux && !isWSL`.
- Gate GUI package installs and GUI dotfiles with `config.programs.system-specific.enableGuiApps`.

Current result in this repo:

- Ghostty is installed only when `enableGuiApps` is true.
- Ghostty is exported as the default terminal via `home.sessionVariables.TERMINAL = "ghostty"`.
- GUI fonts are installed only when `enableGuiApps` is true from `programs/system-specific/linux/fonts/`:
  - `google-fonts` (source package that can contain Google Sans Code Monospaced files)
  - `nerd-fonts.caskaydia-cove`

### HM vs NixOS ownership

Use this split to keep the dendritic pattern clean:

- Put user-scoped GUI apps and dotfiles in Home Manager modules (for example `ghostty`, per-user font packages, editor config).
- Put system-wide desktop stack in NixOS host modules under `modules/hosts/mainPC/` (display manager, desktop environment, portals, drivers, system fonts for all users).
- Keep cross-platform gating in one Home Manager location (`programs/system-specific/default.nix`) and let leaf modules consume that option.

### Flake inputs

| Input | Pinned to |
|---|---|
| `nixpkgs` | `nixos-unstable` |
| `home-manager` | `master` (follows nixpkgs) |
| `nixvim` | `master` (follows nixpkgs) |

## Nix Patterns Used Here

- `builtins.readFile` — inline shell/Lua/TOML files into Nix strings
- `builtins.fromTOML` — parse TOML config files directly into Nix attrs
- `lib.mkIf` / `lib.mkMerge` — conditional option values (e.g., platform-specific `rm` alias in zsh)
- `extraSpecialArgs` — passes `username` and `inputs` down to all modules
