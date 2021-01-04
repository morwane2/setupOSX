#!/usr/bin/env bash
#
# Bootstrap script for setting up a new mac laptop
#
##
# Reading:
#
# - https://gist.github.com/codeinthehole/26b37efa67041e1307db
# - https://gist.github.com/somebox/6b00f47451956c1af6b4

# Helpers
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }


echo_ok "Starting bootstrapping"

# Requires xcode and tools!
xcode-select -p || exit "XCode must be installed! (use the app store)"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo_warn "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    mas
    vim
    wget
)

echo_warn "Installing packages..."
brew install ${PACKAGES[@]}

echo_ok "Cleaning up..."
brew cleanup

echo_warn "Installing cask apps..."
brew install 1password
brew install dropbox
brew install evernote
brew install nextcloud
brew install alfred
brew install karabiner-elements
brew install keyboard-maestro
brew install textexpander
brew install hazel
brew install devonthink
brew install google-chrome
brew install setapp


echo_warn "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo_warn "Installing Estonian language support..."
cd $HOME/Library/Spelling
wget http://www.meso.ee/~jjpp/speller/et_EE.dic
wget http://www.meso.ee/~jjpp/speller/et_EE.aff
cd $HOME

echo_warn "Configuring OSX..."

# Set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true


echo_ok "Bootstrapping complete"
