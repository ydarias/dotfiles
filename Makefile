all: \
	homebrew \
	homebrew-casks \
	zsh

homebrew: 
	homebrew/install.sh

homebrew-casks: 
	homebrew/install-casks.sh

zsh: 
	zsh/install.zsh