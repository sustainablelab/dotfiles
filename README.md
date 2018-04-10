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

Setup for Python Dev
--------------------
Install handy utilities:

    ```bash
    #tree
    $ sudo apt install tree

    #pip3
    $ sudo apt install python3-pip
    $ pip3 install --upgrade pip

    #virtualenv
    $ pip3 install virtualenv

    #virtualenvwrapper
    sudo pip3 install virtualenvwrapper
    ```

Note the location of virtualenvwrapper.sh.
Or find it with `find`:

    ```bash
    $ find /usr/local/bin -type f -name "virtualenvwrapper.sh"
    ```
    usr/local/bin/virtualenvwrapper.sh

Edit your .profile to run the virtualenvwrapper.sh script:

    ```bash
    $ vim .profile
    ```
    Add these lines to the end of your .profile:
    ```bash
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    export WORKON_HOME=$HOME/python/.virtualenvs
    export PROJECT_HOME=$HOME/python/dev
    source /usr/local/bin/virtualenvwrapper.sh
    ```

Create the PROJECT_HOME folder:

    ```bash
    $ mkdir -p $HOME/python/dev
    ```

Source your .profile:

    ```bash
    $ . .profile
    ```
    The first time the `virtualenvwrapper.sh` script runs, the `.virtualenvs`
    folder is created and several files are placed there.
    Changing the value of `WORKON_HOME` does not affect this location.
    The `.virtualenvs` folder set by `WORKON_HOME` is used when
    `virtualenvwrapper` commands are invoked, e.g., `mkproject`.

Make a test project:

    ```bash
    $ mkproject nevermind
    ```
    The `WORKON_HOME` path is created if it does not exist.
    For some reason, the `PROJECT_HOME` path does not get created, which is why
    you manually created earlier.
    Project `nevermind` is now the active project.
    `pip` now calls `pip3` in the `nevermind` project.
    `python` now calls `python3` in the `nevermind` project.

Try installing some packages in the virtualenv:

    ```bash
    $ pip install numpy
    $ pip install maptlotlib
    $ pip install pyqt5
    ```

