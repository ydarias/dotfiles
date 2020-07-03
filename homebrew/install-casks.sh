#!/bin/sh

set -e

echo "⏳ Tapping casks ..."
brew tap homebrew/homebrew-cask
echo "✅ Homebrew casks tapped"

apps=(
    dash
    firefox
    gpg-suite
)

brew cask install "${apps[@]}"

brew cleanup
echo "✅ Removed outdated formulas"

exit 0
