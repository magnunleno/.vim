VIMBKP=~/.vimbkp-$(shell date +"%Y-%m-%d")

clean:
	echo "Cleaning"
	rm -rf bundle/*

backup:
	echo "Making backup at: $(VIMBKP)"
	mkdir $(VIMBKP)
	mv ~/.vim $(VIMBKP)/
	mv ~/.vimrc $(VIMBKP)/
	-mv ~/.viminfo $(VIMBKP)/
	-mv ~/.vimtags $(VIMBKP)/

deploy: link install-vundle install-bundles build-deps fonts

link:
	cd ~/ && ln -s ~/.vim/.vimrc .vimrc

install-vundle:
	-mkdir bundle
	-cd bundle && git clone https://github.com/gmarik/Vundle.vim.git Vundle.vim

install-bundles:
	vim +BundleInstall +qall

build-deps:
	sudo aptitude install build-essential cmake python-dev clang-3.4 libclang-3.4-dev wmctrl
	cd bundle/YouCompleteMe && ./install.sh --clang-completer --system-libclang

fonts:
	cp -r fonts/ ~/.fonts

PHONY: clean deploy link install-vundle install-bundles build-deps fonts
