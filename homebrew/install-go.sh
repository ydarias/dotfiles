#!/bin/sh

set -e

brew install chruby ruby-install

# There could be some problem with wget installed by Homebrew
ruby-install ruby-3.1.0

# For Intel
#echo "source /usr/local/share/chruby/chruby.sh" >> ~/.zshrc
#echo "source /usr/local/share/chruby/auto.sh" >> ~/.zshrc
#echo "chruby ruby-3.1.0" >> ~/.zshrc

# For Apple silicon
echo "source /opt/homebrew/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source /opt/homebrew/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.1.0" >> ~/.zshrc
