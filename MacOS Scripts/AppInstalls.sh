#!/bin/sh

# Install script for MacOS using Homebrew
# To execute: save and `chmod +x ./MacInstalls.sh` then `./MacInstalls.sh`

# echo "Installing Homebrew package manager"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# echo "Installing brew casks..."
brew tap homebrew/cask
brew tap homebrew/cask-fonts

# Personal programs
brew install --cask firefox
brew install --cask google-chrome
brew install --cask discord
brew install --cask spotify
brew install --cask homebrew/cask-drivers/displaylink

# Dev tools
echo "Install Dev Tools? (Y/N) " 
read devToolDecision

if [[ "$devToolDecision" == "Y" || "$devToolDecision" == "y" ]]; then
    brew install git
    brew install nvm
    brew install nano
    brew install font-fira-code
    brew install --cask iterm2
    brew install --cask dotnet-sdk
    brew install --cask slack
    brew install --cask microsoft-teams
    brew install --cask visual-studio-code
    brew install --cask docker
    brew install --cask postman
    brew install --cask azure-data-studio
    brew install --cask kdiff3
    brew install --cask fork
fis