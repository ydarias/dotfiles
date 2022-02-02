#!/bin/sh

set -e

# Check for Homebrew
if test ! $(which brew)
then
  echo "⏳ Installing Homebrew for you ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

brew tap mongodb/brew

apps=(
  curl
  git
  helm
  htop
  jq
  navi
  nvm
  wget
)

brew install "${apps[@]}"

brew cleanup
echo "✅ Removed outdated formulas"

exit 0
