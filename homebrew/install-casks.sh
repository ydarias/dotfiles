#!/bin/sh

set -e

echo "⏳ Tapping casks ..."
brew tap homebrew/homebrew-cask
echo "✅ Homebrew casks tapped"

apps=(
  1password
  clipy
  cyberduck
  dash
  dropbox
  firefox
  gitup
  gpg-suite
  grandperspective
  http-toolkit
  iterm2
  lens
  nosqlbooster-for-mongodb
  notion
  obsidian
  postman
  slack
  spotify
  visual-studio-code
)

brew install --cask "${apps[@]}"

brew cleanup
echo "✅ Removed outdated formulas"

exit 0
