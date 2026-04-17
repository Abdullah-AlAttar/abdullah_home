# My Personal home-manager configuration

## Installation
### Prerequisites
```bash
sudo apt-get install wget curl xz-utils git
```
### Install Nix (package manager)
Use the official installer: https://nixos.org/download/

For Linux and WSL2 (with systemd enabled):
```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

Then enable flakes in `~/.config/nix/nix.conf` (or `/etc/nix/nix.conf`):

```conf
experimental-features = nix-command flakes
```

If needed, restart the daemon:

```bash
sudo systemctl restart nix-daemon.service
```

If Home Manager does not manage your shell startup files, source session vars manually:

```bash
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
```

### Clone this repository

```bash
git clone https://github.com/Abdullah-AlAttar/abdullah_home.git
cd abdullah_home
```

### Activate this flake (recommended)

First run (works even if `home-manager` is not installed yet):

```bash
nix run home-manager/master -- switch --flake .#ab_dullah -b backup
```

After that, regular updates:

```bash
home-manager switch --flake .#ab_dullah -b backup
```

### Update inputs

```bash
nix flake update
home-manager switch --flake .#ab_dullah -b backup
```

### Legacy (channel-based) install (optional)

Only use this if you specifically want channel-based Home Manager instead of flakes:

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```