#!/bin/sh

set -e

echo "⏳ Tapping casks ..."
brew tap homebrew/homebrew-cask
echo "✅ Homebrew casks tapped"

apps=(
  1password
  clipy
  cyberduck
  discord
  docker
  dropbox
  firefox
  gitup
  gpg-suite
  grandperspective
  http-toolkit
  iterm2
  jetbrains-toolbox
  mockoon
  nordvpn
  notion
  obsidian
  postman
  slack
  spotify
  steelseries-gg
  homebrew/cask-drivers/logitech-g-hub
)

brew install --cask "${apps[@]}"

brew cleanup
echo "✅ Removed outdated formulas"

exit 0
