#!/bin/sh

set -e

# Check for Homebrew
if test ! $(which brew)
then
  echo "⏳ Installing Homebrew for you ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "✅ Homebrew already installed"
fi

# Make sure we’re using the latest Homebrew.
echo "⏳ Updating Homebrew to last version ..."
brew update
echo "✅ Homebrew was updated"

# Upgrade any already-installed formulae.
echo "⏳ Upgrading installed formulae ..."
brew upgrade
echo "✅ Homebrew formulas updated"

brew install curl
brew install navi
brew install python3
brew install wget

brew cleanup
echo "✅ Removed outdated formulas"

exit 0
