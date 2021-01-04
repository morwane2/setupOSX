#!/usr/bin/env bash
#
# Helpers
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }


echo_ok "Starting bootstrapping"

# Update homebrew recipes
brew update

PACKAGES=(
    #git
    mutt
    python3
    pyenv
    tmux
    )

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."

CASKS=(
    agenda
    atom
    calibre
    fantastical
    firefox
    google-drive
    grammarly
    kindle
    mactex
    omnifocus
    omnigraffle
    omnioutliner
    skype
    spotify
    steam
    tunnelblick
    xquartz
    zoom
    )

echo "Installing cask apps..."
brew install ${CASKS[@]}

echo "Installing appstore apps..."
mas install 1435957248   # Drafts
mas install 1055511498   # Day One
mas install 1370791134   # DigiDoc4 Client
mas install 1481669779   # Evernote Web Clipper
mas install 1462114288   # Grammarly for Safari
mas install 1477385213   # Save to Pocket

mas install 409183694    # Keynote
mas install 409203825    # Numbers
mas install 409201541    # Pages
mas install 408981434    # iMovie

echo_ok "Bootstrapping complete"
