clean:
	echo "Cleaning"
	rm -rf bundle

deploy:
	cp -r fonts/ubuntu-font-family-0.80 ~/.fonts
	-mkdir bundle
	-cd bundle && git clone http://github.com/gmarik/Vundle.vim.git Vundle.vim
	vim +BundleInstall +qall
	sudo aptitude install build-essential cmake python-dev clang-3.4 libclang-3.4-dev
	cd bundle/YouCompleteMe
	./install.sh --clang-completer --system-libclang

PHONY: clean deploy
