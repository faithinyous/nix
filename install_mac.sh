#!/bin/bash

echo "================================= Install brew apps ================================="

# browser
brew install --cask firefox
brew install --cask firefox-nightly
brew install --cask google-chrome

# cli
brew install mas
brew install mpv
brew install wkhtmltopdf

# cloud storage
brew install --cask dropbox
brew install --cask nextcloud
brew install --cask syncthing

# communication
brew install --cask adium
brew install --cask discord-canary
brew install --cask microsoft-teams
brew install --cask slack
brew install --cask whatsapp
brew install --cask zoom

# data
# brew install --cask qgis
brew install --cask tad
brew install apache-spark

# dev tools
brew install --cask datagrip
brew install --cask db-browser-for-sqlite
brew install --cask devdocs
brew install --cask devtoys
brew install --cask docker
brew install --cask fig
brew install --cask fork
brew install --cask gitup
brew install --cask httpie
brew install --cask intellij-idea
brew install --cask iterm2
brew install --cask microsoft-remote-desktop
brew install --cask mongodb-compass
brew install --cask openlens
brew install --cask postman
brew install --cask tailscale
brew install --cask vincelwt-chatgpt
brew install --cask visual-studio-code
brew install padok-team/tap/tfautomv
docker extension install aquasec/trivy-docker-extension
docker extension install docker/disk-usage-extension
docker extension install docker/logs-explorer-extension
docker extension install lucasbernalte981/graph-view-extension
docker extension install prakhar1989/dive-in
docker extension install slimdotai/dd-ext
docker extension install snyk/snyk-docker-desktop-extension

# entertainment
brew install --cask calibre
brew install --cask fbreader
brew install --cask iina
brew install --cask jellyfin-media-player
brew install --cask pocket-casts
brew install --cask simple-comic
brew install --cask transmission-remote-gui
brew install --cask xnviewmp
# brew install --cask spotify

# quick look
brew install --cask syntax-highlight
brew install --cask jupyter-notebook-viewer
brew install --cask qlmarkdown

# productivity
brew install --cask cron
brew install --cask macdown
brew install --cask meetingbar
brew install --cask miro
brew install --cask notion
brew install --cask obsidian
brew install --cask sleek
brew install --cask standard-notes
brew install --cask todoist
brew install --cask todotxt

# utilities
brew install --cask alfred
brew install --cask angry-ip-scanner
brew install --cask appcleaner
brew install --cask balenaetcher
brew install --cask bitwarden
brew install --cask cheatsheet
brew install --cask clocker
brew install --cask cloudflare-warp
brew install --cask coconutbattery
brew install --cask dozer
brew install --cask eul
brew install --cask flameshot
brew install --cask hot
brew install --cask kap
brew install --cask keepassxc
brew install --cask keepingyouawake
brew install --cask maccy
brew install --cask mactracker
brew install --cask michaelvillar-timer
brew install --cask muzzle
brew install --cask numi
brew install --cask protonvpn
brew install --cask shifty
brew install --cask spectacle
brew install --cask stats
brew install --cask the-unarchiver
brew install --cask tyke
brew install --cask yubico-yubikey-manager

# peripheral software
brew install --cask logi-options-plus
brew install --cask logitech-camera-settings

echo "================================= Install App Store applications ================================="
mas install 1176895641 # spark
mas install 1423210932 # flow - focus & pomodoro timer
mas install 1451685025 # wireguard
mas install 539883307  # LINE
mas install 568494494  # pocket
# mas install 1274495053 # microsoft todo