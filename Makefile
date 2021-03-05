all: \
	brew \
	cask \
	terminal

brew-all: \
	brew \
	cask

brew:
	homebrew/install.sh

cask:
	homebrew/install-casks.sh

terminal:
	zsh/install.zsh

install-wallpapers:
	wallpapers/install.sh