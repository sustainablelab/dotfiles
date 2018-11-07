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

Check the Vim variable `runtimepath` to see if the plugin is running:
```vim
set runtimepath
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

### Inital install
- `sudo apt install` is the installation command for Ubuntu
- on Cygwin, instead of `sudo apt install`, use the package manager

- `tree` has nothing to do with Python, it is just a lovely utility
```bash
$ sudo apt install tree
```

- `pip3`
```bash
$ sudo apt install python3-pip
$ pip3 install --upgrade pip
```

- `virtualenv`
```bash
$ pip3 install virtualenv
```

- `virtualenvwrapper`
```bash
$ sudo pip3 install virtualenvwrapper
```

### List current version of pip and Python
- Run any of the following from Vim by prefixing with `:!` to send the command
  to the shell, for example:
```vim
:!python3 --version
```
- Save output to the clipboard with `| clip`:
```vim
:!python3 --version | clip
```

#### pip and pip3
- `pip` and `pip3` alias to the same command in my mintty bash terminal under
  Cygwin:
```bash
$ pip -V
pip 18.0 from /usr/lib/python3.6/site-packages/pip (python 3.6)

$ pip3 -V
pip 18.0 from /usr/lib/python3.6/site-packages/pip (python 3.6)
```

#### python and python3
- List the Python version and see what python aliases to:
```bash
$ python --version
Python 2.7.14

$ python3 --version
Python 3.6.4
```

### List installed global Python packages
```bash
$ pip list
Package           Version
----------------- -------
pbr               4.0.1  
pip               18.0   
setuptools        28.8.0 
six               1.11.0 
stevedore         1.28.0 
virtualenv        15.2.0 
virtualenv-clone  0.3.0  
virtualenvwrapper 4.8.2  
```

### Find `virtualenvwrapper.sh`
Note the location of the `virtualenvwrapper.sh` script.

If you missed it during the install, it is probably in `/usr/local/bin`. Find it
quickly with `find`:

- The script is in different places on my virtual Ubuntu installation and Cygwin
  installation.

- Ubuntu:
```bash
$ find /usr/local/bin -type f -name "virtualenvwrapper.sh"
usr/local/bin/virtualenvwrapper.sh
```

- Cygwin:
```bash
$ find /usr/bin -type f -name "virtualenvwrapper.sh"
/usr/bin/virtualenvwrapper.sh
```

### Find `python3`
- the path for `python3` is the same for my Ubunut and Cygwin installations:
```bash
$ which python3
/usr/bin/python3
```

## `virtualenv` environment variables `WORKON_HOME` and `PROJECT_HOME`
- virtual environments are created in `WORKON_HOME`
- project directories are created in `PROJECT_HOME`

## Add `virtualenv` environment variables and source the script
- these environment variables store paths
- `WORKON_HOME` and `PROJECT_HOME` need to be assigned for `virtualenv` to work

### Create the paths aliased by the environment variables
- `virtualenv` will create the `WORKON_HOME` path because this stores files
  generated by `virtualenv`
- but you must create the `PROJECT_HOME` path because that holds the files
  generated by you
- Create the `PROJECT_HOME` folder:
```bash
$ mkdir -p $HOME/python/dev
```
- the `virtualenvwrapper` command `mkproject` creates a new virtualenv in `WORKON_HOME` and project directory in `PROJECT_HOME`

### Set defaults for the environment variables
- The following sets default values for these environment variables:

#### Ubuntu:
- Add this to the end of your `.profile` (located in `$HOME`) to run the
  `virtualenvwrapper.sh` script:
```bash
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/python/.virtualenvs
export PROJECT_HOME=$HOME/python/dev
source /usr/local/bin/virtualenvwrapper.sh
```
- Source your `.profile`:
```bash
$ . .profile
```

#### Cygwin:
- Add this to the end of your `.bashrc` (located in `$HOME`) to run the
  `virtualenvwrapper.sh` script:

    ```bash
    export CHROMATION_HOME=/cygdrive/c/chromation-dropbox/Dropbox
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    # export WORKON_HOME=$HOME/python/.virtualenvs
    # export PROJECT_HOME=$HOME/python/dev
    export WORKON_HOME=$CHROMATION_HOME/python/.virtualenvs
    export PROJECT_HOME=$CHROMATION_HOME/python/dev
    source /usr/bin/virtualenvwrapper.sh
    ```

### Set new environment variable values on the fly from within Vim
- copy the following three lines into the clipboard:
```bash
export LisSweep='/cygdrive/c/chromation-dropbox/Dropbox/labview programs/LabVIEW 2012/2018/LisSweep'
export WORKON_HOME="$LisSweep"/python/.virtualenvs
export PROJECT_HOME="$LisSweep"/python/dev
```
- enter it in the parent bash session by suspending Vim with `Ctrl_z` and then coming
  back to Vim with `fg<Enter>`
- or open a child bash session by opening a Vim terminal with `<F2>` or `:term`
- either way, in the bash session, paste the above with `Ctrl_Shift_v`

#### details
- my `$HOME` is local, not connected to the Chromation Dropbox
- I have access to the Chromation Dropbox under Cygwin, but not Ubuntu
- by default, I work on Chromation Python projects under Cygwin at the Dropbox
  path
- to change those on the fly from a bash terminal, you would just run the
  commented out versions in the shell:
```bash
$ export WORKON_HOME=$HOME/python/.virtualenvs
$ export PROJECT_HOME=$HOME/python/dev
```
- but this doesn't work in Vim!
```vim
:!export WORKON_HOME=$HOME/python/.virtualenvs
:!export PROJECT_HOME=$HOME/python/dev
```
- instead, open a terminal within Vim (`:term` command with `<F2>`) and export
  the environment variables

- the following trick did not work:

- create a variable local to the Vim session so that Vim passes the desired
  value out to the shell:
```vim
:let $WORKON_HOME = '$HOME/python/.virtualenvs'
:let $PROJECT_HOME = '$HOME/python/dev'
```
- now for the purposes of the Vim session, the Vim environment variables
  `$WORKON_HOME` and `$PROJECT_HOME` work in both Vim and bash
- from the Vim command line:
```vim
:echo $WORKON_HOME
$HOME/python/.virtualenvs
```
- but the variable has not *really* changed in `bash`
- Vim is the child process, it cannot create or change variables in the parent
- to see that the variable is unchanged in `bash`, suspend the Vim process with
  `Ctrl_z` to go back to the bash terminal, and try the echo:
```bash
echo $WORKON_HOME
/cygdrive/c/chromation-dropbox/Dropbox/python/.virtualenvs
```
- return to Vim with `fg` (bring to foreground)
- the variable still has the `.bashrc` value when invoked from `bash`
- but when invoked from Vim, the environment variables are behaving just like
  the other bash environment variables, even though this environment variable is
  only local to this Vim session
- that trick is OK for commands like `ls`
- but for virtualenv to work, this is not enough to override the environment
  variables
- the final step to make this work is to do your Python work from a `:term`
  terminal window within Vim rather than the Vim command line
- this is another bash window but it is a child process of the Vim session, so
  it inherits the environment variables
- this is preferable to command line `:!` style anyway because the terminal is
  now visible next to the editor!

## The `.virtualenvs` in your `WORKON_HOME` location is the one that matters
The first time the `virtualenvwrapper.sh` script runs, a `.virtualenvs` folder
is created in the `$HOME` folder and several files are placed there. This is not
where the virtual environments go. I'm not sure what this is.

The real `.virtualenvs` folder is created at the location set by `WORKON_HOME`.
It is created when `virtualenvwrapper` commands are invoked, e.g., `mkproject`,
and then virtual environment folders for each project folders are placed there.

The actual project files you touch go in the `dev` folder.

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
- if this fails because of spaces in the path name just use the `pip` *package*
  instead of the `pip` *script*:
```bash
$ python -m pip install numpy
```

- I cannot install pyqt5 in Cygwin: `no matching distribution found for pyqt5`
- I installed pyqt5 in PowerShell using `pip3`

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

