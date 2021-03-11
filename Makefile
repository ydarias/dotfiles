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

install-wallpapers:
	wallpapers/install.sh

terminal:
	terminal/install.sh