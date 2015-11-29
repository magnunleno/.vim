VIMBKP=~/.vimbkp-$(shell date +"%Y-%m-%d")

clean:
	$(info Cleaning...)
	echo "Cleaning"
	rm -rf bundle/*

backup:
	$(info Making backup at $(VIMBKP))
	mkdir $(VIMBKP)
	mv ~/.vim $(VIMBKP)/
	mv ~/.vimrc $(VIMBKP)/
	-mv ~/.viminfo $(VIMBKP)/
	-mv ~/.vimtags $(VIMBKP)/

deploy: link install-vundle install-bundles build-deps fonts

link:
	cd ~/ && ln -s ~/.vim/.vimrc .vimrc

install-vundle:
	$(info Installing Vundle...)
	-mkdir bundle
	-cd bundle && git clone http://github.com/gmarik/Vundle.vim.git Vundle.vim

install-bundles:
	$(info Installing bundles...)
	vim +BundleInstall +qall

build-deps:
	$(info Building dependencies...)
	sudo aptitude install build-essential cmake python-dev clang-3.4 libclang-3.4-dev wmctrl
	cd bundle/YouCompleteMe && ./install.sh --clang-completer --system-libclang

fonts:
	$(info Copying fonts...)
	cp -r fonts/ ~/.fonts

PHONY: clean deploy link install-vundle install-bundles build-deps fonts
