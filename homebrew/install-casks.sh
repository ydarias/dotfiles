#!/bin/sh

set -e

echo "⏳ Tapping casks ..."
brew tap homebrew/homebrew-cask
echo "✅ Homebrew casks tapped"

apps=(
  1password
  cyberduck
  discord
  docker
  dropbox
  firefox
  gpg-suite
  iterm2
  jetbrains-toolbox
  logi-options-plus
  logitech-presentation
  mockoon
  nordvpn
  notion
  notion-calendar
  obsidian
  openvpn-connect
  postman
  raycast
  slack
  spotify
  telegram
  visual-studio-code
  zotero
)

brew install --cask "${apps[@]}"

brew cleanup
echo "✅ Removed outdated formulas"

exit 0
