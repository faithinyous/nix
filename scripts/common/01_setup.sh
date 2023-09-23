#!/bin/bash

####################
# prep mac
####################
if [[ $(uname -s) == 'Darwin' ]]; then
	echo "========== Installing xcode cli development tools =========="
	xcode-select --install

	if [[ $(uname -m) == 'arm64' ]]; then
		echo "========== Installing rosetta =========="
		/usr/sbin/softwareupdate --install-rosetta --agree-to-license

		echo "========== Installing sops =========="
		curl -LO https://github.com/getsops/sops/releases/download/v3.8.0/sops-v3.8.0.darwin.arm64
		mv sops-v3.8.0.darwin.arm64 /usr/local/bin/sops
	else
		echo "========== Installing sops =========="
		curl -LO https://github.com/getsops/sops/releases/download/v3.8.0/sops-v3.8.0.darwin
		mv sops-v3.8.0.darwin /usr/local/bin/sops
	fi
fi

####################
# prep debian
####################
if [[ $(uname -s) == 'Linux' ]]; then
	echo "========== Installing build tools and other essentials =========="
	sudo apt-get install build-essential g++ gcc libbz2-dev libc-dev liblzma-dev libncurses5-dev \
		libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev \
		llvm make tk-dev xz-utils zlib1g-dev curl wget ntfs-3g -y
fi

####################
# pre install sops and extract secrets
####################

bash ./scripts/decrypt.sh

####################
# setup nix
####################
sh <(curl -L https://nixos.org/nix/install) --daemon

export PATH=$PATH:/nix/var/nix/profiles/default/bin/

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
nix-channel --update

# temporary since during init only bash/zsh shell is available
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
export PATH=$PATH:/nix/var/nix/profiles/default/bin/
export PATH=$PATH:$HOME/.nix-profile/bin
# export NIXPKGS_ALLOW_INSECURE=1

rm -f ~/.config/home-manager/home.nix

mkdir -p "$HOME/.config/home-manager"
ln -s "$PWD"/* "$HOME/.config/home-manager"

if [ -f ".env" ]; then
	source .env
else
	echo ".env doesn't exist! Please create .env and populate variables."
	exit 1
fi

nix-shell '<home-manager>' -A install
home-manager switch

# these stay here because their source config is populated via nix
### fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
fish -c "fisher install franciscolourenco/done"
fish -c "fisher install jorgebucaran/autopair.fish"
fish -c "fisher install jorgebucaran/fisher"
fish -c "fisher install jorgebucaran/nvm.fish"
fish -c "fisher install meaningful-ooo/sponge"
fish -c "fisher install patrickf1/colored_man_pages.fish"

### nvim
nvim --headless +PlugInstall +qall
