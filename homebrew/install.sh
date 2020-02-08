#!/bin/sh

# Check for Homebrew
if test ! $(which brew)
then
  echo "⏳ Installing Homebrew for you ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "✅ Homebrew already installed"
fi

exit 0
