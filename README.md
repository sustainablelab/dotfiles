Install Vim Plugins
--------------------
After cloning, add the vim plugins to the pack/bundle/start/ directory to match
the below tree:

    /home/Mike/dotfiles/
    ▸ .git/
    ▾ .vim/
      ▸ colors/
      ▸ keymap/
      ▾ pack/
        ▾ bundle/
          ▾ start/
            ▸ nerdtree/
            ▸ tabulous/
            ▸ vim-markdown/
      .vimrc
      README.md

How to install plugins
----------------------
    ```bash
    $ mkdir -p ~/.vim/pack/bundle/start/
    $ cd ~/.vim/pack/bundle/start/
    $ git clone https://github.com/scrooloose/nerdtree.git
    $ git clone https://github.com/webdevel/tabulous.git
    ```

References:

Vim help:
    ```vim
    :h packages
    ```

StackOverflow:
    https://vi.stackexchange.com/questions/613/how-do-i-install-a-plugin-in-vim-vi
