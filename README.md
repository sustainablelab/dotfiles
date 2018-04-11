# Vim Setup
Cloning this repository takes care of the `.vimrc` and the files it references:
* my custom `symbols.vim` keymap for engineering symbols and utf-8 text-art
* color schemes:
    * `badwolf.vim`: my default scheme
    * `deus.vim`: for notes
    * `duoduo.vim`: for Vim script

The `.vimrc` also depends on two plugins: `nerdtree` and `tabulous`.
## Vim plugins in my setup
After cloning, add the vim plugins to the `/.vim/pack/bundle/start/` directory
to match the tree below:

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
      .vimrc
      README.md

## How to install plugins
From *Vim help* and *Stack Overflow*, this seems to be the preferred method as
of `Vim 8.0`. It does not require a plugin manager.

    ```bash
    $ mkdir -p ~/.vim/pack/bundle/start/
    $ cd ~/.vim/pack/bundle/start/
    $ git clone https://github.com/scrooloose/nerdtree.git
    $ git clone https://github.com/webdevel/tabulous.git
    ```

### References:

Vim help:

    ```vim
    :h packages
    ```

StackOverflow:

    https://vi.stackexchange.com/questions/613/how-do-i-install-a-plugin-in-vim-vi

# Python Setup
## Install shell utilities, `pip3`, and `virtualenv` tools
* tree
* pip3
* virtualenv
* virtualenvwrapper

    ```bash
    #tree
    $ sudo apt install tree

    #pip3
    $ sudo apt install python3-pip
    $ pip3 install --upgrade pip

    #virtualenv
    $ pip3 install virtualenv

    #virtualenvwrapper
    $ sudo pip3 install virtualenvwrapper
    ```

### Find `virtualenvwrapper.sh`
Note the location of the `virtualenvwrapper.sh` script.

If you missed it during the install, it is probably in `/usr/local/bin`. Find it
quickly with `find`:

    ```bash
    $ find /usr/local/bin -type f -name "virtualenvwrapper.sh"
    usr/local/bin/virtualenvwrapper.sh
    ```

## Add `virtualenv` environment variables and source the script
Edit your `.profile` (located in `$HOME`) to run the `virtualenvwrapper.sh`
script:

    ```bash
    $ vim .profile

    =====[ Add these lines to the end of your `.profile` ]=====

    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    export WORKON_HOME=$HOME/python/.virtualenvs
    export PROJECT_HOME=$HOME/python/dev
    source /usr/local/bin/virtualenvwrapper.sh
    ```

Create the `PROJECT_HOME` folder:

    ```bash
    $ mkdir -p $HOME/python/dev
    ```

Source your `.profile`:

    ```bash
    $ . .profile
    ```
    The first time the `virtualenvwrapper.sh` script runs, the `.virtualenvs`
    folder is created and several files are placed there.
    Changing the value of `WORKON_HOME` does not affect this location.
    The `.virtualenvs` folder set by `WORKON_HOME` is used when
    `virtualenvwrapper` commands are invoked, e.g., `mkproject`.

# Making a new project with `virtualenvwrapper`
Make a test project `nevermind`:

    ```bash
    $ mkproject nevermind
    ```

Path creation:

* The `WORKON_HOME` path is created if it does not exist.
* For some reason, the `PROJECT_HOME` path does not get created, which is why
  you manually created earlier.

Results of `mkproject`:

* Project `nevermind` is now the active project.
* `pip` and `python` alias to `pip3` and `python3` in the `nevermind` project.

Try installing some packages in the virtualenv:

    ```bash
    $ pip install numpy
    $ pip install maptlotlib
    $ pip install pyqt5
    ```

# Picking up an existing project with `virtualenvwrapper`
Clone project `whatever` into the `dev` folder:

    ```bash
    $ cd $PROJECT_HOME
    $ git clone https://github.com/whatever.git
    $ cd whatever
    ```

Set up a virtualenv for project `whatever`:

    ```bash
    $ mkvirtualenv whatever
    ```

And bind it to the project:

    (cwd is `$HOME/python/dev/whatever`)
    ```bash
    $ setvirtualenvproject
    Setting project for whatever to /cygdrive/c/chromation-dropbox/Dropbox/python/dev/junk
    ```

There are no packages installed yet besides the barebones. Confirm this with
`pip list`:

    ```bash
    $ pip list
    ```

Install the necessary pacakges with a `requirements.txt` or manually install
with `pip install {pkg1} {pkg2} {etc.}':

A `requirements.txt` is generated with `pip` like this:

    ```bash
    $ workon nevermind
    $ pip3 freeze > requirements.txt
    $ deactivate
    ```

But a `requirements.txt` file can also be written from scratch like this:

    ```bash
    $ cd $HOME/python/dev/whatever
    $ vim requirements.txt
    ```

    =====[ file `requirements.txt` in your `whatever` folder ]=====
    numpy
    matplotlib
    pyqt5

    ```bash
    $ pip3 install -r requirements.txt
    ```

Now `pip list` shows several packages: `numpy`, `matplotlib`, and `pyqt5`, plus
all the packages they depended on.

## Observations using 'pip install' on Windows and Linux
* Installation is very fast on an Ubuntu virtual box and `pyqt5` installs
  without any problems.
* Installation is slow on Cygwin and `pyqt5` does not install, even with
  `pyqt`-related packages installed with the Cygwin package manager.

