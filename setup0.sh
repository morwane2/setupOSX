#!/usr/bin/env bash
#
# Helpers
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }

echo_ok "Stage 0 bootstrapping"

echo_warn "Setting ComputerName"
sudo scutil --set ComputerName remus
sudo scutil --set LocalHostName remus
sudo scutil --set HostName remus

echo_warn "Creating folder structure..."
[[ ! -d tmp ]] && mkdir tmp

echo_ok "Stage 0 bootstrapping complete"
echo_ok "Now install XCode from the app store and then run:"
echo_ok "xcode-select --install"

