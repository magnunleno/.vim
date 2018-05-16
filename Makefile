ifneq ($(shell grep -i "fedora\|red hat\|cent" /etc/issue),)
	INSTALL=yum install python-libs pyhton-devel cmake gcc-c++ wmctrl git clang clang-devel ctags-etags
else ifneq ($(shell grep -i "debian\|ubuntu\|mint" /etc/issue),)
	INSTALL=apt-get install build-essential cmake python-dev clang-3.4 libclang-3.4-dev wmctrl git
endif

VIMBKP=~/.vimbkp-$(shell date +"%Y-%m-%d")

clean:
	@echo Cleaning
	rm -rf bundle/*

backup:
	@echo Making backup at $(VIMBKP)
	mkdir $(VIMBKP)
	mv ~/.vim $(VIMBKP)/
	mv ~/.vimrc $(VIMBKP)/
	-mv ~/.viminfo $(VIMBKP)/
	-mv ~/.vimtags $(VIMBKP)/

deploy: install-deps link install-bundles install-deps fonts

link:
	@echo Linking ~/.vimrc
	@if [ -L ~/.vimrc ]; then \
		 unlink ~/.vimrc; \
	fi
	cd ~/ && ln -s ~/.vim/.vimrc .vimrc

install-bundles:
	@echo Installing bundles...
	vim +PlugInstall +qall

install-deps:
	@echo Installing dependencies...
ifeq (,$(INSTALL))
	@echo Unknown OS.
endif
	sudo $(INSTALL)

fonts:
	@echo Copying fonts...
	-mkdir ~/.fonts
	cp -r fonts/ ~/.fonts

PHONY: clean deploy link install-bundles install-deps fonts
