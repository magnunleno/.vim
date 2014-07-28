My VIM Setup
============

This is my current VIM setup. It's composed by a bunch of plugins, some mappings, colors, fonts and specific VIM settings.

This setup is very Python/reStructured Text centric, since those are the main languages I use, but it can be easily adapted to other languages. There are some small settings for C and HTML.

Any issue or feedback must be provided through the [issues page](https://github.com/magnunleno/.vim/issues)

Feel free to use, adapt, correct and evolve it.

Testing
-------

To test this setup, backup you `.vim` folder and `.vimrc` file:

```bash
$ cd ~/
$ VIMBKP=~/.vimbkp-`date +"%Y-%m-%d"`
$ mkdir $VIMBKP
$ mv ~/.vim $VIMBKP/
$ mv ~/.vimrc $VIMBKP/
```

Optionally, backup your `.viminfo` and `.vimtags` too:

```bash
$ mv ~/.viminfo $VIMBKP/
$ mv ~/.vimtags $VIMBKP/
```


After that, simply clone this repository and run `make deploy`:

```bash
$ git clone http://github.com/magnunleno/.vim ~/.vim
$ cd ~/.vim && make deploy
```
