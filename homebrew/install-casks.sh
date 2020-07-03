#!/bin/sh

set -e

echo "⏳ Tapping casks ..."
brew tap homebrew/homebrew-cask
echo "✅ Homebrew casks tapped"

brew cask install dash
brew cask install gpg-suite

exit 0
