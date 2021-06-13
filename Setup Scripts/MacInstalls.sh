#!/bin/sh

# Install script for MacOS using Homebrew
# To execute: save and `chmod +x ./MacInstalls.sh` then `./MacInstalls.sh`

echo "Installing Homebrew package manager"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew cask..."
brew tap homebrew/cask

# Personal programs
brew install --cask firefox
brew install --cask google-chrome
brew install --cask discord
brew install --cask sensiblesidebuttons

# Dev tools
echo "Install Dev Tools? (Y/N) " 
read devToolDecision

if [[ "$devToolDecision" == "Y" || "$devToolDecision" == "y" ]]; then
    brew install --cask iterm2
    brew install --cask dotnet-sdk
    brew install --cask git
    brew install --cask slack
    brew install --cask microsoft-teams
    brew install --cask zoom
    brew install --cask visual-studio-code
    brew install --cask docker
    brew install --cask postman
    brew install --cask azure-data-studio
    brew install --cask kdiff3
    brew install --cask fork
    brew install nvm
fi