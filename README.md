# My Personal home-manager configuration

## Installation
### Prerequisites
```bash
sudo apt-get install wget curl xz-utils git
```
### install `Nix : the package manager` from [the official site](https://nixos.org/download/)
probably
```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

say yes to all prompts, then  
```bash
# This must be sourced in your .profile or whatever shell you're using.
# In the future we can get home-manager to do this for us, but bootstrapping for now...
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
```

Then add `experimental-features = nix-command flakes` to `/etc/nix/nix.conf`



### install `home-manager` from [the official site](https://nix-community.github.io/home-manager/index.xhtml#ch-installation), make sure to do the Standalone installation
Probably
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install
```
add ` . "/home/ab_dullah/.nix-profile/etc/profile.d/hm-session-vars.sh"` to your `~/.profile`

### Clone this repository to your home directory
```bash
git clone https://github.com/Abdullah-AlAttar/abdullah_home.git
cd abdullah_home
```

### Let the magic happen
```
home-manager switch --flake .#ab_dullah  -b backup
```