clean:
	echo "Cleaning"
	rm -rf bundle

deploy:
	cp -r fonts/ubuntu-font-family-0.80 ~/.fonts
	-mkdir bundle
	-cd bundle && git clone http://github.com/gmarik/Vundle.vim.git Vundle.vim
	vim +BundleInstall +qall

PHONY: clean deploy
