#!/bin/sh

set -e

echo "⏳ Tapping casks ..."
brew tap homebrew/homebrew-cask
echo "✅ Homebrew casks tapped"

apps=(
  1password
  dash
  firefox
  iterm2
  gpg-suite
)

brew install --cask "${apps[@]}"

brew cleanup
echo "✅ Removed outdated formulas"

exit 0
