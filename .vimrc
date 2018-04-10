" Custom Vim settings.
" Author: Mike Gazes
" Date: 2018-01-03

" Merged with items lost late night on 2/4.
    " Temporarily bracketed the merges with:
    "---START RECOVERED FROM 2-4-2018 .VIMRC---
    "---END RECOVERED FROM 2-4-2018 .VIMRC---
    " Highlight the above, exclude the ^M, and search:
    "
    "   v$hs
    " The only thing I ended up leaving active was t_Co=256!
    " The other lost work was improved when I rewrote it.
    " The lost cheat-sheet info might be useful... need to review and clean up.

" See other people's vimrc:
    " Max Cantor:
    " How to Do 90% of What Plugins Do (With Just Vim)
    "   https://www.youtube.com/watch?v=XA2WjJbmmoM
    "   https://github.com/mcantor/no_plugins
    " Also see George Brocklehurst
    "   https://github.com/georgebrock/dotfiles/blob/master/vimrc
    " Also see Steve Losh
    "   https://bitbucket.org/sjl/dotfiles
    " Also see
    "   http://andrewscala.com/vimscript/

" Do not bother being compatible with Vi.
set nocompatible
" set matchtime= 
    " [ ] Look this up.
    " I think this controls delay time.
" Set the cursor in the terminal to be a block instead of a line.
    " This makes editing in Vim much more obvious about where a selection ends and
    " what character will be affected by an 'x' or 'r' command.
    " Mintty (Alt-Space O to open options)
    " -> Looks -> Cursor -> Check 'Block' and 'Blinking'
set undofile
    " Make undo history persistent across file open/close.
    " This is super-important without a version control system to idiot-proof.
set shell=bash " Use bash instead of sh for :term
" setlocal spell spelllang=en_us
    " Spelling. To turn off spell checking:
    " setlocal nospell
set encoding=utf-8 " Allow the use of unicode codepoints (digraphs).
syntax enable " Enable syntax highlighting.
set textwidth=80 " Text hardwraps here. See :h gq. See :h fo-table.
set colorcolumn=+1 " Put a red vertical line 1 column after the textwidth.
set cursorline
    " Make the cursorline background easy to see.
    " set nocursorline
    " Turn the cursorline off (to differentiate whitespace on this line).

set title   " Show filename in GUI window title bar
set ruler " Show cursors position (row,col).
set cmdheight=2 "Screenlines used for the command-line.
set showcmd " Show current command in lower right corner.
set showmode " Show which mode you are in (e.g., displays -- INSERT --)
set splitright " Vertical splits open on the right. No affect on NERDTree :)

set hlsearch
nohlsearch " So that sourcing the vimrc does not highlight the last search.
set magic
set incsearch " Highlight search expressions as you type.
" Match / ignore case in searches.
set ignorecase smartcase
    " This matches any case if all lowercase is used in the regex, but matches
    " exact case if any uppercase is used.
    " Alternatively, on a case-by-case basis, precede the search with:
        " set ignorecase
        " set noignorecase
    " But if doing that, just use \c and \C in the search, for example:
        " /\cBackblaze  -   finds 'backblaze' or 'Backblaze'
        " /\CBackblaze  -   only finds 'Backblaze'
    " 
" Max Cantor free fuzzy file search:
    " ** adds recursive downward dives to the search path.
    " set path+=**
    " You can tack this onto the end of any path. No reason to slow yourself
    " down by allowing recursive dives for everything.
set path=.,/usr/include,,
    " This is the default path: path=.,/usr/include,,
    " I need to set the default path directly so that sourcing my vimrc does not
    " add paths every time.
let default_path=&path
    " Restore the default path with:
    " let &path=default_path
set path-=/usr/include
    " Eliminate the /usr/include path so that Vim uses the avr-gcc path for
    " stdint.h.
" How to add paths:
    " Add paths so Vim can find files with :find
    " The path must be a folder. If you give Vim a path to a file, it will not
    " be able to find it!
    " The path can end with nothing '', or '/' or '/.' They are all equivalent.
    " End the path with ** to allow recursive dives.
    " Syntax:
    " let path_alias='your_POSIX_path_here\ with_backslash_to\ escape \spaces'
    " let &path = &path . ',' . path_alias
let avr_include='/cygdrive/c/Program\ Files\ (x86)/Atmel/Studio/7.0/toolchain/avr8/avr8-gnu-toolchain/avr/include'
let &path = &path . ',' . avr_include
    " I decided atmega328_pack was not necessary.
    " let atmega328_pack='/cygdrive/c/Program\ Files\ (x86)/Atmel/Studio/7.0/packs/atmel/ATmega_DFP/1.2.203/include/avr'
    " let &path = &path . ',' . atmega328_pack
" Add paths to the gcc, g++, and clang compiler "include" headers.
let &path = &path . ',' . '/usr/lib/clang/5.0.1/include'
let &path = &path . ',' . '/usr/lib/gcc/x86_64-pc-cygwin/6.4.0/include'
" g++ is a pain in the ass: three folders I need
let gplusplus_include = '/usr/lib/gcc/x86_64-pc-cygwin/6.4.0/include/c++'
let &path = &path . ',' . gplusplus_include
let &path = &path . ',' . gplusplus_include . '/tr1'
let &path = &path . ',' . gplusplus_include . '/x86_64-pc-cygwin'
"let &path = &path . ',' . gplusplus_include . '/x86_64-pc-cygwin/bits'

" When there are multiple finds use [count]gf or [count];wf to open a specific
" match, e.g., gf on stdbool.h opens the clang version, 2gf opens the gcc
" version, and 3gf opens the g++ version.
"---Below here: add/remove paths depending on what project you are on---
let path_OocKlemens='/cygdrive/c/chromation-dropbox/Dropbox/c/TddFramework/TestDrive/OocKlemens/**'
let &path = &path . ',' . path_OocKlemens
    "let path_KlemensExamples='/cygdrive/c/chromation-dropbox/Dropbox/c/TddFramework/TestDrive/KlemensExamples/**'
    "let &path = &path . ',' . path_KlemensExamples
    "let path_RedGreen='/cygdrive/c/chromation-dropbox/Dropbox/c/TddFramework/TestDrive/RedGreen/**'
    "let &path = &path . ',' . path_RedGreen
    "let path_Romans='/cygdrive/c/chromation-dropbox/Dropbox/c/TddFramework/TestDrive/Romans/**'
    "let &path = &path . ',' . path_Romans
    "let path_FizzBuzz='/cygdrive/c/chromation-dropbox/Dropbox/c/TddFramework/TestDrive/FizzBuzz/**'
    "let &path = &path . ',' . path_FizzBuzz
    "let path_AutoTestRunner='/cygdrive/c/chromation-dropbox/Dropbox/c/TddFramework/TestDrive/AutoTestRunner/**'
    "let &path = &path . ',' . path_AutoTestRunner
    "let testbox='/cygdrive/c/chromation-dropbox/Dropbox/c/LIS-770i/testbox/**'
    "let &path = &path . ',' . testbox
    "let oldLis='/cygdrive/c/chromation-dropbox/Dropbox/design\ files\ and\ protocols/circuits/mcu/Atmel\ Studio/LIS-770i_Interface'
    "let &path = &path . ',' . oldLis
set wildmenu " display tab-able menu of files
set keymap=symbols " ~/.vim/keymap/symbols.vim
set iminsert=0  " same as i_<C-^> to toggle off keymapping
    " I made a keymap for symbols I used often.
    " This was easier than memorizing hex unicode codepoints and typing
    " <C-b>uxxxx.
    " 'set keymap' has the side effect that the keymap is effective the next
    " time you enter insert mode, so 'set iminsert=0' fixes that.
set laststatus=2 " I like status lines. I kept hitting <C-g>.
    " 2: always
    " 1: only if there are at least two windows (default)
    " 0: never

set foldmethod=indent " maybe =syntax?
set foldignore=
    " Do not ignore any symbols when calculating folds. Default is '#'.
"---START RECOVERED FROM 2-4-2018 .VIMRC---
" Show the fold +/- in the number column with the minimum column width.
" set foldcolumn=3    " See h: fold-foldcolumn, default is foldcolumn=0
" Open files with all folds open.
" set foldlevelstart=99 " I decided I don't like this.
"---END RECOVERED FROM 2-4-2018 .VIMRC---
" Indentation level is 4 spaces, use spaces instead of tabs.
set expandtab tabstop=4 shiftwidth=4 softtabstop=4

filetype plugin indent on " filetype detection on, plugin on, indent on
set autoindent " Copy indent from current line when starting a new line.

let mapleader = ";"
    " Map the leader to semicolon
    " use <leader> when defining shortcuts below.
    " , is the popular leader...
    " in fact, Damian Conway swaps ; with :
    " nnoremap ; :
    " nnoremap : ;
nnoremap <leader>, ;
    " ; has a useful default: repeat f,t,F,T character search
    " , moves in the opposite direction, so this seemed the logical map

nnoremap <leader>rh :syntax sync fromstart<CR>
    ":h syn-sync-first
    "Refresh syntax highlighting.
"---C-tdd Environment---
"---Cscope Porcelain---
nnoremap <leader>cs :call UpdateCtags()<CR>:call CscopeCreateConnection()<CR>
function! CscopeCreateConnection()
    "---Overview---
        " cscope is like ctags, but more powerful.
        " Like the tags file, cscope uses a database file.
        " Unlike ctags, it is up to you to make and break the connection with
        " the databse file.
        " This function handles making and breadking this connection.
        " ---Model---
        "   I'm following the model that there is one database file per project,
        "   and that file always lives at the project top level and is named
        "   'cscope.out'.
        " ---Algorithm---
        " If there is already a connection to a database file:
        "   If the path to that database file is in the pwd
        "   then we are connected to the right database. Do nothing.
        "   If the path to that database file is outside the pwd,
        "   kill existing connections to all database files in this session.
        " If there is still no connection, but there is a database file in the
        " pwd, connect to it.
        " If there is still no connection, and there is no database file in the
        " pwd, make a database file and connect to it.
    "Check if the project in the pwd already has an open cscope connection.
    let cscope_db = "cscope.out"
    if cscope_connection(2, expand(getcwd().'/'.cscope_db))
    "if cscope_connection(2, substitute(expand(getcwd()), ' ', '\\ ','g').'/'.cscope_db)
        "---Explanation---
        " 2: arg {dbpath} must match the exact database path
        " The path is the pwd concatenated with the database file name
        " Returns 1 if this cscope connection exists, 0 if not.
        echomsg ">^.^<   cscope database is already connected! Nothing to do."
        echomsg "Place your cursor on a function name, :cs find s <cword>"
        echomsg "See all search options: :cs find (press Tab)"
    else
        "Kill any existing cscope database connections.
        if cscope_connection(1, '/cscope.out')
            "---Explanation---
            " 1: matches if arg {dbpath} is a substring of the database path
            " Returns 1 if this cscope connection exists, 0 if not.
            execute "cscope kill -1"
                " Play it safe: arg {num} = -1
                " -1 : kill all cscope connections.
        endif
        "There are no loaded cscope databases. Try loading one for the pwd.
        let db = findfile(cscope_db, expand(getcwd()))
        "let db = findfile(cscope_db, substitute(expand(getcwd()), ' ', '\\ ','g'))
            "The version with 'substitute' is to escape spaces in file names.
        "echomsg "db: " . db
        if empty(db)
            call CreateCscopeDatabase()
            execute "cscope add " . cscope_db
            " This 'empty-case' used to just print these messages:
            "echomsg "<'.'>  Failed to connect to a cscope database because"
            "        \"file '" . cscope_db . "' does not exist in the Vim pwd."
            "echomsg "Hit ;cb to create the cscope database here (check that"
            "        \"this is the correct project directory):"
            "execute 'pwd'
        else
            "The database exists. Add it.
            "echo "cscope database: " . db
            "execute "silent! cscope add " . db
            "execute "cscope show"
            execute "cscope add " . db
        endif
    endif
endfunction
nnoremap <leader>cu :call UpdateCscopeDatabase()<CR>:call UpdateCtags()<CR>
function! UpdateCscopeDatabase()
    "Update cscope database file (cscope.out) in the root of the Active Project.
        "---Purpose---
        "Use this if you make a change to the project code and want to update
        "the database to 'cscope find' new symbols/text with the <C_\> mappings.
        "---Navigate results after the 'cscope 'find'---
            " <Alt-/> and <Alt-?> is mapped to :cnext :cprevious
            " :cfirst --- jump to first result
            " :copen  --- open quickfix window to see all results
            "             place the cursor on a result
            "             <Enter> to jump to it
        "---Bonus functionality---
            "If you update right after searching for symbols/text, the locations
            "are still loaded in the quickfix window so you can still jump there
            "with the same commands, and Vim notifies you the item is deleted.
    redraw
    echomsg "<-.-> °°° updating cscope database..."
    call system("cscope -R -b")
        "cscope -b -- create a new cscope.out at the Vim pwd
        "This overwrites any existing cscope.out.
        "-R -- looking recursively into all project folders to generate database
    silent cscope reset
        "'cscope reset' reconnects the project with its new cscope.out.
endfunction
function! UpdateCtags()
    redraw
    echomsg ">+.+< °°° updating tags..."
    call system("ctags -R .")
    redraw
    echomsg ">^.^<   Update finished!"
endfunction
"---Cscope Plumbing---
function! CscopeAddExisting()
    "---Overview---
        " On the DirChanged event, look for the cscope.out database file.
        " Connect to it if it exists.
        " This is a copy of CscopeCreateConnection() except I removed the part
        " where a csope.out is created if it does not exist.
        " Otherwise, this would be creating cscope.out files every time I change
        " the Vim pwd.
    "Check if the project in the pwd already has an open cscope connection.
    let cscope_db = "cscope.out"
    if cscope_connection(2, expand(getcwd().'/'.cscope_db))
        "---Explanation---
        " 2: arg {dbpath} must match the exact database path
        " The path is the pwd concatenated with the database file name
        " Returns 1 if this cscope connection exists, 0 if not.
        echomsg ">^.^<   cscope database is already connected! Nothing to do."
        echomsg "Place your cursor on a function name, :cs find s <cword>"
        echomsg "See all search options: :cs find (press Tab)"
    else
        "Kill any existing cscope database connections.
        if cscope_connection(1, '/cscope.out')
            "---Explanation---
            " 1: matches if arg {dbpath} is a substring of the database path
            " Returns 1 if this cscope connection exists, 0 if not.
            execute "cscope kill -1"
                " Play it safe: arg {num} = -1
                " -1 : kill all cscope connections.
        endif
        "There are no loaded cscope databases. Try loading one for the pwd.
        let db = findfile(cscope_db, expand(getcwd()))
        if empty(db)
            "call CreateCscopeDatabase()
            "execute "cscope add " . cscope_db
            " This 'empty-case' used to just print these messages:
            "echomsg "<'.'>  Failed to connect to a cscope database because"
            "        \"file '" . cscope_db . "' does not exist in the Vim pwd."
            "echomsg "Hit ;cb to create the cscope database here (check that"
            "        \"this is the correct project directory):"
            "execute 'pwd'
        else
            "The database exists. Add it.
            "echo "cscope database: " . db
            "execute "silent! cscope add " . db
            "execute "cscope show"
            execute "cscope add " . db
            " Make this silent?
        endif
    endif
endfunction
nnoremap <leader>cb :call CreateCscopeDatabase()<CR>
function! CreateCscopeDatabase()
    "Create cscope database file (cscope.out) in the root of the Active Project.
    "Use this if you want to create the database without connecting to it.
    call system("cscope -R -b")
        "cscope -b -- create a new cscope.out at the Vim pwd
        "-R -- recursively into all project folders
        "This overwrites any existing cscope.out.
    call RefreshNERDTreeWindow()
        "Display cscope.out in the project window.
endfunction
nnoremap <leader>ck :call RemoveCscopeDatabase()<CR>
function! RemoveCscopeDatabase()
    "Kill the connection before removing.
    let cscope_db = "cscope.out"
    if cscope_connection(2, expand(getcwd().'/'.cscope_db))
        "If the cscope database is connected, kill it before removing it.
        "This is not required: cscope is perfectly happy to run for the rest of
        "the session without the file there. But that seems like a bad idea.
        execute 'cscope kill ' . expand(getcwd().'/'.cscope_db)
    endif
    call system("rm ./cscope.out")
    call RefreshNERDTreeWindow()
endfunction

if has("cscope")
    "------------Limit path displays to 3 folders. Does not affect :cscope show.
    "set cscopepathcomp=3   " default is 0
    "------------Use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'---
    "set cscopetag
    "------------Only cscope for the 'ctrl-\' mappings
    set nocscopetag
    "------------check cscope first (before ctags)
    "set cscopetagorder=0
    "------------check ctags first (before cscope)
    "set cscopetagorder=1
    "------------Use the quickfix window for cscope results
    set cscopequickfix=s-,d-,c-,t-,e-,i-,a-
        "Instead of the cscope "pick a number" menu,
        "you are taken to the first result.
        "From there, you can cnext/cprevious through the results.
        "Use CTRL-/ CTRL-? for cnext/cprevious.
        "---Explanation: '-' and not '+'
            "'+' is the same as '-', except it adds to the quickfix window
            "without deleting previous quickfix stuff.
            "That is super confusing, especially because you can add multiple
            "copies of the same result.
            "'-' behaves the way you'd intuitively think this should.
            "Using '-' clears the previous quickfix results.
        "---Explanation: which options are included
            "---
            "Include every option.
            "Note 'g' and 'f' are missing because you already get those
            "behaviors from Ctrl-] and gf, so at least this way the cscope
            "version does something mildly different.
            "---
    " See the cscope tutorial here:
    "   http://cscope.sourceforge.net/cscope_vim_tutorial.html
    " The following is mostly copied from:
    "   http://cscope.sourceforge.net/cscope_maps.vim
    "--------------------------------------------
    " The following maps all invoke one of the following cscope search types:
        "'s'   symbol: find all references to the token under cursor
        "'g'   global: find global definition(s) of the token under cursor
        "'c'   calls:  find all calls to the function name under cursor
        "'t'   text:   find all instances of the text under cursor
        "'e'   egrep:  egrep search for the word under cursor
        "'f'   file:   open the filename under cursor
        "'i'   includes: find files that include the filename under cursor
        "'d'   called: find functions that function under cursor calls
    " From the Vim help:
        "0 or s: Find this C symbol
        "1 or g: Find this definition
        "2 or d: Find functions called by this function
        "3 or c: Find functions calling this function
        "4 or t: Find this text string
        "6 or e: Find this egrep pattern
        "7 or f: Find this file
        "8 or i: Find files #including this file
        "9 or a: Find places where this symbol is assigned a value
    "---<C-\> Maps---
    " <cword> is the C text word object under the cursor.
    " It might make sense for some of these to make them functions and make
    " :copen part of what the key stroke does.
    nnoremap <C-\>s :cs find s <cword><CR>
        " find all occurrences of this C symbol (function/variable)
        " Hands down, this is the most useful.
    nnoremap <C-\>g :cs find g <cword><CR>
        " find definition of function/variable, like ctags Ctrl-]
    nnoremap <C-\>d :cs find d <cword><CR>
        " find functions called by this function
    nnoremap <C-\>c :cs find c <cword><CR>
        " find functions calling this function
    nnoremap <C-\>t :cs find t <cword><CR>
        " find all occurrences of this text string
    nnoremap <C-\>e :cs find e <cword><CR>
        " finds an egrep pattern (like 't', but finds more stuff?)
    nnoremap <C-\>f :cs find f <cfile><CR>
        " find this file (does the same thing as Vim normal mode 'gf')
    nnoremap <C-\>i :cs find i <cfile><CR>
        " find files that include this file (e.g., unity.h)
    nnoremap <C-\>a :cs find a <cword><CR>
        " find places this symbol is assigned a value
    "
    "---Navigate results after the 'cscope 'find'---
        " <Alt-/> and <Alt-?> is mapped to :cnext :cprevious
        " :cfirst --- jump to first result
        " :copen  --- open quickfix window to see all results
        "             place the cursor on a result
        "             <Enter> to jump to it
endif
"---Map shorcuts for cnext and cprevious---
    " The idea is to have forward/backward search with / and ?
    " echoing the usual / and ? idea, but with ALT
    " it is cnext and cprevious.
" After starting one of the above searches, use the quickfix cn / cp.
" see :h cscopequickfix
" After a grep, like helpgrep, use the quickfix cn / cp to go through results.
" example, try :helpgrep cscopequickfix (you get 13 results)
execute "set <M-/>=\033/"
nnoremap <M-/> :cnext<CR>zv
    "nnoremap <C-_> :cnext<CR>
    "First I picked C-_ because this is also what my C-/ produces:
    " in insert mode, type <C-b><C-/> and you get ^_
    "Then I switched from Ctrl to Alt because ^? is also what Backspace maps to
    "and I like Backspace mapped to :buffer #
execute "set <M-?>=\033?"
nnoremap <M-?> :cprevious<CR>zv
"TODO:
    "[x] Limit the size of the quickfix window to something reasonable like 10
    "lines.
"---Test Wiring Porcelain---
nnoremap <leader>yt :call AddTestToHeaderAndRunner()<CR>
function! AddTestToHeaderAndRunner()
    "echo ">^.^<"
    if &filetype != 'c'
        echo ">-.-<   This is not a 'c' file. Nothing was done."
    else
        " Find a test function on this line.
        let function_name = matchstr(getline('.'),'test\S*.(')
        if function_name == ''
            echo ">-.-<  There is no 'test*' function on this line."
                \"Nothing was done."
        else
            "Mark this location with 'C' for test_libblah.[C]
            "normal! mC
            "Remove the trailing (
            let function_name = function_name[0:-2]
            "echo function_name
            "---Add the function to the test runner---
            "Find the test runner.
            "Search ANYWHERE in the project for the test_runner:
            let test_runner_path = glob("**/test_runner.c")
            if test_runner_path == ''
                echo "File 'test_runner.c'"
                    \"does not exist in this project yet!"
            else
                if &modified
                    echo "Please write changes first. Nothing done."
                else
                    execute "noswapfile edit " . test_runner_path
                    " Find 'return UNITY_END();'.
                    execute '/return\sUNITY_END();'
                    " Unfold at the cursor.
                    execute "normal! zv"
                    " Insert a line and paste the test name with suffix ');'.
                    execute "normal! O" . function_name . ");\<Esc>"
                    " Prefix with 'RUN_TEST('.
                    execute "normal! IRUN_TEST(\<Esc>"
                    "Mark this location with 'R' for test_[R]unner.c
                    "normal! mR
                    write
                    execute "noswapfile buffer #"
                    call AddFunctionToHeader()
                    " This function also updates Cscope database and Ctags tags
                    " file. REFACTOR this so the caller does not rely on this
                    " function to always do this.
                    echomsg ">°.'<   Added unittest".
                        \":"function_name . "() to test_runner.c"
                    "echomsg ">°.'<   mR: Added unittest".
                    "    \":"function_name . "() to test [R]unner --"
                    "    \"return with 'R"
                    "echomsg "mC: Return to the unittest .[C] code with 'C "
                    "    \"-- see ':marks CHR'."
                endif
            endif
        endif
    endif
endfunction
"---Test Wiring Plumbing---
nnoremap <leader>yh :call AddFunctionToHeader()<CR>
function! AddFunctionToHeader()
    " Add the function signature to the header file.
    "let orig_window_number = winnr()
    if &filetype != 'c'
        echo ">-.-<   This is not a 'c' file. Nothing was done."
    elseif &modified
        "What to do if the buffer is not written yet.
        echo "Please write changes before editing ".h_filename
    else
        " Find a function on this line.
        let function_name = matchstr(getline('.'),'\S*.(')
        if function_name == ''
            echo ">-.-<  There is no function on this line. Nothing was done."
        else
            "echo "Ready to rock!"
            let function_name = function_name.")"
            " Yank the line we are on.
            normal! yy
            let c_filename = expand("%:t")
            let c_filehead = expand("%:h")
            let h_filename = expand("%:t:r") . ".h"
            "REFACTOR
            "echo "This file is '".c_filename."'. Looking for '".h_filename."'."
            "let h_buffer_number = bufnr(h_filename)
                " The problem here is bufnr will match to a substring.
                " So if test_blah.h exists, and h_filename is blah.h,
                " and blah.h does not exist yet, then
                " this returns the buffer_number of test_blah.h
            let h_buffer_number = bufnr("^".h_filename."$")
            if h_buffer_number == -1
                "echo "File '".h_filename."' is not in any buffer."
                "Search ANYWHERE in the project for h_filename:
                let h_path = glob("**/".h_filename)
                "Search only in the current folder.
                "let h_path = findfile(h_filename,".")
                if h_path == ''
                    "if empty(h_path) -- this should work, but it doesn't.
                    "Still cannot find the file.
                    "Make the file.
                    redraw
                    echomsg "File '".h_filename."'"
                        \"does not exist in this project yet!"
                    let h_filepath = c_filehead."/".h_filename
                    " Create #ifndef guard name
                    let h_NAME_H = "_" . toupper(expand("%:t:r")) . "_H"
                    " #include the header in the .c file
                    execute "normal! ggO#include \"" . h_filename . "\""
                    execute "write"
                    execute "new"
                    " Insert #ifndef guards
                    execute "normal! i#ifndef " . h_NAME_H
                    execute "normal! o#define " . h_NAME_H
                    normal! o
                        "Insert a blank line between #ifndef guards and code.
                    normal! pA;
                        "Paste the function.
                        "Append a semicolon to the end of the line.
                    normal o
                        "Insert a blank line between #ifndef guards and code.
                    execute "normal! o#endif // " . h_NAME_H
                    "normal! kdd;
                        "Delete the blank line inserted above.
                    "normal! kIifndef
                    execute "write "h_filepath
                    quit
                    redraw
                    echomsg ">°.°<   Created file:"h_filepath
                        \ "and added function prototype:"function_name
                    "TODO: refactor this! This is an awful cut-and-paste job.
                    " The following 5 lines shouldn't be in this function to
                    " begin with, and now I have it appering twice.
                    " Silently update the cscope database.
                    call UpdateCscopeDatabase()
                    " Silently update tags file.
                    call UpdateCtags()
                    "call system("ctags -R .")
                    return
                else
                    "echo h_filename." is not loaded, please go to:"h_path
                    execute "edit "h_path
                endif
            else
                "echo "File '".h_filename."' is in buffer number"h_buffer_number."."
                execute "noswapfile buffer "h_buffer_number
            endif
            "What to do if the buffer is not written yet.
            "if &modified
            "    echo "Please write changes before editing ".h_filename
            "else
            "endif
            "
            " At this point, if the .h file exists, we are editing it!
            "echo "Ready to rock!"
            normal! G2kpA;
                "Go two lines up from the end of the file.
                "Paste the function.
                "Append a semicolon to the end of the line.
            "Mark this location with 'H' for test_libblah.[H]
            "normal! mH
            write
            execute "noswapfile buffer #"
            echomsg ">'.°<   Added function prototype:"function_name
                    \ "to ".h_filename
            "echomsg ">'.°<   mH: Added prototype:"function_name
            "        \ "to ".h_filename . " -- return to .[H] with 'H"
        " Silently update the cscope database.
        call UpdateCscopeDatabase()
        " Silently update tags file.
        call UpdateCtags()
        "call system("ctags -R .")
        endif
    endif
endfunction
nnoremap <leader>hg :call AddIfndefGuardsInHeader()<CR>
function! AddIfndefGuardsInHeader()
    " Call this from within a header.
    " Create #ifndef guard name
    let h_NAME_H = "_" . toupper(expand("%:t:r")) . "_H"
    " Insert #ifndef guards
    normal! gg
    execute "normal! O#ifndef " . h_NAME_H
    execute "normal! o#define " . h_NAME_H . "\<CR>"
    normal! G
    execute "normal! o\<CR>#endif // " . h_NAME_H
endfunction

" This was old, but came in handy again when I needed to write a test script
" that contained its own test runner. So it's back.
nnoremap <leader>yy :call AddTest()<CR>
function! AddTest()
    " Mark the cursor location to jump back this line when finished.
    execute "normal m'"
        "execute "normal mz"
        "execute "normal 'z"
        " I tried this pair to jump back to the exact column, but not luck.
        " Before I added the part that searches the line for 'test', I was able
        " to jump back to the exact column. If I look into the jumplist I can
        " probably recover the column location, but who the fuck cares.
        " TODO: use getcurpos()
            "Example:
            " let save_cursor = getcurpos()
            " MoveTheCursorAround
            " call setpos('.', save_cursor)
            "Note that this only works within the window.
            "See |winrestview()| for restoring more state.
    " Find the test on this line.
    execute '/\%' . line(".") . 'ltest'
    " Go to the first letter in the test name.
    execute "normal n"
    " Yank the test name.
    execute "normal yiw"
    " Find 'return UNITY_END();'.
    execute '/return\sUNITY_END();'
    " Insert a line and paste the test name with suffix ');'.
    execute "normal O\<C-r>0);\<Esc>"
    " Prefix with 'RUN_TEST('.
    execute "normal IRUN_TEST(\<Esc>"
    " Jump the cursor back to the test.
    execute "normal \<C-o>"
    " Use @0 to paste the test name at the status line.
    redraw
    echo ">^.^< Added to test runner:" @0
endfunction
    " Add a RUN_TEST() for the test under the cursor.
    " Usage:
    " The test definition starts with the string "test".
    " The string "test" appears nowhere else on that line.
    "   void test_HelloUnity_failing_fish(void)
    " There is a main() function that contains:
    "   return UNITY_END();
    " This is the end of the test runner.
    " The test runner main() is in the same file as the test to add.
    " Add the test to the test runner as follows:
    " Place cursor anywhere on the line with the test name.
    " [v]oid test_HelloUnity_failing_fish(void)
    " ;yt
    " The test is added and the cursor is returned to its line.
    " This is the original mostly-just-a-mapping form while I was developing:
    "   nnoremap <leader>yy m'yiw/return\sUNITY_END();<CR>O<C-r>0);<Esc>IRUN_TEST(<Esc><C-o>:nohlsearch<CR>:call AddedTest()<CR>
    "   function! AddedTest()
    "       redraw
    "       echo ">^.^< Added to test runner:" @0
    "   endfunction
    " To translate from a crazy long mapping to a clean function, split the
    " command at logical places and encsapulate each block in:
    "   execute "normal {block_of_normal_mode_commands}"
    " Be careful about special keys. For example: <Esc>.
    " If {block} contains special keys, escape them with a backslash.
    " Also note that not everything is a normal mode command.
    " For example, the search command:
    "   execute '/{search_string}'

nnoremap <leader>ve :call ExampleCheckingIfBuildFailed()<CR>
    "This is an example of how to use CheckIfBuildFailed().
function! ExampleCheckingIfBuildFailed()
    call ReportValidErrors(CheckIfBuildFailed())
endfunction
function! CheckIfBuildFailed()
    " Return 0 if no valid errors, 1 if there are valid errors.
        " Purpose:
        " Why did I write this? I want to know if a build fails or not.
        " All build output ends up in the Quickfix list.
        " 
        "   :len(getqflist())>1 is not robust: build output is multiline.
        "   :clist lists all output indiscriminately.
        "   :cw can differentiate between valid and invalid
        " But :cw has no way to query itself, and detecting the affect of :cw is
        " harder than just writing my own function to parse the quickfix list.
        "
        " Algorithm:
        " If the build output contains a 'valid' build error, the build failed.
        " Vim :make does a good job identifying 'valid' errors in the output.
        " This and other info is stored in the quickfix list: getqflist().
        " Build output Error lines are marked as  {...,'valid': 1,...}.
        " All other build output lines are marked {...,'valid': 0,...}.
        " These invalid lines are just build messages displaying what 'make'
        " actually did given the recipe it executed in the Makefile.
        " Go through every line of getqflist(). It is a list of dictionaries.
        " Pull out the value of 'valid' from each dictionary in the list.
        " Concatenate these values as a string of 0s and 1s.
        " Convert the string to a number and compare it with 0.
        " The number is either 0 (no valid build errors) or nonzero.
    let l:all_the_valids = []
    for qfdict in getqflist()
        call add(l:all_the_valids, qfdict['valid'])
    endfor
    return str2nr(join(l:all_the_valids,''))==0 ? 0 : 1
endfunction
function! ReportValidErrors(HasValidError)
    let l:msg = ''
    if a:HasValidError
        let l:msg = "Valid error in this quick fix list."
    else
        let l:msg = "Every 'valid'==0, no errors in this quick fix list."
    endif
    echohl Error
    echo l:msg
    echohl None
endfunction

"=====[--------------------Before Any Build--------------------]=====
"=====[ Remember to set the Vim pwd to the Makefile directory. ]=====
nnoremap <leader>mC :call CloseTestResults()<CR>:make clean-test-and-lib-builds<CR><CR><CR>:call MakeQuickfix()<CR>
    " Just remove the lib-objects and the TestSuite-Results .exe/.md files.
    " Saves on having to rebuild the test framework object files (unity.o,
    " binrepr.o).
nnoremap <leader>mc :call MakeCleanAllBuilds(expand("%:t:r"))<CR><CR>
function! MakeCleanAllBuilds(file_stem)
    call CloseTestResults()
    execute "make clean-all-builds file-stem=" . a:file_stem
        "Use execute to watch bash run the command.
    redraw
    echomsg  ">°.°<   Cleaning old builds. Removing"
            \" build/" . a:file_stem . ".md if it exists."
    "call system("make clean-all-builds file-stem=" . a:file_stem)
        "Use system to run the command quietly in the background.
        "The catch is that this is not the Vim internal make, so it does not
        "populate the quickfix window with errors/warnings, just the invoked
        "build recipe.
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK. Cleaned old builds."
        echomsg "└>^.^<┘  If build/" . a:file_stem . ".md existed,"
                \"it does not exist anymore."
    endif
endfunction
    " Remove *all* object files and the TestSuite-Results .exe/.md files.
    " If the file-stem of the active window has a matching .md file in the
    " build/ folder, remove that too.
    " [x] TODO: troubleshoot MakeQuickFix() is not getting called.
    " Vim Help example of a mapping with %:stuff:
    " :map  _ls  :!ls -l %:S<CR>:echo "the end"<CR>
    " Reason why execution might halt before MakeQuickFix() is called:
    " See :help map-error
    " > Note that when an error is encountered (that causes an error message or
    " > beep) the rest of the mapping is not executed.  This is Vi-compatible.
    " OK, I'm not sure, but I think that is what was happening. The error
    " message was never visible if that was the cause. Whatever it was, putting
    " the function calls inside a function fixed it.
    " Here is the old method as a one-liner that caused the problem:
    "nnoremap <leader>mc :call CloseTestResults()<CR>:make clean-all-builds file-stem=%:t:r<CR><CR><CR>:call MakeQuickfix()<CR>
nnoremap <leader>mka :call CloseTestResults()<CR>:make avr-target compiler=avr-gcc<CR><CR><CR>:call MakeQuickfix()<CR>
    " Build the TestSuite using avr-gcc.
"nnoremap <leader>mkc :call CloseTestResults()<CR>:make compiler=gcc<CR><CR><CR>:call MakeQuickfix()<CR>
"nnoremap <leader>mkc :call CloseTestResults()<CR>:make compiler=gcc file-stem=%:t:r<CR><CR><CR>:call MakeQuickfix()<CR>
nnoremap <leader>mkc :call MakeDefaultTargetWithGcc(expand("%:t:r"))<CR><CR>
    " Build using gcc.
    " If the default target is the TestSuite, build that.
    " If the default target is just markdown output, pass in the active window
    " file stem.
function! MakeDefaultTargetWithGcc(file_stem)
    call CloseTestResults()
    execute "make compiler=gcc file-stem=" . a:file_stem
        "Use execute to watch bash run the command.
    "redraw
    "echomsg  ">°.°<   Building with gcc... "
    "call system("make compiler=gcc file-stem=" . a:file_stem)
        "Use system to run the command quietly in the background.
        "The catch is that this is not the Vim internal make, so it does not
        "populate the quickfix window with errors/warnings, just the invoked
        "build recipe.
    "call MakeQuickfix()
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK."
        echomsg "└>^.^<┘  Built default target with gcc."
    endif
endfunction
"nnoremap <leader>mkl :call CloseTestResults()<CR>:make compiler=clang file-stem=%:t:r<CR><CR><CR>:call MakeQuickfix()<CR>
nnoremap <leader>mkl :call MakeDefaultTargetWithClang(expand("%:t:r"))<CR><CR>
    " Build using clang.
    " If the default target is the TestSuite, build that.
    " If the default target is just markdown output, pass in the active window
    " file stem.
function! MakeDefaultTargetWithClang(file_stem)
    call CloseTestResults()
    execute "make compiler=clang file-stem=" . a:file_stem
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK."
        echomsg "└>^.^<┘  Built default target with clang."
    endif
endfunction
nnoremap <leader>mk+ :call MakeDefaultTargetWithGplusplus(expand("%:t:r"))<CR><CR>
function! MakeDefaultTargetWithGplusplus(file_stem)
    call CloseTestResults()
    execute "make compiler=g++ file-stem=" . a:file_stem
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK."
        echomsg "└>^.^<┘  Built default target with g++."
    endif
endfunction
"nnoremap <leader>mk+ :call CloseTestResults()<CR>:make compiler=g++ file-stem=%:t:r<CR><CR><CR>:call MakeQuickfix()<CR>
    " Build the TestSuite using g++.

function! MakeQuickfix()
    "Update the build/ folder in the NERDTree window.
    call RefreshNERDTreeFolder_build()
    "call CloseTestResults()
        " Close test output window before calling copen.
        "       The goal is to prevent the quickfix window from landing below
        "       the test output window. And there really is no reason to still
        "       have test output visible if I'm running Make, so just closing
        "       the window is the simplest solution.
        "       And I already have code that does this. Put that code here!
    cclose
        " Close the existing quickfix window so the size will be automatic.
    copen
        " :cwindow is a little simpler since it only opens if there is an error.
        " But I decided I still want to show the quickfix window if only make
        " was invoked. And if the build succeeds, :cwindow doesn't open it.
    let l:build_failed = CheckIfBuildFailed()
    if l:build_failed
        " ---Set the height of the quickfix window---
        "let l:first_error_line = line('.')
            " Remember the cursor location.
        if len(getqflist()) > 10
            execute (10+2)."wincmd _"
        else
            execute (len(getqflist())+2)."wincmd _"
            " Set the quickfix window to the height of the build output.
            " +2 is to account for some soft-wrapping (long error messages).
        endif
        "execute l:first_error_line
            " Go back to the cursor location.
        call ColorMeQuick()
        cc
            " Place the cursor on the first error in the source code.
        normal! zv
            " Expand any folds hiding the cursor line.
        redraw
        echo "<°.°>  make...failed. Cursor is on the first error."
        "echo "<'.'>  make...failed. Jump to the error with <Enter>, then 'zv' if its hidden in a fold."
    else
        execute (len(getqflist())+1)."wincmd _"
            " Set the quickfix window to the height of the build output.
            " +1 accounts for some soft-wrapping.
        "2wincmd_
            " Shrink the quickfix window to 2 lines high.
        exe winnr('#').'wincmd w'
            " Go back to the window where you invoked make with ;mk.
        redraw
        echo ">^.^<  make...OK."
    endif
    return !l:build_failed
endfunction
function! OldmakeQuickfix()
    call CloseTestResults()
        " Close test output window before calling copen.
        "       The goal is to prevent the quickfix window from landing below
        "       the test output window. And there really is no reason to still
        "       have test output visible if I'm running Make, so just closing
        "       the window is the simplest solution.
        "       And I already have code that does this. Put that code here!
    cclose
        " Close the existing quickfix window so the size will be automatic.
    copen
    let there_are_errors=len(getqflist())>1
    if there_are_errors
        call ColorMeQuick()
        " Place the cursor on the first error in the source code.
        cc
        " Expand any folds hiding the cursor line.
        normal! zv
        redraw
        echo "<'.'>  make...failed. Cursor is on the first error."
        " [ ] TODO: search for /\cerror\|warning and if there are no results:
        "echo ">^.^<  make...OK."
    else
        " Shrink the quickfix window to 2 lines high.
        2wincmd_
        " Go back to the window where you invoked make with ;m.
        exe winnr('#').'wincmd w'
        redraw
        echo ">^.^<  make...OK."
    endif
endfunction

nnoremap <leader>mtu :call CloseTestResults()<CR>:make TestUnityExtensions compiler=clang<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtc :call CloseTestResults()<CR>:make compiler=gcc<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtl :call CloseTestResults()<CR>:make compiler=clang<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mt+ :call CloseTestResults()<CR>:make compiler=g++<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
    " Run the default make target and unittest if no errors.
    " Same as the two mappings: ;mk ;te
nnoremap <leader>mfa :call CloseLogfileWindows()<CR>:make avr-target compiler=avr-gcc<CR><CR><CR>:call MakeQuickfixAndDownloadFlash()<CR><CR>
    " Build the TestSuite using avr-gcc.
    " If the build is OK, download flash.
nnoremap <leader>mrc :call MakeDefaultTargetWithGccAndReadOutput(expand("%:t:r"))<CR><CR>
function! MakeDefaultTargetWithGccAndReadOutput(file_stem)
    call CloseExampleOutputWindows()
    call MakeDefaultTargetWithGcc(a:file_stem)
    call ReadExampleOutput(expand("%:t:r"))
endfunction
nnoremap <leader>mrl :call MakeDefaultTargetWithClangAndReadOutput(expand("%:t:r"))<CR><CR>
function! MakeDefaultTargetWithClangAndReadOutput(file_stem)
    call CloseExampleOutputWindows()
    call MakeDefaultTargetWithClang(a:file_stem)
    call ReadExampleOutput(expand("%:t:r"))
endfunction
nnoremap <leader>mr+ :call MakeDefaultTargetWithGplusplusAndReadOutput(expand("%:t:r"))<CR><CR>
function! MakeDefaultTargetWithGplusplusAndReadOutput(file_stem)
    call CloseExampleOutputWindows()
    call MakeDefaultTargetWithGplusplus(a:file_stem)
    call ReadExampleOutput(expand("%:t:r"))
endfunction
"I started this and it works, but then I realized I already had this:
    "function! BuildThisCfileWith(build_tool)
"What was wrong with the old way.
    "Nothing.
        "Well, it makes .exe, I need .o. And it doesn't have the exact folder
        "structure I need.
    "Can I do it better?
    "Yes, but that's a lot of work. So I'll do a hack job instead.
        "I'd like to invoke Vim make instead so the build results go to the
        "quickfix window.
        "So something like this using MakeQuickfix()
            "    execute "make compiler=g++ file-stem=" . a:file_stem
            "    let l:build_passed = MakeQuickfix()
            "    if l:build_passed
            "        redraw
            "        echomsg "┌>^.^<┐  make OK."
            "        echomsg "└>^.^<┘  Built default target with g++."
            "    endif
        "But instead of using a makefile, doing a command-line version of make.
            "No, that is not the right approach. I cannot command-line a Vim
            "make. To do what you want, you have to read up on sending system
            "output to the quickfix window.
"Quick hack-job: For now, just invoke the compiler from the shell.
nnoremap <leader>coc :call CompileObject("gcc")<CR>
nnoremap <leader>col :call CompileObject("clang")<CR>
nnoremap <leader>co+ :call CompileObject("g++")<CR>
function! CompileObject(compiler)
    "Remove the existing object file in './build/'.
    "Replace it with a new object file.
    "Usage:
        "Place the cursor in the window with the file to compile.
        "This is how Vim gets the file-stem name.
        "Args: compiler: compiler name as a string.

    "call system() "no, this will not show me any compiler messages
    execute "!clear;"
        \ "rm -f " ."./build/" .expand("%:t:r"). ".o;"
        \ .a:compiler
        \ "-Wall -Wextra -pedantic"
        \ "-c ./src/" . expand("%:t:r") . ".c"
        \ "-o ./build/" . expand("%:t:r") . ".o"
    redraw
    echomsg ">^.^< Built " . expand("%:t:r") . ".o with" a:compiler . "."
endfunction
"nnoremap <leader>mrl :call CloseTestResults()<CR>:call CloseExampleOutputWindows()<CR>:make compiler=clang file-stem=%:t:r<CR><CR><CR>:call ReadExampleOutput(expand("%:t:r"))<CR><CR>
    " Context: learning by writing some example code.
    " Build the example into an executable that writes to stdout.
    " 'make' runs the executable to create a .md and erases the executable.
    " If the build is OK, open the .md file readonly.
    "Old version that required hard-coding the filename in the Makefile:
    ":make example compiler=clang<CR><CR><CR>:call ReadExampleOutput()<CR><CR>
nnoremap <leader>rf :call ReadFailedOutput(expand("%:t:r"))<CR>
function! ReadFailedOutput(file_stem)
    echomsg ">^.^ file stem is '" . a:file_stem . "'."
    call ReadMarkdownFile(a:file_stem . "_stderr.md")
endfunction
nnoremap <leader>re :call ReadOutput(expand("%:t:r"))<CR>
    "TODO: Why does ;mre not always call ReadExampleOutput? I have no idea.
    "Place the cursor in a window with the .c source when using ;re. The stem of
    "the .c source file is used to find the .md file.
function! ReadOutput(file_stem)
    echomsg ">^.^ file stem is '" . a:file_stem . "'."
    call ReadMarkdownFile(a:file_stem . ".md")
endfunction
function! ReadMarkdownFile(file_name)
    echomsg ">^.^<   Read stdout/stderr from '" . a:file_name . "'."
    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    call RefreshNERDTreeFolder_build()
    execute "NERDTreeFocus"
    let l:match = search(a:file_name)
        "Find the .md output file.
            " If there are no matches,
            " l:match == 0 and the cursor is on 'build/'
            " If there are mathces,
            " l:match > 0 and the cursor is on the first match.
    if l:match > 0
        execute "normal s"
            " Open in a vertical split."
        execute "set readonly"
        execute "noh"
            " Remove highlighting from the last search
        redraw
        echomsg ">^.^<  '" . a:file_name . "' is shown. ';r<Space>' to close."
    else
        if not_invoked_from_nerdtree_window
            execute "wincmd p"
            " Return to the window where ;nr was invoked.
        endif
        redraw
        echomsg "<-.->  There is no '" . a:file_name . "' in the build/ folder."
    endif
endfunction

function! _ReadExampleOutput(file_stem)
    echomsg ">^.^ file stem is '" . a:file_stem . "'."
    execute "/" . a:file_stem
endfunction
function! ReadExampleOutput(file_stem)
    echomsg ">^.^<   Read output from '" . a:file_stem . ".exe'."
    " refresh
    call RefreshNERDTreeFolder_build()
    " TODO: Refactor with RefreshNERDTreeWindow() to remove duplication.
    " Open the .md file created when building and running the example with make.
    " Open the files from NERDTree to use NERDTree's window management.

    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    execute "NERDTreeFocus"
    "=====[ ReadExampleOutput starts here ]=====
    " TODO: Come back to this later when the fragility is troublesome.
        " The following sequence is fragile.
        " It depends on there being at least one file already open.
        " NERDTree does not have any means to control where "s" and "i" open new
        " windows. The defaults are good, but it required the following fragile
        " kludge for what the vsplit/hsplit I wanted.
    execute "/" . a:file_stem . "\.md"
        "Find the .md output file.
    execute "normal s"
        " Open in a vertical split."
    execute "set readonly"
    "=====[ ReadExampleOutput ends here ]=====
    execute "noh"
        " Remove highlighting from the last search
    redraw
    echomsg ">^.^<  " . a:file_stem . ".c built successfully.   "
        \">▸.~<  " . a:file_stem . ".md is shown. ';r<Space>' to close."
endfunction
function! MakeQuickfixAndTest()
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        " Close the quickfix window.
        cclose
        redraw
        echomsg ">^.^<  make...OK.    <°.°>  Running unit tests..."
        call RunUnityTestSuite()
        redraw
        echomsg ">^.^<  make...OK.    >▸.~<  Unit tests finished: see results above. "
    endif
endfunction
nnoremap <leader>fa :call DownloadFlash()<CR>
function! DownloadFlash()
    "echo "DownloadFlash >^.^<"
    execute "make download_flash"
    "Refresh the build folder.
    call RefreshNERDTreeFolder_build()
endfunction
function! MakeQuickfixAndDownloadFlash()
    "=====[ Summary: ]=====
        " Download the build to flash memory.
        " Open log file windows: the atprogram output to stdout and stderr.
    " Other MakeQuickFixAndBlah functions close the quickfix window.
    " Leave the quickfix window open since there are no tests to look at.
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg ">^.^<  make with avr-gcc...OK.    <°.°>  Downloading flash..."
        call DownloadFlash()
        "Go to NERDTree window."
        "Open *stdout.log in vsplit. Open *stderr.log in hsplit.
        call OpenDownloadFlashLogs()
    endif
endfunction
function! OpenDownloadFlashLogs()
    " TODO: Refactor with RefreshNERDTreeWindow() to remove duplication.
    " Open the log files created when downloading the flash with make
    " download_flash.
    " Open the files from NERDTree to use NERDTree's window management.
    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    execute "NERDTreeFocus"
    "=====[ OpenDownloadFlashLogs starts here ]=====
    /build\/
    execute "normal O"
        " NERDTree-O opens a node recursively. This guarantees it will be open.
        " NERDTree-o toggles a node open and closed.
        " Note this must be 'normal' and not 'normal!' for 'O' to behave as
        " 'NERDTree-O' because 'O' already has a Vim mapping.
    " TODO: Come back to this later when the fragility is troublesome.
        " The following sequence is fragile.
        " It depends on there being at least one file already open.
        " NERDTree does not have any means to control where "s" and "i" open new
        " windows. The defaults are good, but it required the following fragile
        " kludge for what the vsplit/hsplit I wanted.
    /atprogram-download_flash-stdout\.log
    execute "normal s"
        " Open in a vertical split."
    execute "wincmd r"
        " Swap positions with whatever file was already open so that NERDTree-i
        " opens stderr.log in a horizontal split with stdout.log.
    execute "NERDTreeFocus"
    /atprogram-download_flash-stderr\.log
    execute "normal gi"
        " Open in a horizontal split, leave focus in NERDTree window.
    "=====[ OpenDownloadFlashLogs ends here ]=====
    if not_invoked_from_nerdtree_window
        execute "wincmd p"
        " Return to the window where ;nr was invoked.
    endif
    execute "noh"
        " Remove highlighting from the last search
    redraw
    echomsg ">^.^<  simBrd build OK and flash downloaded.   "
        \">▸.~<  atprogram-flash_download logs are shown. ';f<Space>' to close."
endfunction
function! TryListingBuffers()
    "This is me figuring out how to use Vim lists again...
    "=====[ Example from last time I used Vim lists]=====
    "let l:all_the_valids = []
    "for qfdict in getqflist()
    "    call add(l:all_the_valids, qfdict['valid'])
    "endfor
    "return str2nr(join(l:all_the_valids,''))==0 ? 0 : 1
    "=====[ End Example ]=====
    let l:logfile_buffers = [
        \'./build/atprogram-download_flash-stdout.log',
        \'./build/atprogram-download_flash-stderr.log'
        \]
    for logfile in logfile_buffers
        echo logfile
    endfor
endfunction
"After downloading the flash with ;mfa, close the quickfix and atprogram logs.
nnoremap <leader>r<Space> :cclose<CR>:call CloseExampleOutputWindows()<CR>
function! CloseExampleOutputWindows()
    let l:example_output_buffers = [
        \'./build/' . expand("%:t:r") . '.md',
        \'./build/' . expand("%:t:r") . '_stderr.md'
        \]
    let l:at_least_one_exists = 0
    for l:file in l:example_output_buffers
        let l:file_exists = (bufnr(l:file) != -1) ? 1 : 0
        "echomsg "File exists: " . l:file_exists
        let l:at_least_one_exists = l:at_least_one_exists || l:file_exists
    endfor
    "echomsg "at least one exists: " . l:at_least_one_exists
    if !l:at_least_one_exists
        let l:file_list = ''
        for l:file in l:example_output_buffers
            let l:file_list = l:file_list . ", '" . l:file . "'"
        endfor
        echomsg ">^.^< Closed quickfix window. " . l:file_list . " are not in any buffers."
    else
        for l:logfile in l:example_output_buffers
            let l:buffer_number = bufnr(l:logfile)
            if l:buffer_number != -1
                "Buffer exists... Does the window exist?"
                let window_id = win_findbuf(buffer_number)
                if window_id != []
                    "echo "Markdown output " . l:logfile . 
                    "    \" is at window_id " . string(window_id)
                    let found_it = win_gotoid(window_id[0])
                    if found_it
                        " Close it and delete the buffer.
                        execute "bw!" l:buffer_number
                    else
                        echo "The markdown output window exists but I cannot find it."
                        " TODO: Return an error here to notify the caller.
                        return
                    endif
                else
                    echomsg ">^.^< Closed quickfix window. No open markdown output to close."
                    return
                endif
            endif
        endfor
        echomsg ">^.^<  Closed quickfix window and markdown output."
    endif
endfunction
function! _CloseExampleOutputWindows()
    " Close the ExampleOutputWindows for the active project.
    "TODO: refactor with CloseLogfileWindows().

    let l:example_output_buffers = [
        \'./build/' . expand("%:t:r") . '.md',
        \'./build/' . expand("%:t:r") . '_stderr.md'
        \]
    let l:at_least_one_exists = 0
    for l:file in l:example_output_buffers
        let l:at_least_one_exists = l:at_least_one_exists || ((bufnr(l:file) != -1) ? 1 : 0)
    endfor
    if !l:at_least_one_exists
        let l:file_list = ''
        for l:file in l:example_output_buffers
            let l:file_list = l:file_list . ", '" . l:file . "'"
        endfor
        echomsg ">^.^< Closed quickfix window. " . l:file_list . " are not in any buffers."
    else
        for l:logfile in l:example_output_buffers
            let l:buffer_number = bufnr(l:logfile)
            "if l:buffer_number == -1
                "echo "Nothing to do. Example output " . l:logfile . " is not in any buffer."
                "echomsg ">^.^< Closed quickfix window. No markdown output in any buffers."
            "    return
            if l:buffer_number != -1
            "else
                "Buffer exists... Does the window exist?"
                let window_id = win_findbuf(buffer_number)
                if window_id != []
                    "echo "Example output " . l:logfile . 
                    "    \" is at window_id " . string(window_id)
                    let found_it = win_gotoid(window_id[0])
                    if found_it
                        " Close it and delete the buffer.
                        execute "bd!" l:buffer_number
                    else
                        echo "The example output window exists but I cannot find it."
                        " TODO: Return an error here to notify the caller.
                        return
                    endif
                else
                    "echo "Nothing to do: " . l:logfile . 
                    "    \" is in buffer " . l:buffer_number .
                    "    \", but is not in any window."
                    echomsg ">^.^< Closed quickfix window. No open example output to close."
                    return
                endif
            endif
        endfor
        echomsg ">^.^<  Closed quickfix window and markdown output."
endfunction
nnoremap <leader>f<Space> :cclose<CR>:call CloseLogfileWindows()<CR>
function! CloseLogfileWindows()
    "TODO" get rid of those return statements! Whichever file is found missing
    "first, the whole function gets exited, even if there are other files that
    "are open.
    " Close the LogfileWindows for the active project.
    "Replaced the following with a list:
        "let l:log_atprogram_stdout = './build/atprogram-download_flash-stdout.log'
        "let l:log_atprogram_stderr = './build/atprogram-download_flash-stderr.log'
        "let l:buffer_number_stdout = bufnr(l:log_atprogram_stdout)
        "let l:buffer_number_stderr = bufnr(l:log_atprogram_stderr)
        "let l:buffer_number = l:buffer_number_stderr

    let l:logfile_buffers = [
        \'./build/atprogram-download_flash-stdout.log',
        \'./build/atprogram-download_flash-stderr.log'
        \]
    for l:logfile in l:logfile_buffers
        let l:buffer_number = bufnr(l:logfile)
        if l:buffer_number == -1
            "echo "Nothing to do. Logfile " . l:logfile . " is not in any buffer."
            echomsg ">^.^< Closed quickfix window. No logfiles in any buffers."
            return
        else
            "Buffer exists... Does the window exist?"
            let window_id = win_findbuf(buffer_number)
            if window_id != []
                "echo "Logfile " . l:logfile . 
                "    \" is at window_id " . string(window_id)
                let found_it = win_gotoid(window_id[0])
                if found_it
                    " Close it and delete the buffer.
                    execute "bd!" l:buffer_number
                else
                    echo "The logfile window exists but I cannot find it."
                    " TODO: Return an error here to notify the caller.
                    return
                endif
            else
                "echo "Nothing to do: " . l:logfile . 
                "    \" is in buffer " . l:buffer_number .
                "    \", but is not in any window."
                echomsg ">^.^< Closed quickfix window. No open logfile to close."
                return
            endif
        endif
    endfor
    echomsg ">^.^<  Closed windows with quickfix and atprogram-flash_download logs."
endfunction

nnoremap <leader>t<Space> :cclose<CR>:call CloseTestResults()<CR>
function! CloseTestResults()
    " Close the TestResultWindow for the active project.
    " If the TestResultWindow for another project is visible, do nothing to it.
    "echo ">^.^<"
    let l:buffer_number = bufnr('./build/TestSuite-results.md')
    if l:buffer_number == -1
        "Nothing to do.
        echomsg ">^.^< Closed quickfix window. No open test results to close."
        return
    else
        let window_id = win_findbuf(l:buffer_number)
        if window_id != []
            "echo "Test Window exists!"
            let orig_window_number = winnr()
            let found_it = win_gotoid(window_id[0])
            if found_it
                " Close it. No, just closing the window is not enough.
                "execute "wincmd c"
                " Close it and delete the buffer.
                execute "bd!" l:buffer_number
                " [ ] TODO: Why not change bd! to bw!
            else
                echo "The TestSuite-results window exists but I cannot find it."
                " TODO: Return an error here to notify the caller.
                return
            endif
            execute orig_window_number . "wincmd w"
        else
            " This buffer is in memory but not in any window. It is unlisted.
            execute "bw!" l:buffer_number
            echo "---Wiping unlisted project test buffer" l:buffer_number ."---"
            "echo "Test window is closed, but I can still see the buffer number."
        endif
    endif
    echomsg ">^.^<  Closed test result window and quickfix window."
endfunction
"Snippet for reporting when multiple TestSuite-results buffers are open.
    "Do nothing if there is more than buffer named TestSuite-results.md
    "This might come in handy later, though it ony works if the buffers have not
    "been deleted. A deleted buffer is still findable, but bufnr() does not
    "consider it. The only way to catch this is to combine wrap bufnr() inside
    "of win_findbuf() and test for an empty list.
    "let l:buffer_number = bufnr('TestSuite-results.md')
    "    if l:buffer_number == -1
    "        echo "<°.°>   There is more than one TestSuite-results buffer open."
    "        return
    "    endif

nnoremap <leader>te :call CloseTestResults()<CR>:call RunUnityTestSuite()<CR>
function! DeleteOldTestResultsMd()
    " Delete the test-results .md file.
        " The old test-results .md file hides a failed build. If a build fails,
        " my program should not call RunUnityTestSuite, but it does because it's
        " not trivial to detect a failed build. RunUnityTestSuite runs
        " TestSuite.exe. If that file does not exist, it should be game over
        " because that file generates the markdown file. But if a previous
        " markdown file still exists, it gets opened in the buffer.
        "execute "!clear;"
        "execute "normal! \<CR>"
        "execute "!"
        "    \ ."rm -f " ."./TestSuite-results.md"
    " [ ] Refactor this so that the Makefile generates the markdown file to.
        " That ought to simplify things considerably.
        " It will hopefully improve the make message also so that I don't have
        " to run make twice to see this message:
        "No rule to make target 'test/test_examples.c', needed by 'build/TestSuite.exe'.
    call system('rm -f ./build/TestSuite-results.md')
endfunction
function! RunUnityTestSuite()
    " Get the window number so we can return back later.
    let orig_window_number = winnr()
    " Open a new window to display the test results.
    botright new
    " Run the TestSuite and store the test results.
    "execute "call DeleteOldTestResultsMd()\<CR>"
    execute "call DeleteOldTestResultsMd()"
    let test_results = system('./build/TestSuite.exe')
    " Write the results to the screen and to file.
    if append(0, split(test_results, '\n'))
        echo "Error appending test results to TestSuite-results buffer."
        "TODO: cleanup and return.
    else
        write! ./build/TestSuite-results.md
    endif
    "Use the default syntax highlighting."
    setlocal filetype=
    " Color the test output with Vim matching.
    call ColorMeUnittest()
    "Auto-adjust the window height to fit the test report.
    call BufAutoHeight()
    " Put the cursor back in the window that invoked the TestSuite.
    execute orig_window_number . "wincmd w"
    redraw
    echo ">▸.~<  Unit tests finished: see results above."
endfunction

function! OldstableRunUnityTestSuite()
    " Get the window number so we can return back later.
    let orig_window_number = winnr()
    " Use the existing test result window. Create it if it does not exist.
    let buffer_number = bufnr('TestSuite-results.md')
        "bufnr() returns -1 if the buffer does not exist.
        "bufname() returns an empty string if there is no match.
        "But even after the buffer is deleted, it lives on as an unlisted buffer.
        "Use bufexists() to test for the existence of a buffer.
        "No, bufexists() still sees the unlisted buffer.
        "The following tests are insufficient.
            "let test_result_window_exists = buffer_name!=''
            "test_result_window_exists == 1   -   Window exists.
            "test_result_window_exists == 0   -   Window does not exist.
            "buffer_number = bufnr('TestSuite-results.md')
            "bufexists(buffer_number)
        "Use bufnr() followed by win_findbuf().
    let window_id = win_findbuf(buffer_number)
    if window_id == []
        " The window does not exist.
        " Open a new window to display the test results.
        botright new
    else
        " The window exists! Find it.
        let found_it = win_gotoid(window_id[0])
        if found_it
            "Clear the window.
            normal! ggdG
        else
            echo "The TestSuite-results window exists but I cannot find it."
            " Return before you start editing the wrong window.
            return
            " TODO: cleanup before you return.
        endif
    endif
    " Run the TestSuite and store the test results.
    let test_results = system('./build/TestSuite.exe')
    " Write the results to the screen and to file.
    if append(0, split(test_results, '\n'))
        echo "Error appending test results to TestSuite-results buffer."
        "TODO: cleanup and return.
    else
        write! ./build/TestSuite-results.md
    endif
    "Use the default syntax highlighting."
    setlocal filetype=
    " Color the test output with Vim matching.
    call ColorMeUnittest()
    "Auto-adjust the window height to fit the test report.
    call BufAutoHeight()
    " Put the cursor back in the window that invoked the TestSuite.
    execute orig_window_number . "wincmd w"
    redraw
    echo ">▸.~<  Unit tests finished: see results above."
endfunction

function! ColorMeQuick()
    " Highlight the error in the quickfix window.
    normal ;hh
    :match Error /\cerror.*/
        " white text on red background  -- '.*' to end-of-line
    :2match ErrorMsg /undefined.*/
        " red bold text  -- '.*' to end-of-line
    :3match WarningMsg /warning.*/
        " pink bold text  -- '.*' to end-of-line
endfunction
function! ColorMeUnittest()
    " Highlight the error in the quickfix window.
    normal ;hh
    :match ErrorMsg /FAIL.*/
        " white text on red background  -- '.*' to end-of-line
    :2match Cursor /\%1c\d.*/
        " red bold text  -- '.*' to end-of-line
    :3match Define /-\|.*PASS.*/
        " green text -- '.*' to end-of-line
    ":3match Cursor /PASS.*/
        " blue background -- '.*' to end-of-line
    ":3match Comment /PASS.*/
        " subdued
endfunction
nnoremap <leader>4 :call BufAutoHeight()<CR>
function! BufAutoHeight()
    "Auto-adjust the window height to the number of rows of text.
    let height = line("$")
    execute height.'wincmd _'
    "Place the cursor line at the top of the window.
    execute "normal! gg"
endfunction

" Tasks:
    " [x] color the highlighted line in the copen window to make the error pop
    " out, or set for filetype=qf to highlight the word error.
    " [x] Standardize the filename to run. Perhaps TestSuite.exe or Tests.exe or
    " UnitTests.exe
    " [x] Create the terminal window at the bottom of the screen.
        " Use :bo[tright] term ./build/TestSuite.exe
        " This is superceded. Instead of running a terminal window, I invoke the
        " shell with system() and store the result in a local variable. The
        " result is written to a window using append(), and then the new buffer
        " is saved to file, thus labeling the window and providing a buffer to
        " look for the next time the test runs.
    " [x] If there is already a terminal window, re-use that one, do not create
    "     a second one.
    " [x] Automatically run tests if there are no compiler errors.
" Interesting Damian Conway vimscript, identical to what I was thinking:
    "=====[ Enable quickfix on Perl programs ]=======================
    "
    " Nmap ;m [Run :make and any tests on a Perl file]  :make<CR><CR><CR>:call PerlMake_Cleanup()<CR>
    " 
    " function! PerlMake_Cleanup ()
    "     " If there are errors, show the first of them...
    "     if !empty(getqflist())
    "         cc
    " 
    "     " Otherwise, run the test suite as well...
    "     else
    "         call RunPerlTests()
    "     endif
    " endfunction
    " 
    " set makeprg=polyperl\ -vc\ %\ $*
"---EXPERIMENTAL---
nnoremap <leader>[] i[<Esc>lli]<Esc>h
nnoremap <silent> <leader>gt :s/\w\+/\L\u\0/g<CR>:noh<CR>
    "Make This Line Titlecase.
    "This next version does the same thing, but I could not get it to work in
    "Visual mode.
        "nnoremap <silent> <leader>gt :s/\v<(.)(\w*)/\u\1\L\2/g<CR>:noh<CR>
        "\v very magic
        "< beginning of a word
        "() grouping into an atom
    "Also seeh :h substitute and search for 'capitalize':
        ":s/\w\+/\u\0/g		 modifies "bla bla"  to "Bla Bla"
        ":s/\w\+/\L\u\0/g		 modifies "BLA bla"  to "Bla Bla"
        "Note the \L forces the words to titlecase.
        "Omitting the \L, "BLA bla" becomes "BLA Bla"
vnoremap <silent> <leader>gt :call VisualSelectionToTitlecase()<CR>
function! VisualSelectionToTitlecase()
    "Make the <Visual Selection> titlecase.
    "Try it out: place the cursor inside <visual seleciton> and press:
    "vi<    to make a selection inside the < >
    ";gt    to convert the selection to titlecase.
    execute 's/\%V\w\+\%V/\L\u\0/g'
    "\%V is "match inside the Visual area." See :h \%V
        "Without \%V, the substitution applies to the whole line:
            "execute 's/\w\+/\u\0/g'
        "And with \%V, the nmap version I copied from Vim help does not work:
            "execute 's/\%V\v<(.)(\w*)\%V/\u\1\L\2/g'
        "Note: if using doublequotes, you need two backslashes!
        "execute "'<,'>s/\\w\\+/\\u\\0/g"
    "noh
endfunction
set nojoinspaces
    "Vim default is to format paragraphs with two spaces after a sentence.
    "I have mixed feelings on this. I like the look of extra space, but I also
    "like reducing line count. What tips the scale for me is that the single
    "space is considered correct (and the two spaces incorrect) by all of the
    "major style guides for English. So if it's good enough for general writing,
    "I'd say it's good enough for me. The capital letter at the beginning of the
    "sentence ought to be sufficient for the reader.
set ttimeout
    "Timeout on keycodes so that <Esc> does not wait for an Alt-mapped key.
set ttimeoutlen=0
    "By setting ttimeoutlen to 0, keycodes time out instantly, but mapping
    "timeout is unaffected.
    "This addresses the problem that <Esc> has to timeout, so
    "after hitting <Esc>, I have to be careful not to hit a mapped key like 'w',
    "or I enter a window command by accident.
    "
    "By default ttimeoutlen is -1, which tells Vim to use timeoutlen as
    "tttimeoutlen. By default timeoutlen is 1000ms.
set notimeout
    "Never timeout. 1s is a little too short. But why even timeout? If I want to
    "end a command I started by accident, I'll just hit Esc.
map <F2> :term<CR>
"---Compiling a self-contained c file---
    "gcc sample.c -Wall -std=c99 -Wextra -pedantic -o Sample

"nnoremap <leader>cc :!clear;gcc -Wall -Wextra -pedantic % -o %:r.exe;./%:r.exe<CR>
"nnoremap <leader>c+ :!clear;g++ -Wall -Wextra -pedantic % -o %:r.exe;./%:r.exe<CR>
"nnoremap <leader>cl :!clear;clang -Wall -Wextra -pedantic % -o %:r.exe;./%:r.exe<CR>
nnoremap <leader>co :!clang -Wall -Wextra -pedantic -c % -o %:r.o
    "---Update---
        "The idea was to have a shortcut for making an object file instead of
        "making and running a .exe.
        "But binrepr.c is part of my project now. I modified my Makefile to
        "handle my custom unity-extensions like binrepr. But I am keeping this
        "mapping and the following comments in case I need to do something like
        "this in the future.
    "---End Update---
    "Create an object file using clang.
        "Example usage: I just created binrepr.c. It is not part of my project
        "(yet), but it is a neat little helper function to give me the binary
        "representation of a byte.
    "When would I only make an object file instead of a .exe?
        "The idea is that other non-project files use this object file. For
        "example, I have a c-what-it-does.c file that uses binrepr. So when I
        "build c-what-it-does.c into an executable, I do this:
        "!clear;clang -Wall -Wextra -pedantic % %:h:h:h/build/binrepr.o -o "%:r.exe;./%:r.exe
    "Why are there non-project files in the project?
        "Sometimes I need to learn C.
        "It is good to keep these files in the project folder for reference, but
        "they are not project code, just quick things I threw together for
        "learning/experiments.
nnoremap <leader>cc :call BuildThisCfileWith("gcc")<CR>
nnoremap <leader>c+ :call BuildThisCfileWith("g++")<CR>
nnoremap <leader>cl :call BuildThisCfileWith("clang")<CR>
nnoremap <leader>md :call PipeLatestExeToMarkdownFile()<CR><CR><CR>
function! BuildThisCfileWith(build_tool)
    echomsg "Building with: " . a:build_tool
    execute "!clear;"
        \ "rm -f " ."./" .expand("%:r"). ".exe;"
        \ .a:build_tool
        \ "-Wall -Wextra -pedantic"
        \ expand("%") "-o" expand("%:r"). ".exe;"
        \."./" .expand("%:r"). ".exe"
endfunction
function! PipeLatestExeToMarkdownFile()
    "Run this after a build.
    "This requires the .c, .exe, and .md all have the same name (stem).
    execute "!./" .expand("%:r"). ".exe >" expand("%:r"). ".md"
    "=====[ Alternatively ]=====
    "Working one-liner that does build and creates .md:
    "!clear;g++ -Wall -Wextra -pedantic % -o %:r.exe;./%:r.exe > %:r.md
endfunction


set clipboard=
"set clipboard=unnamed
    " Paste from other applications without needing *.
    " Downside: this will clobber the '*' register.
    " If you find yourself saving '*' to another register, maybe set this back.
    " Default is nothing (clipboard= )
nnoremap <leader>pwd :redir @+<Bar>pwd<Bar>redir END<CR>$"+pj:execute "left"indent(line('.')-1)<CR>
"nnoremap <leader>pwd :redir @+<Bar>pwd<Bar>redir END<CR>$"+pj0ky^jP
    "like :pwd but clipboard pastes the output on the next line
    " Failed attempts at making the pasted text align with the line above using
    " gq and using insert mode paste with formatoptions adjusted:
    "nnoremap <leader>pwd :set fo+=l<CR>$:redir @+<Bar>pwd<Bar>redir END<CR>"+pgqj:set fo-=l<CR>
    "nnoremap <leader>pwd :set fo-=tcq<CR>$:redir @+<Bar>pwd<Bar>redir END<CR>"+pgqj:set fo^=tcq<CR>
    "nnoremap <leader>pwd :set fo+=l<CR>:redir @+<Bar>pwd<Bar>redir END<CR>o<C-r>+<Esc>:set fo-=l<CR>
"=====[ ASCII art ]=====================================
" nnoremap <silent> <leader>- ^v$gr-
    " Replace all text on this line with '-'.
nnoremap <silent> <leader>-U yyP^v$gr-j
    " -[U]pperline the text.
    " Place a line of '-' above the text.
nnoremap <silent> <leader>-u yyp^v$gr-k
    " [-u]underline the text.
    " Place a line of '-' below the text.
nnoremap <silent> <leader>-s I=====[<Space><Esc>A<Space>]=====<Esc>F[w
    " Surround the text with =====[ text ]=====
nnoremap <silent> <leader>-b I<Bar><Space><Esc>A<Space><Bar><Esc>yyP^v$gr-jyyp^v$gr-k
    " [-B]ox the text.
    " Surround the text with bars: | blah text |.
    " Place a line of '-' above and below the barred text.
    " Example:
    "   --------------
    "   | Boxed Text |
    "   --------------
"=====[ Map my favorite window navigation commands]=====
" Map Alt-W to Ctrl-W to run windows commands.
"execute "set <M-w>=\033w"
"nnoremap <M-w> <C-w>
    " I am taking this out in favor of doing <leader>w
"---Remap <C-w> commands to <leader>w---
nnoremap <leader>w <C-w>
"nnoremap <leader>wt <C-w>t
    " Move to top left window (usually NERDTree).
    " Explicit mapping to wt no longer necessary.
"nnoremap <leader>wb <C-w>b
    " Move to bottom right window (usually Terminal buffer with test output).
    " Explicit mapping to wt no longer necessary.
"nnoremap <leader>ww <C-w>p
    " Do not use this anymore. It was just confusing.
    " Move to previous window.
    " Hammering ;ww toggles between two windows.
    " ;wp is already taken for Windows Path
    " This does not work if the previous window was just closed, even if there
    " are still open windows.
    " This does not work after sourcing the .vimrc.
"=====[ Make Visual modes work better ]==================
nnoremap v <C-v>
nnoremap <C-v> v
vnoremap v <C-v>
vnoremap <C-v> v
    " https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/.vimrc
    " Damian Conway
    " Swap key mappings for "Visual" and "Visual Block".
    " set virtualedit=block
    " Allow visual block selection even where there is no text.
" Remove ^M from the file in the active window.
nnoremap <leader>eol :call RemoveEolCaretM()<CR>
function! RemoveEolCaretM()
    " Do not run this on the .vimrc or you'll mess up this function!
    " :%s/^M//g
    " Which is entered by typing this:
    " :%s/Ctrl-V<CR>//g
    "echo ">^.^< remove ^M"
    if (expand("%:t") == ".vimrc")
        echo "I refuse to call RemoveEolCaretM() in the .vimrc."
    else
        %s///g
    endif
endfunction

" Create a macro for cleaning expanded #includes from preprocessed C files.
nnoremap <leader>di :call CleanExpandedIncludes()<CR>
function! CleanExpandedIncludes()
    " Note the  shown below was entered in insert mode with the keystrokes
    " <C-b><C-m>    -   This is because I remapped <C-v> to <C-b>.
    " See :h i_CTRL-V
    let @d='ggd/\%1c#\_s1.*main\.c*.*dd'
    normal @d
    let @d='/\%1c#\_s.*avr8-gnu-toolchain.*d/\%1c#\_s.*main\.c.*'
    let num_includes = 5
    execute "normal" num_includes . "@d"
    echo ">^.^<  Deleted expanded #includes from preprocessor output."
endfunction
    " Clean the expanded #include files from the avr-gcc preprocessor output.
    " Look at the preprocessor output (-E), including comments (-C):
    " ... -E -C > preproc-E-C.c
    " This includes entire avr8-gnu-toolchain include files.
    " Here are the steps to erase these from the resulting output:
    " Deletion 1: (eliminates the first four lines)
        " gg   -   Start at the beginning of the file.
        " d    -   Start a delete command.
        " Then use a search to make a motion:
        " /\%1c#\_s1.*\main\.c.*
        " dd   -   Delete the final line.
    " Deletion 2: (eliminate every expanded avr #include file)
        " Repeat Deletion 2 for every #include avr file:
        " Find where the #include avr stuff starts:
        " /\%1c#\_s.*avr8-gnu-toolchain.*
        " d    -   Start a delete command.
        " And search again to make a motion to the next mention of main.c:
        " /\%1c#\_s.*\main\.c.*
" Show line numbers.
set number
set relativenumber
" loaded_nerd_tree
let NERDTreeShowLineNumbers=1
" let NERDTreeMinimalUI=0 " 1: Hide the Press ? for help and bookmarks.
let NERDTreeShowBookmarks=1 "default to bookmarks shown... 'B' to toggle
let NERDTreeCascadeSingleChildDir=0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeChDirMode = 1

nnoremap <leader>nf :NERDTreeFind<CR>
    " (n)ERDTree(f)ind
    " Explore the directory of the current buffer.
nnoremap <leader>nt :NERDTreeToggle<CR>
    " (n)ERDTree(t)oggle
    " Toggle explorer open/closed, putting cursor back where it was.
    " This saves having to navigate the windows, close the window, and navigate
    " back to wherever you left off.
    " Note that
    "   :NERDTreeToggle
    "   and
    "   :NERDTree
    " do the same thing when you first start Vim. But once you call
    "   :NERDTreeFind
    " :NERDTreeToggle toggles the view of the current buffer directory, not the
    " Vim current directory. This is exactly the behavior you would expect/want,
    " it's only worth noting because when you first open Vim, you can just
    " straightaway do ;nt instead ;nv. And of course, if you ;nv again, then ;nt
    " goes back to toggling the view of the current Vim directory.
nnoremap <leader>nv :NERDTree<CR>
    " (n)ERDTree for the (v)im current directory
    " Explore the current vim directory.
    " I thought about this mapping:
    " nnoremap <leader>n<Space> :NERDTree<CR>
    " But nv makes more sense as the (n)ERDTree for the (v)im current directory.
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
    " Start command to open from bookmark.
    " This command combines with:
    " let NERDTreeChDirMode = 1
    " to have the affect that the Vim pwd is changed to the project directory
    " when the project is opened by bookmark with ;nb,
    " but does not alter the Vim pwd when the project is opened by bookmark with
    " 'o'. This is the perfect behavior to use ;nb to open projects.
nmap <leader>nr :call RefreshNERDTreeFolder_build()<CR>
function! RefreshNERDTreeFolder_buildDEV()
    echo "DEV >^.^<"
    /build\/
endfunction
function! RefreshNERDTreeFolder_build()
    " Refresh only the build folder in the NERDTreeWindow.
    " TODO: Refactor with RefreshNERDTreeWindow to remove duplicate code.
    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    execute "NERDTreeFocus"
    "=====[ RefreshNERDTreeFolder_build starts here ]=====
    "First go to the root. This avoids the case that 'build' appears in the
    "Bookmarks.
    execute "normal P"
    " find the build/ folder
    /build\/
    execute "normal O"
    execute "normal r"
        " Note this must be 'normal' and not 'normal!' for 'r' to behave as
        " 'NERDTree-r' because 'r' already has a Vim mapping.
    "=====[ RefreshNERDTreeFolder_build ends here ]=====
    if not_invoked_from_nerdtree_window
        execute "wincmd p"
        " Return to the window where ;nr was invoked.
    endif
    execute "noh"
        " Remove highlighting from the last search
endfunction
nmap <leader>nR :call RefreshNERDTreeWindow()<CR>
function! RefreshNERDTreeWindow()
    " Refresh the list of files in the NERDTree window.
        " Formerly this was just a keymapping:
        "   :NERDTreeFocus<CR>R<C-w>p
        " But then I wanted to call this from other functions,
        " so I made it its own function.
    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    execute "NERDTreeFocus"
    execute "normal R"
        " Note this must be 'normal' and not 'normal!' for 'R' to behave as
        " 'NERDTree-R' because 'R' already has a Vim mapping.
    if not_invoked_from_nerdtree_window
        execute "wincmd p"
        " Return to the window where ;nr was invoked.
    endif
endfunction
    " Refresh the view in the NERDTree window (like after make or make clean).
    " nmap is required for Vim to interpret 'R' as NERDTree-R rather than R.
    " Hence the error: 'not modifiable' if mapped with nnoremap.
    " See :h recursive_mapping
    " This is almost good enough: nmap <leader>nr :NERDTreeFocus<CR>R<C-w>p
    "   For now, I can remember to just hit 'R' in the NERDTree window.
    "   Issue:
    "   If you call this from the NERDTree window, you are bounced back to a
    "   different window, like the quickfix preview window.
" NERDTree is my default file browser, but I can still access netrw.
" Make netrw useable.
let g:netrw_liststyle = 3       " Use tree view.
let g:netrw_banner = 0          " Hide the banner.
" let g:netrw_browse_split = 4    " Open in previous window.
let g:netrw_winsize = 25        " Set width to 25% of page.
let g:netrw_altv = 1            " Keep explorer on left when file opened with 'v' 

" let loadTabulous = 1
" Uncoment the above line to disable Tabulous.
" But Tabulous is fabulous, so I'm not sure why I would ever do that.
let tabulousCloseStr = '>^.^<'
" let tabulousLabelNameOptions = ':t:r'
" These are the default label names: files without extensions.
" The following shortcut renames the label to the folder.
nnoremap <leader>gn :TabulousRename<Space><C-r>=expand("%:p:h:t")<CR><CR>
    " :TabulousRename <C-r>=expand("%:p:h:t")
    " Default Tabulous is to name the tab as the file of the active buffer.
    " Rename the tab to the folder of the active buffer.
    " This is for quickly naming tabs of a development project.
    " Open the project's Makefile and hit ';gn'.
" D deletes to end of line. Make Y also delete to end of line.
nnoremap Y y$
" Search for the visual block: make a block, hit 's', that's it!
" TODO: yank into a register so you do not clobber register 0.
vnoremap s y/<C-R>"<CR>zv
vnoremap S y?<C-R>"<CR>zv

set showmatch
    " Show matching opening brace when closing braces.
    " TODO(sustainablelab@gmail.com): make the 'show' a little faster.

" Use >--- for tab and unicode middle dot for space.
exec "set listchars=tab:>-,trail:\uB7,space:\uB7"
set list " Turn on whitespace display but setup toggle.

" For all the keycodes, like <Esc>, see :h key-codes

" No more wrist pain!"
    " Make the Alt-key functional for mappings."
    " This was discovered at the mintty terminal:
    "   $ sed -n l
    "   {type the key combo, such as Alt-w and hit Enter}
    "   Each line ends with $.
    "   Ctrl-C to quit.
    "   The resulting mappings displayed with :nmap are shown as random unicode
    "   codepoints for the {lhs} and blank for the {rhs}.
" Map Alt-E to Ctrl-E to scroll up.
execute "set <M-e>=\033e"
nnoremap <M-e> <C-e>
execute "set <M-f>=\033f"
" Map Alt-F to Ctrl-Y to scroll down.
nnoremap <M-f> <C-y>
" Map Alt-R to Ctrl-R for redo.
execute "set <M-r>=\033r"
nnoremap <M-r> <C-r>
" Alt unicode is weird:
    " M-Up is \033[1;3A
    " M-Down is \033[1;3B
    " How come I didn't need to set the Alt-key unicode for M-Up and M-Down?
" Map Alt-Up to align with the text above.
nnoremap <M-Up> :execute "left ".expand(indent(line('.')-1))<CR>
":call LeftAlignWithAbove()<CR>
vnoremap <M-Up> :call LeftAlignWithAbove()<CR>
function! LeftAlignWithAbove()
    execute "left ".expand(indent(line("'<")-1))
        "Two issues to consider:
        " 1. The nnoremap one-liner doesn't work for visual mode.
            " This has to be a function call to convert the output of indent()
            " to a string.  If this is just a mapping, the range is passed and I
            " get the error: E481: No range allowed.  Similarly, doing the
            " highlight and typing the execute line throws the same error.
        " 2. If '.' is used instead of "'<" as the valule for line(), then
            " the function gets the value of the line 1 above the current line,
            " as it steps through and left-aligns each line in the selection!
            " What we want for ---VISUAL LINE--- is to just use the line at the
            " top of the selection.
            " When we have a ---VISUAL LINE--- selection:
            " "'<" uses the line number at the top of the selection
            " "'>" uses the line number at the bottom of the selection
        " Also see this:
        " https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript/6271254#6271254
endfunction
" Map Alt-Down to align with the text below.
nnoremap <M-Down> :execute "left ".expand(indent(line('.')+1))<CR>
":call LeftAlignWithBelow()<CR>
vnoremap <M-Down> :call LeftAlignWithBelow()<CR>
function! LeftAlignWithBelow()
    execute "left ".expand(indent(line("'>")+1))
endfunction

" Search for '#' as the first character on a line.
nnoremap <leader>3  /\%1c#<CR>:noh<CR>
nnoremap <leader>#  ?\%1c#<CR>:noh<CR>
" Change to the directory of the currently open file.
" For the active window only:
nnoremap <leader>lcd :lcd %:p:h<CR>
" For all windows:
nnoremap <leader>cd  :cd  %:p:h<CR>
" Convert file paths from POSIX to Windows and vice versa.
    " Copy the path onto its own line in Vim.
    " Position cursor anywhere on the line.
    " TODO: this only works on file paths, not folder paths. Why?
    " Example:
    " This is a folder path. It does not convert:
        " C:\Program Files (x86)\Atmel\Studio\7.0\Extensions\Application\
    " This is a file path, it converts:
        "C:\Program Files (x86)\Atmel\Studio\7.0\Extensions\Application\StudioCommandPrompt.exe
        "/cygdrive/c/Program Files (x86)/Atmel/Studio/7.0/Extensions/Application/StudioCommandPrompt.exe
" Windows to POSIX:
nnoremap <leader>cp ^v$h"+y:!cygpath "<C-r>+" <Bar> clip<CR>"+pky^jP
    " Paste from clipboard in Cygwin mintty with
    "   Ctrl+Shift+v
    " Paste path to clipboard in Cygwin mintty with
    "   pwd | clip
" POSIX to Windows:
nnoremap <leader>cw ^v$h"+y:!cygpath -w "<C-r>+" <Bar> clip<CR>"+pky^jP
    " Paste from clipboard in PowerShell with
    "   Alt+Space+e
    " Paste path to clipboard in PowerShell with
    "   (Get-Item -Path ".").FullName | clip

" Echo the linenumber before and after a change in folds.
" nnoremap <leader>zr :call EchoFold()<CR>
" nnoremap <leader>zr :call UnfoldThenRestoreScroll()<CR>
nnoremap <leader>zr :call UnfoldThenRestoreScroll()<CR>
function! UnfoldThenRestoreScroll()
    let window_line_number = winline()
    let text_line_number = line(".")
    echo "window:" window_line_number . ", text:" text_line_number
    " Change folds by one level.
    normal zr
    " Move the current line to the top of the window.
    execute "normal" text_line_number . "zt"
    " Move the window down to restore the original line number.
    execute "normal" window_line_number-1 . "\<C-y>"
endfunction
nnoremap <leader>zm :call FoldThenRestoreScroll()<CR>
function! FoldThenRestoreScroll()
    let window_line_number = winline()
    let text_line_number = line(".")
    echo "window:" window_line_number . ", text:" text_line_number
    " Change folds by one level.
    normal zm
    " Move the current line to the top of the window.
    execute "normal" text_line_number . "zt"
    " Move the window down to restore the original line number.
    execute "normal" window_line_number-1 . "\<C-y>"
endfunction

function! EchoFold()
    let old_scroll = winline()
    :normal zr
    let delta_scroll = winline() - old_scroll
    echo delta_scroll
endfunction

" TODO: fix - and _ to deal with folds (right now they wreak havoc!)
nnoremap <silent> <leader>h<Space> :match<CR>
nnoremap <silent> <leader>hh mh:execute 'match Search /\%'.line('.').'l/'<CR>
    " Highlight the current line.
    " line('.') gets the current line number
    " 'h        -   hop back to the highlighted line
    " :match    -   turn off the highlight
    " ;h<Space> -   turn off the highlight
    " My attempt:
        " nnoremap <silent> <leader>hh :execute '/\%' . line(".") . 'l.*'<CR>
    " The one I'm using is from here:
        " http://vim.wikia.com/wiki/Highlight_current_line

" Test highlighting status line
"nnoremap <leader>5 :call HiReadonlyStatusLine()<CR>
" This works. Now call this when you enter a buffer.
function! HiReadonlyStatusLine()
    "echo ">^.^<"
    if &readonly
        hi! link StatusLine WarningMsg
    else
        hi! link StatusLine StatusLine
    endif
    redrawstatus
endfunction
" Toggle visibility whitespace and comments.
    " Query color setting of a group with ":highlight {groupname}".
    " :hi Comment
    " :hi Ignore
nnoremap <leader>hc :call CommentToggle()<CR>
function! CommentToggle()
    let HiInfo = execute('hi Comment')
    if matchstr(HiInfo,'Ignore') == ''
        hi! link Comment Ignore
        echo "Comments are barely visible."
    else
        hi! link Comment Comment
        echo "Comments are visible again."
    endif
endfunction
nnoremap <leader>hw :call WhitespaceToggle()<CR>
function! WhitespaceToggle()
    let HiInfo = execute('hi SpecialKey')
    if matchstr(HiInfo,'Ignore') == ''
        hi! link SpecialKey Ignore
        echo "Whitespace is barely visible."
    else
        hi! link SpecialKey SpecialKey
        echo "Whitespace is visible again."
    endif
endfunction
" Toggle visual wrapping (echoes hardwrap formatting with gq).
nnoremap <leader>gq :call SoftWrapToggle()<CR>
function! SoftWrapToggle()
    execute('set wrap!')
    let wrap_state = execute('set wrap?')
    if matchstr(wrap_state,"nowrap") == "nowrap"
        echo "<'.'>  Soft wrapping --off--"
    else
        echo ">^.^<  Soft wrapping  --on--"
    endif
endfunction

" Try out the next two to see what they do.
" zv is to unfold text at the cursor as it traverses folds.
nnoremap - zvddp
nnoremap _ zvddkP
" The next two do the same but for a visual block of complete lines (V).
vnoremap - zvdpzvV']
vnoremap _ zvdkPzvV']

"---Remap <Esc>---
    " <Esc> to escape sucks. i_<C-c> to escape is OK.
    " Vim recommends i_<C-[> to escape insert mode.
    " But jk to exit insert mode and command-line mode is awesome.
    " Use i_<C-b> to enter the text 'jk' without exiting insert mode.
inoremap jk <Esc>
    " Map to <Esc>:
    "   jk to exit insert mode
    "   Vim default: <C-c> or <C-[>
    "   jk to exit command line mode
    "   Vim default: <C-c> or <C-[><C-[>
    "   jk to exit after a visual-block column-edit.
    "   Vim default: <C-[><C-[>
    "   Note that <C-c> escapes visual-block edit without changing all lines.
cnoremap jk <C-c>
    " Map to <C-c> to escape command-line mode without executing.
"---Remap register paste <C-r>---
inoremap <C-b> <C-v>
cnoremap <C-b> <C-v>
inoremap <C-v> <C-r>
cnoremap <C-v> <C-r>
    " Make Ctrl-V mimic Ctrl-R in insert mode and command mode.
    " Default Ctrl-V is to insert non-digits literally or to insert up to three
    " decimal digits to write a single byte. The non-digits and the three digits
    " that make up the byte are not considered for mapping. So this is a way to
    " insert jk without having to hit Esc. This sounds useful, so I remapped it
    " to Ctrl-B.

" Grow/shrink vertically split windows:
nnoremap <C-Right> :wincmd><CR>
nnoremap <C-Left> :wincmd<<CR>
" Grow/shrink horizontally split windows:
nnoremap <C-Up> :wincmd-<CR>
nnoremap <C-Down> :wincmd+<CR>
" Search for unfinished tasks [ ] and position cursor for 'rx' to mark done:
" [x]
nnoremap <leader>ta /\[\ \]/e-1<CR>zv
nnoremap <leader>T h?\[\ \]?e-1<CR>zv

" ;t finds the next task and positions the cursor.
" ;T finds the previous task and positions the cursor.
" rx marks it done.

" Clear highlights.
nnoremap <leader><Space> :noh<CR>
" Source the vimrc.
nnoremap <leader>sv :source $MYVIMRC<CR>
" Source the current file.
nnoremap <leader>so :call SourceCurrentFile()<CR>
function! SourceCurrentFile()
    if &filetype == 'vim'
        execute "source %"
    elseif &filetype == 'python'
        execute "!./%"
    endif
endfunction
" Source the highlight listing.
nnoremap <leader>sh :source $VIMRUNTIME/syntax/hitest.vim<CR>
"nnoremap <BS> :buffer #<CR>
nnoremap <BS> :call SpecialBufferToggle()<CR>
function! SpecialBufferToggle()
    if bufname("%") == "slides/slide2.abc"
        " Restore the original state of the slide before switching buffer.
        edit!
    endif
    buffer #
endfunction

" ---File Quick Edits--- (;ex - opens the file 'x')
nnoremap <leader>ev :edit $MYVIMRC<CR>zv
    " Edit the vimrc.
    " If the last cursor location happens to be in a fold, unfold at the cursor.
let PATH_notes_for_update =
    \ "/cygdrive/c/Users/Mike/Documents/chromation/txt/updates/notes_for_update.md"
nnoremap <leader>en :exec "edit ".PATH_notes_for_update<CR>zv
    " Edit the notes_for_update.
    " If the last cursor location happens to be in a fold, unfold at the cursor.
let PATH_readme =
    \ "/cygdrive/c/chromation-dropbox/Dropbox/c/readme.md"
nnoremap <leader>er :exec "edit ".PATH_readme<CR>zv
    " Edit the catch-all programming "c" readme.md
    " If the last cursor location happens to be in a fold, unfold at the cursor.
let PATH_ps_profile =
    \ "/cygdrive/c/Users/Mike/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
nnoremap <leader>ep :exec "edit ".PATH_ps_profile<CR>
" Make more 2017 Eval Kits.
let PATH_2017EvalSpectrometer_inventory =
\ "/cygdrive/c/chromation-dropbox/Dropbox/sales/2017\ eval\ kits/inventory.md"
nnoremap <leader>ei :exec "edit " . PATH_2017EvalSpectrometer_inventory<CR>
" Work on the Earhart programmer.
let PATH_earhart_programmer =
\ "/cygdrive/c/chromation-dropbox/Dropbox/cpp programs/Command Line Programmer/SourcePoke/."
nnoremap <leader>ea :exec "edit ".PATH_earhart_programmer<CR>

" ---Folder Quick Edits--- (;ex - opens the folder 'x')
" C/Make/Linker Learning Project Paths (set latest project to one of these)
let PATH_SillyExample_project =
\ '/cygdrive/c/mike-dropbox/Dropbox/programming/c/learn_make/SillyExample/.'
let PATH_MultiFile_project =
\ '/cygdrive/c/mike-dropbox/Dropbox/programming/c/learn_make/MultiFile/.'
" ---Select the latest project---
let PATH_latest_project = PATH_SillyExample_project
nnoremap <leader>el :exec "edit ".PATH_latest_project<CR>

" ---Folder Quick Browse--- (;bx - populates command-line with folder)
" ---???
" Hah, I cannot figure this out. Either the expression does not expand, or it
" expands and executes.
" So for now, this has become a 'cd here' command.
" Navigate (cd) to the PATH, then display (pwd) the directory.
"
" :e. to browse in this new directory
" :E to browse at the current file's directory.
" 
" TODO(sustainablelab@gmail.com):
"   Why doesn't the ;eh shortcut work in netrw and NERDTree?
"   Weird workaround: go to ;ev to have a launch point.

" ---Folder Quick cd---
" nnoremap <leader>eh =:edit .<CR>
" The above map with the <CR> throws error
"   E21: Cannot make changes, 'modifiable' is off.

let PATH_Lis770 =
\ '/cygdrive/c/chromation-dropbox/Dropbox/design files and protocols/circuits/mcu/Atmel Studio/LIS-770i_Interface/.'
let PATH_latest_browse = PATH_Lis770
nnoremap <leader>bl :exec "cd ".PATH_latest_browse<CR> :pwd<CR>
let PATH_chromation_c_code =
\ '/cygdrive/c/chromation-dropbox/Dropbox/c/.'
nnoremap <leader>bc :exec "cd ".PATH_chromation_c_code<CR> :pwd<CR>

" See :h :file for displaying file/path/buffer.
" See :h :cd for displaying the current directory.
" Change the active directory to the directory of the current file:
" See <leader>cd

" ---Copy Windows/POSIX paths to the clipboard---
"nnoremap <leader>wp :let @+ = expand("%:p:gs?/cygdrive/c?C:?:gs?/?\\?")<CR>
    " Windows Path to clipboard.
    "   Full file path, example: \home\Mike\.vimrc
    "   This works, but I stopped using it as ;wp so I could keep ;w mapped to
    "   window commands. Besides, I ended up typically doing the POSIX copy
    "   followed by ;cw to cygpath it from POSIX to Windows.
"nnoremap <leader>wh :let @+ = expand("%:p:h:gs?/cygdrive/c?C:?:gs?/?\\?")<CR>
    " Windows Head to clipboard.
    "   Folder path, example: \home\Mike
nnoremap <leader>pp :let @+ = expand("%:p")<CR>
    " POSIX Path to clipboard
    "   Full file path, example: /home/Mike/.vimrc
nnoremap <leader>ph :let @+ = expand("%:p:h")<CR>
    " POSIX Head to clipboard
    "   Folder path, example: /home/Mike
nnoremap <leader>fn :let @+ = expand("%:t")<CR>
    " Tail to clipboard.
    "   File name, example: .vimrc

nnoremap <leader>fid /[^\.]
    " Search ignoring dots (for use in netrw explorer)
    " TODO: replace functionality by defining a hidden files list.
    " This is not urgent. NERDTree has 'I' to toggle hidden files.

"---START RECOVERED FROM 2-4-2018 .VIMRC---
set t_Co=256
"---END RECOVERED FROM 2-4-2018 .VIMRC---

"---Define colorschemes---
let my_notes_colorscheme = "deus"
    " let my_notes_colorscheme = "CandyPaper"
    " I like that 'deus' and 'badwolf' bold Markdown headings
    " I like that 'badwolf' and 'CandyPaper' have very dark backgrounds
    " 'CandyPaper' is even darker than 'badwolf'
    " 'duoduo' bolds some things, but not markdown headings
    " e.g., 'duoduo' bolds .vimrc nicely and none of the others do!
let my_md_colorscheme = "badwolf"
let my_c_colorscheme = "badwolf"
let my_vimrc_colorscheme = "duoduo"
let my_disassembly_colorscheme = "duoduo"
    " let my_fav_colorscheme = "duoduo"
    " let my_fav_colorscheme = "CandyPaper"
" TODO[ ] files that begin with the name 'test_'
let my_fav_colorscheme = "badwolf"
exec('colorscheme '.my_fav_colorscheme)

"---Set colorschemes---
nnoremap <leader>CS :call ColorschemeToggle()<CR>
    " Manual refresh scheme with ";CS".
    " See augroup vimrc -> au BufEnter.
    " Whatever you implement for ";CS" also implement for "au BufEnter".
function! ColorschemeToggle()
    if matchstr(@%,"notes_for_update") == "notes_for_update"
        exec('colorscheme '.g:my_notes_colorscheme)
        redraw | echo "colorscheme ".g:my_notes_colorscheme
    elseif &filetype == "markdown"
        exec('colorscheme '.g:my_md_colorscheme)
        redraw | echo "colorscheme ".g:my_md_colorscheme
    elseif &filetype == "c"
        exec('colorscheme '.g:my_c_colorscheme)
        redraw | echo "colorscheme ".g:my_c_colorscheme
    elseif &filetype == "asm"
        exec('colorscheme '.g:my_disassembly_colorscheme)
        redraw | echo "colorscheme ".g:my_disassembly_colorscheme
    elseif &filetype == "vim"
        exec('colorscheme '.g:my_vimrc_colorscheme)
        redraw | echo "colorscheme ".g:my_vimrc_colorscheme
    else
        exec('colorscheme '.g:my_fav_colorscheme)
        redraw | echo "colorscheme ".g:my_fav_colorscheme
    endif
endfunction

augroup vimrc
    au!
    " Simple example autocommand:
    " au BufEnter *
    "     \ :echo "<^.^> Entered a buffer. <^.^>"
    " matchstr() returns "" if there is no match.
    au BufEnter *
        \   if matchstr(@%,"notes_for_update") == "notes_for_update"
            \ | exec('colorscheme '.g:my_notes_colorscheme)
            \ | redraw | file
        \ | elseif &filetype == "markdown"
            \ | exec('colorscheme '.g:my_md_colorscheme)
            \ | redraw | file
        \ | elseif &filetype == "c"
            \ | exec('colorscheme '.g:my_c_colorscheme)
            \ | redraw | file
        \ | elseif &filetype == "asm"
            \ | exec('colorscheme '.g:my_disassembly_colorscheme)
            \ | redraw | file
        \ | elseif &filetype == "vim"
            \ | exec('colorscheme '.g:my_vimrc_colorscheme)
            \ | redraw | file
        \ | else
            \ | exec('colorscheme '.g:my_fav_colorscheme)
        \ | endif
        \ | call HiReadonlyStatusLine()
        \ | if &filetype == "python"
            \ | syn match pythonTodo  />\^\.\^</
            \ | syn match pythonTodo /<\'\.\'>/
        \ | endif
                " Fence the fruits of TDD with bright happy cat faces.
                " The 'syn match ptyhonTodo' is what makes the faces bright.
                    "Example:
                    " #   >^.^<     >^.^<    >^.^<    >^.^<    >^.^<  
                    " #---BEGIN - Code covered by the above tests---
                    " def function_covered_by_TDD():
                    " ...
                    " def another_function_covered_by_TDD():
                    " ...
                    " #---END - Code covered by the above tests---
                    " #  <'.'>    <'.'>    <'.'>    <'.'>    <'.'>  
    " au BufLeave *
    "     \ if matchstr(@%,"notes_for_update") != ""
    "         \ | exec('colorscheme duoduo')
    "     \ | endif
    au DirChanged * :call CscopeAddExisting()
        " use <afile> to get the new directory name
        " use pattern "global"?, see :h autocmd-patterns
        " Need to do more testing, but for now this is working!
    au BufEnter *.abc :call RemoveAllDistractionsFromScreen() | :call MapAbcSlideKeys()
    au BufLeave *.abc :call RestoreAllDistractionsToScreen() | :call UnmapAbcSlideKeys()
augroup END
function! RemoveAllDistractionsFromScreen()
    "echomsg "Remove all the distractions."
    " Unfold all folds.
    normal! zRgg
    " Save all settings before changing them.
    let s:old_colorcolumn       = &colorcolumn
    set colorcolumn=0
    let s:old_list              = &list
    set nolist
    let s:old_noruler           = &ruler
    set noruler
    let s:old_number            = &number
    set nonumber
    let s:old_relativenumber    = &relativenumber
    set norelativenumber
    let s:old_cursorline        = &cursorline
    set nocursorline
    let s:old_foldlevelstart    = &foldlevelstart
    set foldlevelstart=99
    let s:old_laststatus        = &laststatus
    set laststatus=0
endfunction
function! RestoreAllDistractionsToScreen()
    "echomsg "Restore distractions to screen."
    let &colorcolumn    = s:old_colorcolumn
    let &list           = s:old_list
    let &ruler          = s:old_noruler
    let &number         = s:old_number
    let &relativenumber = s:old_relativenumber
    let &cursorline     = s:old_cursorline
    let &foldlevelstart = s:old_foldlevelstart
    let &laststatus     = s:old_laststatus
endfunction
function! MapAbcSlideKeys()
    "echomsg "Map PageUp, PageDown, Space, Left, and Right."
    nnoremap <silent> <PageUp> :bprevious<CR>
    nnoremap <silent> <PageDown> :bnext<CR>
    nnoremap <Space> :call Make_NAME_KEYS_FromUserInput('')<CR>
        " Press <Space>
            " You are prompted to enter a name.
            " This calls cryptotunes.py on the name.
            " Vim reads in the NAME and KEYS.
            " Now you can press the arrow keys to see the animation.
        "May need to wrap in call to inputsave() and inputrestore() if you add
        "to the <Space> mapping.
    nnoremap <silent> <Left> :call StepThroughName('Left')<CR>
    nnoremap <silent> <Right> :call StepThroughName('Right')<CR>
endfunction
function! UnmapAbcSlideKeys()
    "echomsg "Unmap PageUp, PageDown, Space, Left, and Right."
    nunmap <PageUp>
    nunmap <PageDown>
    nunmap <Space>
    nunmap <Left>
    nunmap <Right>
endfunction
" TODO(sustainablelab@gmail.com):
"   Make 'duoduo' a variable if I want to change schemes.
" What is @% ?
" See :h expr-register or :h @r
" Examples:
" echo expand("%")
" does the same thing as
" echo expand(@%)


"  The only schemes that work are the ones that set t_Co=256.
"  So far all the schemes that do not do that, I am setting it here.
"
"  Colors do not work well with PowerShell.
    "  Setting color must be possible since
    "   <Alt><Space>p -> Color
    "  provides an RGB input that is functional.
    "  See this link:
    "  http://www.leeholmes.com/blog/2008/06/01/powershells-noble-blue/
    "  Vim mysteriously affects this color!
"  This is useful to try color-coding unit test output from C itself.
    "  Here is an amazing summary about terminal colors:
    "  https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
    "  C:
    "  printf("\033[31;1;4mHello\033[0m");
    "  Python:
    "  print("\033[31;1;4mHello\033[0m")
    "  Bash:
    "  echo -e "\033[31;1;4mHello\033[0m"
        "  31   -   make text red
        "  1    -   bold
        "  4    -   underlined
        "  0    -   clear (all attributes off)
" At this point I went down a deep rabbit hole comparing the values of the
" terminal options depending on how I started Vim.
    "  Important codes for the info below:
        "   2 - Faint (decreased itensity)
        "  38 - Set foreground color
        "  39 - Default foreground color
        "  48 - Set background color
        "  49 - Default background color
    "  See :h terminal-output-codes
    "  Query the terminal-options with :set termcap
    "  Query any single option with :set {option}
    "       :set t_op
    "       t_op=^[[39;49m
    "       So t_op is resetting to the default colors, but what are they?
    "  See :h :hi-normal-cterm
    "       :set t_8f
    "       t_8f=^[[38;2;%lu;%lu;%lum
    "       :set t_8b
    "       t_8b=^[[48;2;%lu;%lu;%lum
    "       These are very strange values.
    "  To see what is going on:
    " PS> vim -u DEFAULTS   -   Run vim with defaults.vim instead of .vimrc.
        " :redir @+ | set termcap | redir end
        " Paste below and pull out color-related stuff.
        " Use this macro:
        "   let @b='viwsyENct-^V0^Ijk'
        "   When you paste it at the command line, you'll need to replace the ^V
        "   and ^I with the keystrokes <C-b><C-v> and <C-b><Tab>
        "   Place the cursor on the option name and hit @b.
        "   The macro pops down to the pasted termcap output,
        "   pops back up to the option name and pastes in the value.
        " Place the cursor on the option name, then hit '@a'
        " t_AB=^[[4%p1%dm   -   set background color (ANSI)
        " t_AF=^[[3%p1%dm   -   set foreground color (ANSI)
        " t_Co=8            -   number of colors
        " t_me=^[[0m        -   Normal mode (undoes t_mr, t_mb, t_md and color)
        " t_op=^[[39;49m    -   reset to original color pair
        " t_Sb=             -   set background color
        " t_Sf=             -   set foreground color
        " t_ut=             -   clearing uses the current background color
        " t_RF=             -   request terminal foreground color
        " t_RB=             -   request terminal background color
        " t_8f=             -   set foreground color (R, G, B)
        " t_8b=             -   set background color (R, G, B)
        " t_SC=             -   set cursor color start
        " t_EC=             -   set cursor color end
        " set cursor color:   t_SC  {color name}  t_EC
    " $ vim   -   Run vim with .vimrc from mintty
        " :redir @+ | set termcap | redir end
        " Paste below and pull out color-related stuff.
        " Use this macro:
        "   let @b='viwsyENct-^V0^Ijk'
        "   When you paste it at the command line, you'll need to replace the ^V
        "   and ^I with the keystrokes <C-b><C-v> and <C-b><Tab>
        "   Place the cursor on the option name and hit @b.
        "   The macro pops down to the pasted termcap output,
        "   pops back up to the option name and pastes in the value.
        " t_AB=^[[4%p1%dm   -   set background color (ANSI)
        " t_AF=^[[3%p1%dm   -   set foreground color (ANSI)
        "!t_Co=256          -   number of colors
        "!t_me=^[[m         -   Normal mode (undoes t_mr, t_mb, t_md and color)
        "!t_op=^[[39;49m    -   reset to original color pair
        "!t_Sb=^[[4%dm      -   set background color
        "!t_Sf=^[[3%dm      -   set foreground color
        "!t_ut=y            -   clearing uses the current background color
        "!t_RF=^[]10;?^G    -   request terminal foreground color
        "!t_RB=^[]11;?^G    -   request terminal background color
        "!t_8f=^[[38;2;%lu;%lu;%lum -   set foreground color (R, G, B)
        "!t_8b=^[[48;2;%lu;%lu;%lum -   set background color (R, G, B)
        "!t_SC=^[]12;   -   set cursor color start
        "!t_EC=^G   -   set cursor color end
        "This all begs the question, what are the values used for %p, %d, %lu,
        "etc.
    " PS> vim   -   Run vim with .vimrc.
        " :redir @+ | set termcap | redir end
        " Paste below and pull out color-related stuff.
        " Use this macro:
        "   let @b='viwsyENct-^V0^Ijkj0ww'
        "   When you paste it at the command line, you'll need to replace the ^V
        "   and ^I with the keystrokes <C-b><C-v> and <C-b><Tab>
        "   Place the cursor on the option name and hit @b.
        "   The macro pops down to the pasted termcap output,
        "   pops back up to the option name and pastes in the value.
        " t_AB=^[[4%p1%dm   -   set background color (ANSI)
        " t_AF=^[[3%p1%dm   -   set foreground color (ANSI)
        "!t_Co=256  -   number of colors
        " t_me=^[[0m    -   Normal mode (undoes t_mr, t_mb, t_md and color)
        " t_op=^[[39;49m    -   reset to original color pair
        " t_Sb= -   set background color
        " t_Sf= -   set foreground color
        " t_ut= -   clearing uses the current background color
        " t_RF= -   request terminal foreground color
        " t_RB= -   request terminal background color
        " t_8f= -   set foreground color (R, G, B)
        " t_8b= -   set background color (R, G, B)
        " t_SC= -   set cursor color start
        " t_EC= -   set cursor color end
        "This all begs the question, what are the values used for %p, %d, %lu,
        "etc.
        "The only difference between calling Vim from PowerShell with and
        "without my .vimrc is the t_Co=8 and t_Co=256.
        "Another interesting thing is that if I manually set the colors in the
        "PowerShell once, Vim does NOT reset the background color to grey!
    "  Try t_8f and t_8b to set terminal foreground/background colors?
    "
"  Only use Vim from Cygwin (mintty.exe).
"  Colors work right from Cygwin. Or from Ubunutu (VirtualBox). 

" Vim colors are here:
" C:\cygwin64\usr\share\vim\vim80\colors

" Put new colors in C:\cygwin64\home\Mike\.vim\colors
" Create that folder if it does not exist!
"
" Source for awesome colors:
"   vimcolors.com/?page=1
"







" Show relative line numbers, cursor is always on line 0.
" set norelativenumber " I thought I preferred absolute line numbers...
" If you think you need absolute numbers to follow up with test/build reports
" remember you can quickly goto line 27 with
"   :27
" or
"   27gg
" and cycle back through your most recent edits with
"   g;
" With both 'number' and 'relativenumber' set,
" the line with the cursor shows the absolute line number.


" Logic for shorcuts to copy paths:
" start with <leader> 
"
" one letter:
" f - filename
"
" two letters
" first letter:
" w - WindowsPath
" p - PosixPath
" second letter:
" p - full file path (%:p forces % to expand)
" h - folder path (h is for head)


" Shortcut to run executable built from C/C++ with same name.
"   nnoremap <leader>c :!"%:r".exe


" The ceedling alias is not picked up when I start Vim.
" The 'ceedling' alias runs 'ceedling.bat'.
" Use :! echo $0 to find out which shell is used
" and to see if the .bashrc executes (displays '.bashrc just ran').
"
" Do not do this:
" set shellcmdflag=-ic
"
" Googling 'vim cygwin shell rc' I found this:
" https://groups.google.com/forum/#!topic/vim_use/xvQLzA2Aqis
"
" With some modification, the idea works.
"
" So there are three options to run Ceedling from Vim in Cygwin.
" The last is my favorite.
" 1. Run in an interactive shell
"     :!ceedling
"  Exit the interactive shell session:
"     $ fg
"  The -i keeps the interactive session live after the job is finished.
" let &shell='/usr/bin/bash --rcfile ~/.bashrc -i'
"
" 2. Traditional: pop out to an interactive shell, pop back.
"     :sh
"     $ ceedling
"  Exit the interactive shell session:
"     $ exit
"  This relies on the 'let &shell=' tweak.
"  It is just like the first method.
"  The only difference is that the ceedling commands
"  are done at the bash shell instead of the Vim command line.
"
" 3. Use a <leader> shortcut to run ceedling.bat.
"     ;c
"  The shell displays the result and waits for ENTER to return to Vim.
"     This is my favorite approach so far.
"     And it works without the 'let &shell=' tweak above.
" nnoremap <leader>cc :!/cygdrive/c/Ruby23/bin/ceedling.bat
" nnoremap <leader>c :!clear; /cygdrive/c/Ruby23/bin/ceedling.bat clean; /cygdrive/c/Ruby23/bin/ceedling.bat test:all<CR>


" Abbreviations.
" Never write the Python shebang again.
" This is actually kind of annoying...
" I'd like it to work that CTRL-] is the only 
iabbrev ppp #!/usr/bin/env python<CR># -*- coding: utf-8 -*-
iabbrev ttt TEST_FAIL_MESSAGE("Implement test.");<CR>

" Tabs! See: http://tedlogan.com/techblog3.html
" set expandtab: Pressing Tab key inserts spaces.
" set noexpandtab: Pressing Tab key inserts tabs.
" tabstop: Number of columns to display per tab (affects view, not input).
" shiftwidth: Number of columns to indent with << and >>.
" softtabstop: Number of columns to indent in insert mode.
" If expandtab is set (i.e., using spaces not tabs),
" then pressing tab in insert mode inserts spaces to align to softtabstop.

" Auto-indentation!
" File-type dependent changes to indentation rules:
" See: http://vim.wikia.com/wiki/Indenting_source_code


" Show spaces and tabs, do not show end-of-line.
" Damian Conway: how to use unicode characters for showing whitespace.
"   https://youtu.be/aHm36-na4-4?t=7m58s
" The trick was to call 'set' with 'exec' to recognize \uB7.
" exec {blah} executes {blah} as an Ex command.
" \uB7 is the middle dot
" You can type this insert mode with: <Ctrl-K>.M
" You can see this in Ex mode with:
"   
"    :echo "\uB7"<Enter>
" (You should see a middle dot echoed).

" Another way to see a middle dot is to use nr2char.
"   
"   echo(nr2char(183))
" (You should see a middle dot echoed).



" Query the highlighting group names and their settings with:
"   :hi[hglight]
" (This is a big list!)
"
" Query just one group, e.g.:
"   :hi Ignore
" Ghost out all the comments:
"   :hi! link Comment Ignore
" Bring them back:
"   :hi! link Comment Comment
" And from :help listchars, the NonText and SpecialKey groups affect
" whitespace:
"
"   The "NonText" highlighting will be used for "eol", "extends" and
"   "precedes".  "SpecialKey" for "nbsp", "space", "tab" and "trail".
"   |hl-NonText| |hl-SpecialKey|
"
" So toggle whitespace off (just barely visible):
" hi! link SpecialKey Ignore
" And back on:
" hi! link SpecialKey SpecialKey


" Markdown
" --------
" Check which languages can be 'fenced' in markdown:
" :let g:markdown_fenced_languages
" 
" Example of fencing a code block in a .md document:
" ```python
" def python_function():
"     print("This is a Fenced CodeBlock.")
" ```
" Set syntax highlighting for vim, python, and c.
let g:markdown_fenced_languages = ['vim', 'c', 'python', 'make']
" Learn Markdown:
" https://guides.github.com/features/mastering-markdown/

" ---Plugins---
    " git clone single plugins here:
    "   C:\cygwin64\home\Mike\.vim\pack\bundle\start
    " I do not use a plugin manager
    " I install plugins manually as explained here:
    " :h packages
        " Context:
            " A Vim package is a directory that contains one or more plugins.  Vim
            " files are in the "~/.vim" directory.  Vim scans 'packpath' for plugins
            " under the "pack/*/start" directory.  Packages should have a "start"
            " directory in them. The folder above this is up to the user to name
            " whatever they like.
        " Using a package and loading automatically
            " $ mkdir -p ~/.vim/pack/foo
            " Place a plugin package in the 'pack' folder:
            " $ cd ~/.vim/pack/foo
            " ...You downloaded the package as a .zip to your /tmp/ folder...
            " $ unzip /tmp/foopack.zip
            " Vim finds
            "         "pack/foo/start/foobar/plugin/foo.vim"
            " and adds 
            " " ~/.vim/pack/foo/start/foobar" to 'runtimepath'.
        " Using a single plugin and loading it automatically
            " $ mkdir -p ~/.vim/pack/foo/start/foobar
            " $ cd ~/.vim/pack/foo/start/foobar
            " ...You downloaded the single plugin as a .zip to your /tmp/ folder...
            " $ unzip /tmp/someplugin.zip
    " Also see this StackOverflow on Vim packages in Vim 8+:
        " https://vi.stackexchange.com/questions/613/how-do-i-install-a-plugin-in-vim-vi
        " Search: /Version 8 introduces a new packages mechanism 
        " mkdir -p ~/.vim/pack/bundle/start/
        " cd ~/.vim/pack/bundle/start/
        " git clone https://github.com/tpope/vim-sensible.git

    " Following the above method, I have installed plugins.
    " The plugins are older? so they do not follow the Vim 8+ path format.
    " I placed them all in the ~/.vim/pack/bundle/start/ folder by git cloning
    " there.
        " vim-markdown
        " NERDTree
    " Also see this on runtimepath, though it is now out-dated:
        " https://howchoo.com/g/ztmyntqzntm/how-to-install-vim-plugins-without-a-plugin-manager
        " :set runtimepath?
            " Result:
            " > runtimepath=
            " > ~/.vim,~/.vim/pack/bundle/start/vim-markdown,
            " > /usr/share/vim/vimfiles,
            " > /usr/share/vim/vim80,
            " > /usr/share/vim/vimfiles/after,
            " > ~/.vim/after" ~/.vim,
            " > /usr/share/vim/vimfiles,
            " You should not have to edit runtimepath manually.
            " Vim will automatically find the plugin, e.g., vim-markdown.
        " If you do need to edit the runtimepath:
            " Prepend path with:
            " set runtimepath^=~/.vim/pack/bundle/start/blah

" Read the Vim Quick Start Manual.
" Left at Section 4.2 Substitute
" Flow:
" Learning Vim while working is too distracting.
" Anytime there is a new command to jot down to learn,
" or something not working, or an idea or an improvement,
" just come here with ;ev<CR>G and add it below.


" ---CHEAT SHEET----
"---Range---
    " http://vim.wikia.com/wiki/Ranges
":h indent - indent({lnum}) - Return a number with the indent of line {lnum}
    " Use this in your key mapping that indents pasted text based on the
    " indentation of the line above.
"
    "
    " :h modeline - how to modify setting in single files
        " /* vim: set ai tw=75: */
        " /* Vim: set ai tw=75: */
        " First format is:
            " [text]{white}{vim:|ex:}[white]{options}
            " [text] is any text or empty
            " {white} at least one blank space
            " [white] optional white space
            " {options} a white-space-separated-list of option settings
            "        or a ':'-separated-list of options settings
            "        where each part between ':' is the argument for
            "        a ":set" command (can be empty)j
            " |Here is a common example at the end of a section from Vim help:
            " | vim:tw=78:ts=8:ft=help:norl:
            " |Note the leading space and the ':'-separated list
            " For example, to actually call ft=help, you would do:
            " :set filetype=help
            " But because this is the special modeline format, you do:
            " :filetype=help:
        " Second format is:
            " [text]{white}{vim:|Vim:|ex:}[white]set {options}:[text]
            " [text] is any text or empty
            " {options} white-space-separated list of options which are
            " arguments for the ":set" command.
            " |Examples:
            " | vim: set filetype=help textwidth=75:
            " |/* vim: set ai tw=75: */
        " Options are set like with :setlocal, i.e., the new value only applies
        " to the buffer and window that contain the file.
        "
    ";so    -   source current file
        "       only works for Python and Vim at the moment.
        "       This is handy to test out a bit of vimscript.
        "       Just open a new file, enter commands, and hit ;so.
        "       For python scripts, this just calls asks the shell to run the
        "       current file, i.e., it calls: "!./%"
    ";ab    -   list abbreviations
    ";rh    -   refresh highlighting
    ":sy[ntax]  -   display all highlight groups for the active buffer
    ";sh    -   open an example buffer showing all highlighting groups
        " :h filetype   -   use a modeline to tell Vim which filetype syntax
        "                   higlighting to use (e.g., nerdtree for a .txt).
    "---Troubleshooting syntax highlighting
        ":syntime   -   return time for each group
        ":syntax sync fromstart -   :h :syn-sync-first
    ";sh    -   display all the highlight groups in a new split
    ":set readonly      -   change to readonly
    ":set noreadonly
    ":tab help help     -   open 'help help' in new tab
"   :@  -   repeat previous command-line command
"   :h fo-table -   -r -o - Automatically insert the comment leader
"   :ve  -   show what features are included in your Vim installation
"   ;pwd    -   like :pwd but clipboard pastes the output on the next line
"   [x] :vne<CR><C-w>r -   is there a shorter command for this?
"       If not, make a short cut.
"       I changed the default split behavior to split right.
"   :enew   -   Clear the active window without losing the split.
"               This does nothing to the buffer that was in the window.
"               Hop back to it with :b#.
"---command-line-range---
    " see :h :range
    " Folding state affects the result of the yank.
    " :.3y          -   yank line 3 lines below this line
    "
    "               This does not work if there is fold between '.' and the
    "               line you want to yank. Instead you also pick up what is
    "               in the fold, and the relative numbering is thrown off.
    "
    "       ---Solution--- use the absolute line number:
    " :set norel<Tab><CR> :3590y<CR> :set rel<Tab><CR>
    " [ ] Create a key mapping to move to the line, copy and hop back.
    "
    " :3,5y         -   yank lines 3 to 5
    " :+3,+5y       -   yank lines 3 to 5 below this line
    " :-5,-3y       -   yank lines 5 to 3 above this line
    " :-9y|-1pu     -   yank line 9 lines above this line and paste on the
    " current line
"---command-line-range---
    " see :h :range
    " Folding state affects the result of the yank.
"---Cygwin ls---
    " $ ls -A                       -   list all except '.' and '..'
    " $ ls -Ap                      -   show folders with '/' suffix
    " $ ls -A1p                     -   list in 1 column
    " $ ls -A1p --col               -   colorize
    " $ ls -A1p --col | grep /      -   list directories only
    " $ ls -A1p --col | grep -v /   -   list files only
"---Tabs---
    "1tabedit   -   open a new tab after tab 1.
    "               Example:
    "               Two tabs are open.
    "               You wish to open a third tab, placed between the two.
    "1tabmove   -   move the current tab after tab 1.
    "               Example:
    "               Three tabs are open.
    "               You realize you wanted tab 3 in the middle.
    "               Call this from tab 3.
"---Insert mode---
    " :h ins-special-keys
    " i_<C-r>=  -   Insert special stuff!
        "           Cool example: paste the pwd in one command!
        "           you are in insert mode
        "           <C-r>=
        "           you are now at the command linewith an 
        "           execute('pwd')
        "           the output :pwd is pasted!
    " i_<C-a>   -   Insert previously inserted text.
        "           Practical example:
        "           You have some headings such as:
        "           " Window navigation:
        "           " Window movement:
        "           " Terminal window:
        "           And you decide you'd rather the headings use '---':
        "           "---Window navigation---
        "           Place the cursor on the 'W' in the first heading.
        "           " [W]indow navigation:
        "           Backspace to erase the space, then '---', then exit.
        "           So you have this:
        "           "---Window navigation:
        "           Now 'A' to append to the end of the line.
        "           "---Window navigation:[]
        "           <C-a> to repeat the previous edit.
        "           "---Window navigation---
        "           Repeat for the other headings. For example:
        "           " [W]indow movement:
        "           i_<C-a>jk
        "           "---Window movement:
        "           A
        "           "---Window movement:[]
        "           i_<C-a>jk
        "           "---Window movement---
    " i_<C-w>   -   Delete the word before the cursor.
    " i_<C-u>   -   Delete all entered characters before the cursor in the
    "               current line.
"---Search---
    " // or ??  -   repeat last search
    " * -   forward search for the word nearest to the cursor.
    " # -   backward search for the word nearest to the cursor.
" :@:       -   repeat last command
"---Window navigation---
    " <A-w>hjkl -   these are OK, but it's much faster to use:
    " <A-w>t    -   top left (NERDTree -- echoes nicely of ;nt)
    " ;wt
    " <A-w>b    -   bottom right
    " <A-w>p    -   previous window
    " ;ww (;wp is already taken for Windows Path)
    " <A-w>P    -   go to preview window (quickfix)
    " <A-w>1w   -   first window
    " <A-w>2w   -   second window
    " etc.
"---Window movement---
    " <A-w>HJKL -   these are OK, but more commonly useful are:
    " <A-w>x    -   swap with next window in the current row or column
    "               places cursor in the swapped window.
    " <A-w>r    -   rotate window layout in the current row or column
    " <A-w>T    -   move a window to its own new tab
"---Terminal window---
    " <A-w>:    -   get to the Vim command line.
    "               In a terminal window, all Vim commands must be preceded with
    "               <C-W> or 'termkey'.
" Development:
" ;nb   -   Tab through bookmarked projects.
" NERDTree cd   -   change Vim current directory to node under cursor
" ;mk   -   Run make.
" ;mc   -   Run make clean.
" ;nr   -   Refresh NERDTree.
" ;wt   -   Go to top left window (NERDTree window)
" ;mt   -   Run make, if OK, run unittest suite.
" ;te   -   Run unittest suite.
" ;wb   -   go to bottom right window (Terminal window)
" ;ww   -   go back to previous window
" ;yt   -   Add test name to test runner.
" ;cclose   -   close quickfix
" ;<A-w>z   -   close preview (quickfix)
" <C-]> -   jump to definition of function under cursor
" <C-t> -   jump back
" <A-w>}    show definition of function under cursor in preview window
"---Plugin: Tabulous---
    " If you start another tab, name this project development tab.
    " Open the project Makefile and from it as the active buffer hit ;gn
    " The label is now the project name!
    " Switch tabs with the Makefile as the active buffer.
        " :TabulousRename <string>
        " Example:
        " :TabulousRename HelloUnity
        " To do this automatically, pick a file in the project root, like the
        " Makefile.
        " Invoke :TabulousRename with the Makefile buffer active.
        " :TabulousRename <C-r>=expand("%:p:h:t")
        " The <C-r> is not typed, it is the key combination Ctrl-r.
        " This is mapped to ;gn
" Finding files:
"   If the file is somewhere below the current directory:
"   find **/start-typing-file-name-hit-tab-anytime
" Tag-hopping:
"   Run ctags to generate tags.
"   $ ctags -R .
"   <C-]>   -   Jump to the definition of the tag.
"   <C-o>   -   Jump back to the original buffer.
"   <C-w>]  -   Open the tag in a split window.
"   <C-w>}  -   Open the tag in the preview window.
"   <C-w>z  -   Close the preview window.
"   i_<C-x><C-o>    -   Omni-completion (uses tags to complete).
"                       This also opens up a preview window with information
"                       about the function.
"   Preview window:
" Text wrapping:
    " ;gq   -   toggle word-wrap (a.k.a. soft-wrapping)
    " v_gq  -   hard-wrap selected text
    " gqq   -   hard-wrap this line
    " gq}   -   hard-wrap to the end of the paragraph.
    "           Note that a blank line marks a paragraph, but the blank line
    "           cannot even contain whitespace! If it does, it does not count as
    "           a paragraph delimiter.
    " Unwrap:
    " J     -   undo a hard-wrap by rejoining lines.
    "           This is useful when pasting a file path.
    "           Vim breaks the path at spaces.
    "           Use J to rejoin the path onto a single line.
" Create a macro.
    " q{register} to start recording to a register.
    " q to stop recording.
    " All key strokes in between are recorded.
    " View the register with:
    " :reg {register}
    " or
    " :dis {register}
    " In insert mode, dump the literal contents with:
    " <C-r><C-r>{register} (two <C-r> make it a literal paste).
    " Run the macro with @{register}, and then @@ to repeat.
    " Run the macro N times with N@{register}.
    " Combine macros to run by a creating a function to call the N@{register}
    " keystrokes. See CleanExpandedIncludes() for an example.
" PowerShell:
    " Update-Help   -   Download help (Admin mode)
    " Get-Help {cmdlet} -   Help
    " Get-Help {cmdlet} | less  -   PgUp/Dn scroll through help
    " ls is an alias for cmdlet Get-ChildItem
        " Get-Help ls | less
        " Attributes: Directory, File, Hidden, ReadOnly, System
        " ls -Directory -   only list directories
        " ls -File      -   only list files
        " ls -System    -   only list System files
        " ls -ReadOnly  -   only list ReadOnly files
        " Create a complex attribute search with Attributes.
        " Get-Help ls -Detailed | less
        " See PARAMETERS -Attributes
            " attributes:   Archive, Compressed, Device, Directory, Encrypted,
            "               Hidden, Normal, NotContentIndexed, Offline,
            "               ReadOnly, ReparsePoint, SparseFile, System,
            "               Temporary
            " abbreviations:
            " d -   Directory
            " h -   Hidden
            " r -   Read-only
            " s -   System
            " ls -att   -   abbrev. for Get-ChildItem -Attributes
            " Use the attributes parameter to do logical combinations other than
            " AND.
            " ! NOT
            " + AND
            " , OR
            " ls -att !d    -   only list files
            " Even shorter form: ls -af
            " But to do a logical OR of directories and hidden files, you need
            " attributes:
            " Get-ChildItem -Attributes Directory,!Directory+Hidden
            " Abbreviated form:
            " ls -att !d,!d+h
            " ls -af "*.txt -   only list .txt files
            " -n    -Names
            " ls -n -   only list names
            " ls -af -n -   only list names of files
            " ls -ad -n -    only list names of directories
            " -i    -Include    -   not sure what this does
        " Get-Help ls -examples | less
        " ls -ad    -   list directories only
        " ls -att d -   list directories only
        " ls -af    -   list files only
        " ls -att !d    -   list files only
        " Get-ChildItem -Attributes Directory
        " ls -att d
" Windows:
    " Ctrl+Shift+Esc    -   Task manager
    " Win+x, i          -   PowerShell
    " Win+x, a          -   PowerShell in Administrator mode
" f.lux:
    " Alt+Shift+PgUp/Dn -   Color temperature
    " Alt+PgUp/Dn       -   Brightness
" Cygwin:
    "   $ tree | less
    "   Turn on Ctrl+Shift+letter shortcuts
    "   Note these are all Ctrl+Shift+letter.
    "   Instead of writing S or Shift, I put the letter in caps.
    "   I typically start with <C-F><C-O><C-+><C-+><C-+><C-+>.
    "   <C-F>   -   Toggle full-screen.
    "   <C-O>   -   Toggle scroll-bar visibility.
    "   <C-+><C-->  -   Zoom +/-
    "   <C-=>       -   Also works for Zoom +
    "   <C-V>   -   Paste from clipboard.
    "   $ history   -   view numbered list of previous commands.
    "   $ !{number} -   rerun command {number}.
    "   $ ls -p | grep -v / -   only list files
    "   <C-T>       -   Increase transparency (wraps around to 0% again).
        "   This is neat for having a shell to run build commands that is a
        "   little transparent so that when you Alt-Tab from the code to this
        "   shell, you can still kind of see your code. Use 1 or 2 levels of
        "   transparency. More than this and it's hard to read the text.
    "   <C-I>   -   Switch mintty terminal sessions.
        "   I like Alt-Tab more to toggle quick between two sessions. But if
        "   there were several sessions each with directories I cared about, the
        "   session switches is nice because it lists them all for you with
        "   their directories.
    "   <C-TAB> -   Ctrl-Shift-Tab: cycle between Cygwin mintty terminals.
        "   This is like Alt-Tab cycling, except it only goes between Cygwin
        "   mintty terminals.
    "   <C-P>   -   Toggle the cursor type.
    "   <C-S>   -   Toggle text visible/invisible.
        "   Neat if you have transparency on and at a high setting.
        "   Also gives you a quick glimpse at the other Cygwin mintty session.
        "   Pressing any key snaps you back to the session where you hit <C-S>.
    "   <C-N>   -   Open a new window session.
        "   The new session opens in the original directory that this session
        "   started in (like going back to PowerShell and doing another 'mintty').
    "   <C-W>   -   Close the window.
    "   <C-R>   -   Clear the screen.
        "   This has a wacky feeling in Vim: text goes invisible until your
        "   cursor passes over it. Use <C-l> to redraw the Vim screen.
        "   At the bash shell, a screen clear makes more sense.
    "   <C-A>   -   Swap foreground and background colors on everything.
        "   This is a great way to quickly check if text is colored or not.
        "   If colored, the color becomes its background.
    "   <C-H>   -   Pull up a search bar. Type text.
        "   Press enter to cycle through results (like 'n').
        "   Shift-enter to cycle back (like 'N').
        "   <Tab> to switch back to shell prompt.
        "   <Esc> to close the search bar.
" C highlighting and folding options:
    " :h ft-c-syntax
" Latest awesome motions:
" ;,    -   Repeat latest f, t, F or T
"           It's only followed by ',' because I use ; as my leader.
" ,     -   Same as ; but in the opposite direction.
" ge    -   like hitting bbe - puts you at the end of the previous word
" What is a sentence, paragraph, section?
" ( sentence back, ) sentence forward
    " A sentence is defined as ending at a '.', '!' or '?' followed by either
    " the end of a line, or by a space or tab.  Any number of closing ')', ']',
    " '"' and ''' characters may appear after the '.', '!' or '?' before the
    " spaces, tabs or end of line.  A paragraph and section boundary is also a
    " sentence boundary.
    " The definition of a sentence cannot be changed.
" { paragraph back, } paragraph forward
    " :set paragraphs?  -   See :h paragraphs
    " To redefine what a paragraph is, learn about nroff macros.
    " A paragraph begins after each empty line, and also at each of a set of
    " paragraph macros, specified by the pairs of characters in the
    " 'paragraphs' option.  A section boundary is
    " also a paragraph boundary.  Note that a blank line (only containing
    " white space) is NOT a paragraph boundary.
    " Also note that this does not include a '{' or '}' in the first column.
    " When the '{' flag is in 'cpoptions' then '{' in the first column is used
    " as a paragraph boundary |posix|.
" ]] section forward, [[ section backward
    " A section begins after a form-feed (<C-L>) in the first column and at
    " each of a set of section macros, specified by the pairs of characters in
    " the 'sections' option.  The default is "SHNHH HUnhsh", which defines a
    " section to start at the nroff macros ".SH", ".NH", ".H", ".HU", ".nh"
    " and ".sh".

" ;fn   -   copy file name to clipboard
" ;fid  -   start a search that ignores '.'
    " For use in netrw to ignore filenames starting with '.'.
" Spelling:
    " My vimrc turns on spelling in us_en. Turn off with :setlocal nospell
    " [s    -   go to previous misspelled word
    " ]s    -   go to next misspelled word
" Put new colors in C:\cygwin64\home\Mike\.vim\colors
" Copy command output to a register:
    " redir @a | set path? | redir END
    " And to copy a command input, you could redirect an echo:
    " redir @b | echo "redir @a | set path? | redir END" | redir END
    " But it is easier to just treat the command line as a buffer with
    "   :<C-f>
    " or
    "   q:
    " Then just yank the old command.
" Backblaze file recovery:
    " It is possible to recover a single file from backblaze!  Your drive is
    " updated very often.  It's easy to check file differences with vimdiff.  It
    " is possible to restore an older version of a file from backblaze too: Yes,
    " you pick the "To" date, then click "Go" to refresh the view.
    " See:
    " https://help.backblaze.com/hc/en-us/articles/217665868-Restoring-Deleted-or-Previous-Versions-of-Files
" :checkpath    -   Says which of the included files (in the active .c file) are
    "               not found in the path.
" Any <C-w> can be done with <A-w>
" ctags
    " Run ctags from the top level of the project:
        " It runs the same from PowerShell or Cygwin.  Since you are already
        " editing C code in Vim, it's probably easiest to open a terminal within
        " the Vim window (:term), call the command, then kill the terminal. If
        " you are already in the right folder you can just !ctags -R
    " $ ctags -R    -   This runs the Cygwin ctags: /usr/bin/ctags.exe
    " After running ctags:
    " There is one tags file with tags for the whole project.
        " Edit from the directory of the tags file.  Tag jumping only works if
        " the current directory is the folder of the tags file, i.e., after
        " calling :lcd %:p:h<CR> (;lcd) Otherwise Vim will not see the tags
        " file.
    " <C-w> }       -   opens a small window to view the function definition
    " i_<C-x><C-]>  -   auto-completion using tags
    " ;cd           -   Run this on the tags file so you can call
    "                   auto-completion from any window (e.g, a log.md that is
    "                   outside the project can still auto-complete with the
    "                   function names).
    " <C-]>         -   hop to the definition (uses the tags file)
    " %             -   on a #if line, hop to the matching #endif line
    " }             -   quickly hop to next blank line
    " gf            -   jump to filename under cursor (only works if the file is
    "                   in the path, same idea as getting auto-completion to
    "                   work).
    " <C-w><C-f>    -   Variant on 'gf' to open file in a split.
    " <A-w>f        -   Alternate key combination for <C-w><C-f>.
    " Bash navigation:
    "   $ blah='blah_path'
    "   $ echo $blah
    "   $ echo "$blah"      -   if blah_path has spaces
    "   $ cd -              -   navigate to previous directory
"
" i_<C-a>   -   repeats last paste?
" Highlight and search:
    " viws              -   search forward for the word under the cursor
    " viwS              -   search backward for the word under the cursor
    " Once the search starts, n continues in the direction you started, N in the
    " other direction, so if searching backward, n keeps going backward.
    " Search multiple words by highlighting with motion 'e'
    " v[count]e {s}{S}  -   highlight from cursor forward [count] words and
    "                       search forward or backward
" Ways to start editing a file:
    " :find main<Tab>   -   Wildmenu-select from all of the main.c files found
        "                   in the Vim path. Search in this .vimrc for:
        "                       "set path=.,/usr/include,,"
        "                   and query the path with:
        "                       :set path?
        " A lovely thing you can do is combine NERDTree with Vim's powerful
        " ":find" command to quickly get a file browser open on a particular
        " file. For example, let's browse the avr/include directory or wherever
        " stdint.h is located.
        "   :find stdint.h
        "   This works because I included avr/include in my Vim path so that
        "   'gf' would work.
        " then ;nf (n)ERDTree(f)ind to browse the directory of stdint.h,
        " then ;nt (n)ERDTree(t)oggle to hide NERDTree,
        " then :b# to go back to the buffer you called ":find stdint.h" from,
        " then ;nt to show the NERDTree again.
        " So the whole sequence was:
        "   :find stdint.h
        "   (View is now showing stdint.h as the current buffer)
        "   ;nf
        "   ;nt
        "   :b#
        "   ;nt
    " :tabe [file] - edit in new tab
    " ---File shortcuts--- 
        " ;en       -   edit notes_for_update
            " Then search for #active tasks.
        " ;ev       -   edit this .vimrc
        " ;ep       -   edit the PowerShell $PROFILE
        " TODO: replace the remaining file shortcuts with NERDTree bookmarks
        " ;er       -   edit /c/readme.md
        " ;el       -   edit the latest C project
        "               Nah, this is a silly way to work. Learn to use NERDTree
        "               bookmarks.
    " ---File browsing---
        " ;nt       -   toggle a tall-left NERDTree window.
        " ;nf       -   NERDTree explore the current buffer
        " ;nv       -   NERDTree explore the current Vim directory
        " Do not file browse with :e . anymore:
            " :e .      -   starts browsing the current Vim directory,
            "               but it replaces the view in the current buffer.
                " NERDTree replaced netrw as my default file browser.
                " This happens automatically when installing NERDTree.
                " netrw is still accessible with:
                " :Explore
                " Or any of its other commands like :Sex :Vex :Lex etc.
    " :e    [file] - edit, place new buffer in active view
    " :sp   [file] - edit in horizontal split
    " :new      -   open an empty horizontal split
    " :vs   [file] - edit in vertical split
    " :vnew     -   open an empty vertical split left of the active window
    " :rightb[elow] vnew    -   open an empty vertical split to the right
    " :vs .        - open file explorer in vertical split
    " <C-^> -   toggle between editing two files
    " :b#   -   toggle between editing two files (see :h ls)
    " :b {tab complete} -   switch to a buffered file using tab complete on the
    " file name.
    " :vs ., <Enter> with cursor on [file], <C-^> back to explorer
    " :vs ., v with cursor on [file]
    " :vs ., o with cursor on [file]
    " :Lex  -   netrw in vertical split and thrown left
        " :Sex  -   netrw in horizontal split
        " :Vex  -   netrw in vertical split
    " :vs<CR>:e .    -   NERDTree in vertical split
    " NERDTree:
        " ? -   Toggle between browsing and help.
        "       Help is actually the first part of the NERDTree browsing buffer,
        "       so you can also navigate between help and your browsing with the
        "       usual gg, G, <C-f>, <C-b>, j, k, zt, zb, etc.
        " The key mappings are also listed here:
        " :help NERDTreeMappings
        " ---Bookmarks--- VERY POWERFUL!!
        "                 No more mapping shortcuts to project folders!
        " Create bookmark:
        "   ;nt -   view the NERDTree
        "   :Bookmark           -   bookmark node under cursor
        "   :Bookmark [<name.]  -   bookmark with a custom name
        " Open bookmark:
        "   ;nt -   view the NERDTree
        "   :OpenBookmark <Tab> -   cycle through existing bookmarks.
        " B -   toggle view of Bookmarks (they are listed above the tree)
        " Use a bookmark to change the Vim current directory.
        "   ;nt
        "   :OpenBookmark <Tab> -   cycle through projects, open with <CR>
        "   cd      -   change Vim directory to opened project
        "   :pwd    -   check the directory changed
        "   :find <Tab> -   now you can find files here
        " Start Vim and immediately go to a project by its bookmark:
        " :NERDTreeFromBookmark DumbExample
        " ---Window control---
        " q -   close the NERDTree window
        " A -   maximize/undo-maximize the NERDTree window
        " --Start NERDTree---
        "  :e . -   place the explorer in the current window
        "  :NERDTree    -   same as :Lex for netrw
        " ---Browsing---
        " cd  - change the CWD to the selected dir (the node on the cursor line)
        "       This changes the Vim current directory.
        "       Check this:
        "       :pwd    -   print the Vim current directory
        "       Note that:
        "       :cd     -   also prints the Vim current directory, but has the
        "                   side effect of changing the directory.
        "                   If no directory is specified, it changes to ~
        "                   (home/Mike/).
        " C<CR> change the Tree root to the selected dir
        " u -   Complement to C: move the tree root up one dir
        " U -   Do u but leave that node open
        " o -   open & close node, open file in current window
        " O -   recursively open node
        " X -   Complement to O:
        "       close all child nodes of current node recursively
        " i -   open in horizontal split
        " s -   open in vsplit
        " I -   hidden files on/off
        " F -   files on/off
        " r -   refresh cursor dir
        " R -   refresh current root
        " ---Manipulating---
        " m -   menu for this node:
        "       (a)dd a childnode
        "       (m)ove the current node
        "       (c)opy the current node
        "       (d)elete the current node
        "       (l)ist the current node
        "       (!)Execute file (only for files)
        " :help NERDTree
        " :NERDTree [<start-directory> | <bookmark>
            " Use this as a sane way to bookmark important project folders.
            " [ ] python die design
            " [ ] python USB camera interface
            " [ ] LIS embedded code
            " NERDTreeFromBookmark <bookmark> to tab through bookmarks?
            "
    " Open files read-only:
    "   vim -R  -   All files will be read-only.
    "   :set ro -   Set the local buffer read-only.
    "   :view {filename}    -   Open {filename} read-only.
    " Use :x instead of ZZ. :x seems slightly easier to type.
    " :x    - Save and close window. Closes Vim if no other open windows/tabs.
    " :ls!  - List all buffers, even unlisted ones like the help window.
    " :ls a - List all active buffers.
    " :ls + - List all modified buffers (buffers with unsaved changes).
    " :ls # - List the alternate file (the <C-^> file).
" Change the active directory:
    " ;lcd      -   Change to the directory of the currently open file (%:p:h)
" Convert path type and paste below:
    " ;cw       -   converts POSIX path to Windows
    " ;cp       -   converts Windows path to POSIX
    " Start with a Windows path generated by PowerShell:
    "       PS> cd $mcu
    "       PS> (Get-Item -Path ".").Fullname | clip
    "  Paste that path into Vim: i_<C-v>+
    "  Place the cursor anywhere on the path
    "  ;cp  -   The POSIX path is pasted on the line below.
    " TODO(sustainablelab@gmail.com): paste so that the new path lines up with
    " the old. This will have to turn into a function, it cannot remain a
    " one-liner.
    " TODO(sustainablelab@gmail.com): smart version: If the cursor is on a blank
    " line, grab the path directly from the clipboard.
" Open Vim in diff mode:
    " $ vimdiff file1 file2
    " $ vimdiff file1 file2 -R      -   Open the files readonly.
    " Files open in split vertical windows.
    " Lines that are completely new in one file are highlighted blue.
    " In the other file, these missing lines are shown as blue dashes on a white
    " background.
    " Lines that are different are highlighted magenta.
    " On the magenta lines, any text that is not in both files is highlighted
    " red.
    " Folding is automatically temporarily set to 'diff' mode to make it easy to
    " navigate to the differences.
    " The two windows are scoll-locked.
" How to search with regex:
    " :[range]s[ubstitute]/{pattern}/{string}/[flags] [count]
    " Example: Search for 2/7/2018
        " /2\/7\/2018   -   Use \ to escape the /
    " Include any number of occurrence of a character:
        " /dif*     -   Finds 'di', 'dif', 'diff', 'difff', etc.
        " /dif\+    -   Finds 'dif', 'diff', 'difff', etc.
        " \%1c#     -   match '#' in first column
        " \_s       -   space
        " .*        -   any number of any character
    " Search for this OR that:
        " /Vim\|diff -   Find 'Vim' or 'diff'
        " /Vim\('s\|diff\)  -   Find "Vim's" or "Vimdiff"
        " /\cVim\('s\|diff\)  -   Find "Vim's" or "Vimdiff" and ignore case
        " /vim\('s\|diff\)  -   Find "Vim's" or "Vimdiff" and ignore case
    " Find any character that is not:
        " /[^a]     -   Any character that is not 'a'
        " /[^\.]    -   Any character that is not '.'
        " /[^\.]log -   Find log, not .log
        " The [] syntax defines a range. Anything can go in that range, e.g.:
        " /[a-d]    -   Any letters between a and g inclusive.
        " /[^a-d]    -   Any letters that are not between a and g inclusive.
        " But it might be faster to use the predefined ranges listed below.
    " Search for digits and letters:
        " /\h       -   Any 'A-Z', 'a-z', or '_'
        " /\w       -   Any 'A-Z', 'a-z', '0-9', or '_'
        " /\<\h\w*\>    Any "whole word" starting with:
        "               'A-Z', 'a-z', or '_'
        "               And followed by any number of
        "               'A-Z', 'a-z', '0-9', or '_'
        " /\<\h\w+\>    Followed by one or more \w
        " /\<\h\w\{3}\> Followed by exactly three \w
        " /\_a      -   Any alphabetic character.
        " \_ai      -   Any alphabetic character followed by the letter 'i'.
        " \_a\{2}i  -   Any two alphabetic characters followed by the letter 'i'.
        " \_s\_a\{2}i   Space or linebreak followed by the above.
        " Other handy predefined ranges:
        " /\d       -   any digit
        " /\D       -   anything that is not a digit
        " /x        -   any hex digit [0-9a-fA-F]
        " /X        -   anything that is not a hex digit
        " /\l       -   any lowercase letter
        " /\L       -   anything that is not a lowercase letter
        " /\u       -   any uppercase letter
        " /\U       -   anything that is not a uppercase letter
    " Control case of search:
        " \c    -   ignore case of next character
        " \C    -   match case of next character
    " Match in a specific column.
        " \%1c  -   Match only in column 1.
        " /\%1c#    -   Match all '#' that occur in column 1.
        " ;3    -   My quickfix way to do the above search pattern forwards.
        " ;#    -   My quickfix way to do the above search pattern backwards.
        " [ ] Make this a proper markdown plugin section motion command.
        " See http://learnvimscriptthehardway.stevelosh.com/chapters/51.html
    " Search with an offset:
        " /search_for/e    -   After you land on the word, go to the end
        " /search_for/e+1  -   Land, go to the end and one more character
        " /search_for/e-1  -   Land, go to the end and back one character
        " /search_for/b+1  -   Land, go to the beginning and one more
        " /search_for/b-1  -   Land, go to the beginning and back one
        " /search_for/2    -   After you land on the word, go 2 lines down
        " /search_for/-2   -   After you land on the word, go 2 lines up
    " :set nowrapscan   -   search without wrapping around
    " Use Ctrl-B (remapped from Ctrl-V) to enter eol character ^M.
        " In order to search for ^M and delete it   -   :s/^M//
        " This is how that expression is typed      -   :s/Ctrl-B<CR>//
" Folds:
    " zv    -   unfold just enough to view cursor line
    " [z    -   jump to top of current fold
    " ]z    -   jump to bottom of current fold
    " zR zM -   Unfold/Fold every fold all the way.
    " zx    -   recalculate folds (when folding doesn't seem to behave right)
    " za    -   toggle fold under cursor (use after a zj/zk motion)
    " zA    -   recursive version of za
    " zj    -   jump down to next fold location
    " zk    -   jump up to previous fold location
    " zt    -   scroll current line to the top of the window
    " zz    -   scroll current line to the middle of the window
    " zb    -   scroll current line to the bottom of the window
" ;zr and ;zm are improved versions of zr and zm
    " They behave like zr and zm, but keep the cursor stationary in the window.
    " ;zr       -   unfold all one level
    " ;zm       -   fold all one level
    " Typical usage:
    " Editing notes_for_update.md, place the cursor on the "week" date line:
    "   Update 2/5/2018 - 2/9/2018
    " and ;zr or ;zm to expand/collapse the week until you see it listed by day.
    " TODO: find the "foldlevel" name for this amount of collapsing. Make a
    " shortcut specificially to collapse/unfold to show weeks or show days.
    " TODO: what I really wanted was something like za that would keep the
    " cursor stationary. Actually, that is what za does! So between [z ]z and
    " za, I have all the functionality I need.
" Navigation by marks:
    " ma    -   Mark "a" in the current buffer.
    " 'a    -   Go to mark "a".
    " mA    -   Mark "A" in the current buffer specific to this file.
    " 'A    -   Even from another file, 'A will jump back to this spot.
" Navigation by 'g':
    " g;        -   Go to previous edit.
    " g,        -   Move through edits in other direction.
    " gg        -   Go to first line.
    " G         -   Go to last line.
    " [num]gg   -   Go to line number [num]. Only helpful to follow compiler errors.
    " gm        -   Go to middle of this line    as it looks on the screen.
    " g0        -   Go to beginning of this line as it looks on the screen.
    " g$        -   Go to end of this line       as it looks on the screen.
    " gr-       -   Replace visual block with '-' or whatever.
    "               Title Header Line Thing (Copy this title)
    "               ----------------------- (Paste it here, select, then gr-)
    "
" $ -   Navigate to the end of a line.
    " This is really helpful to paste starting at the end of the line and get
    " the cursor in the right place.
" Alt-Up        -   Left-align with the line of text above.
    " :execute "left"indent(line('.')-1)
    " ---How I figured this out---
    " see :h indent
        " indent({lnum}) returns the number which is the indent of line {lnum}
    " see :h getline
        " when {lnum} is a String that doesn't start with a
        " digit, line() is called to translate the String into a Number.
    " Test:
    "   getline(line('.')-1)
" Left-align a bad paste job.   -   :[range]le[ft] [indent]
    " Example: Fix a weird paste job.
    " Uncomment the numbers, place the cursor on the first line of numbers, and
    " try:
    "   :.,+4left4  -   from here to 4 lines down, left align with an
    "                   indent of 4.
    "
    "    A Weird Paste Job To Fix
    "    3
    "        4
    "            5
    "                6
    "                    7
" Use the yank and cut registers
    " Use register 0 for previous yank:
    " After a yank, you often want to delete some text before you paste, but the cut
    " clobbers the default '"' register. Yanked text is also placed in register 0.
    " Partial line and complete line yanks are treated the same way.
    "
    " Use register 1-9 for previous complete line cuts:
    " After a cut, a subsequent cut moves the previous down to the next register.
    " The cut goes into the default '"' register.
    " The next cut goes into the default '"' and the first cut into "1".
    " The next into '"', second into "1" and the first into "2".
    " After filling all 9 cut registers, the first cut is shifted out and gone for
    " good.
    "
    " Use registers a-z for yanks and cuts that you want to keep.
    " These registers do not undergo any automatic shifting.
    "
    " Use register '-' for the previous partial-line cut.
" Paste from registers:
    " I replaced CTRL-R with CTRL-V for insert and Ex mode.
    " i_CTRL-B  -   insert next character without listening for a mapping
    " c_CTRL-B  -   insert next character without listening for a mapping
    " i_CTRL-V  -   paste from the clipboard
    " c_CTRL-V  -   paste from the clipboard
" Misc:
    " c_<Bcksp> -   if there is no text, yet another way to exit command mode
    " <C-a>     -   inc number under cursor
    " <C-x>     -   dec number under cursor
    " Note that if the number has a negative sign in front of it,
    " <C-a> and <C-x> still inc and dec, but -5 increments to -4, etc.
    " So on a date like 2018-02-03, putting the cursor on the "3" and pressing
    " <C-a> makes the date 2018-02-02. You don't intend it to read as a negative
    " number, but that is how Vim sees the '-'.
    "   Column-select a list of 1's, v_g CTRL-A makes an incrementing list!
    " :> :>> :>>>   -   This is different from normal mode >>
    " :+3>      -   move line 3 rows down one indent right
    " :+3>>>    -   move line 3 rows down three indents right
    " >3j       -   indent move lines from this row down 3 rows
    " 3><CR>    -   same
    " :h :o     -   do not use :o[pen] even though Ashley Mills likes it.
    "               It's a way of telling people you used to use Vi. It is
    "               supported in Vim for backwards-compatibility but provides no
    "               benefits.

" ---HOW DO I?---
" Unittest Vimscript: see :h testing
    "[ ] Color a readonly window (maybe a little greyed out).
        "This is impossible. But I can change the color of the status line.
        ":h hl-StatusLine
        "Does Tabulous do this? No. Search for /TabLine.
        ""Check if the buffer is readonly.
        ":if &readonly
        ":  "Change StatusLine color.
        "   "Link it to WarningMsg or NERDTreeRO
        ":endif
" [x] Enter unicode character text:
    " see :h utf-8-typing
        " Type any character as four hex bytes:
        " CTRL-V u 1234 -   Example in Vim help.
        " My own examples. Note that I remapped <C-v> to <C-b>.
        " ▸ -   i_<C-b>u 25b8
        " ▾ -   i_<C-b>u 25be
        " ° -   i_<C-b>u 00b0 22°
        " ┉ -   i_<C-b>u 2509
        " ┊ -   i_<C-b>u 250a
        " ┋ -   i_<C-b>u 250b
        " ┌ -   i_<C-b>u 250c
            " ┍ -   i_<C-b>u 250d
            " ┎ -   i_<C-b>u 250e
            " ┏ -   i_<C-b>u 250f
        " ┐ -   i_<C-b>u 2510
            " ┑ -   i_<C-b>u 2511
            " ┒ -   i_<C-b>u 2512
            " ┓ -   i_<C-b>u 2513
        " └ -   i_<C-b>u 2514
            " ┕ -   i_<C-b>u 2515
            " ┖ -   i_<C-b>u 2516
            " ┗ -   i_<C-b>u 2517
        " ┘ -   i_<C-b>u 2518
        " ┤ -   i_<C-b>u 2524
        " ├ -   i_<C-b>u 251c
        " 院    -   i_<C-b>u 9662
    " But if you really want to type in Chinese:
        " > Another method is to set the current locale to the language you
        " > want to use and for which you have a XIM available.  Then set
        " > 'termencoding' to that language and Vim will convert the typed
        " > characters to 'encoding' for you.
    " Also see :h mbyte-keymap
        "   :echo globpath(&rtp, "keymap/*.vim")
        " pinyin.vim is on that path:
        "   /usr/share/vim/vim80/keymap/pinyin.vim
        " It is not Chinese characters, just the pinyin utf-8 symbols.
        " In Insert and Command-line mode use <C-^> to toggle using the keyboard
        " map.
        " Example:
        "   :set keymap=pinyin
        "   i       -   enter insert mode
        "               but note that the status line says
        "               --- INSERT (py) ---
        "               instead of
        "               --- INSERT ---
        "   a0      -   a
        "   a1      -   ā
        "   a2      -   á
        "   a3      -   ǎ
        "   a4      -   à
        "   <C-^>   -   Toggle the keymap mode on/off
        "
        "
        " =====[ xxxxxxxxxxxxxxxxxxxxxxx ]=====
        "
        "   理越智
        "   " Pinyin    Character   UTF-8 Code Point (Hex)
            " Lǐ        理          7406
            " yùe       越          8d8a
            " zhì       智          667a
            "
" [x] Create my own keymap file for engineering work.
    " See /home/Mike/.vim/keymap/symbols.vim
    " :set keymap=symbols
    " enter insert mode
    " <C-^> -   --- INSERT (sym) ---
    " degree                    °   deg
    " plus/minus                ±   pm
    " DirectoryArrowExpandable  ▸   dae
    " DirectoryArrowCollapsible ▾   dac
    " BranchDownRight           ┌   bdr
    " BranchDownLeft            ┐   bdl
    " BranchUpRight             └   bur
    " BranchUpLeft              ┘   bul
    " Place the map here:
    "   ~/.vim/keymap
    "   Rationale:
    "       ~/.vim is on my runtimepath (see :set runtimepath)
    "       and
    "       I think keymaps are found by Vim if they are in a 'keymap/' folder.
" quickly add * or - to underline text
" [x] Recognize .lss as asm (like .lst is)
    " Color these with duoduo.
    " That way they'll show up good in diffs.
" [ ] run Vim in the background to:
    " open preproc.c
    " run the command ;di
    " save and close the .lst
    " vimdiff the main.c and preproc.c
    " All of this becomes part of the recipe for "preproc" in
    " Makefile.
" Use a different default colorscheme for vimdiff?
    " badwolf is subtle with highlighting differences
    " duoduo and deus are great, CandyPaper is pretty good.
    " deus highlights stick around if you switch back to badwolf
" Modify duoduo to use a less awful highlight for misspelled words.
" Modify the colorscheme background -- use the same background as CandyPaper.
" Find a good dark c colorscheme
" Use Cygwin better:
    " [ ] Learn to recall a previous command from history in Cygwin, given the
    " first word or characters of the command... this in my /c/readme.md
    " [ ] Refresh how to use 'info'.
    "     Use 'info' to learn to use 'find'.
    "         Context: Mintty color theme is nord. Where is this file?
    "     Use 'info' to learn sed and awk.
    " [ ] Improve the Cygwin shell color scheme.
    "     How do I replace it with a customized scheme from
    "     http://ciembor.github.io/4bit/# Or just try installing the 'fish'
    "     friendly interactive shell. It is available in Cygwin in setup in
    "     the Shells category.
" [x] Do not set Vim cd when entering a buffer (default Vim behavior).
    " There is a Vim setting to always set the Vim current diretory to the
    " active buffer. There is even a NERDTree setting for this. but I decided I
    " don't actually want to always cd to the active buffer.
    " There is power in leaving the Vim directory at a project root:
    " 1. :find can use the project root and ** dive into sub-folders.
    " 2. :make finds the Makefile
    " And changing the Vim directory is pretty easy anyway:
    " 1. :cd %:p:h (shorcut is ;cd) works when I need to switch to the buffer's
    "    active directory
    " 2. I can also hit 'cd' while in a NERDTree view to change the Vim
    "    directory.
    " And many times I was just doing ;cd so that I could file browse in the
    " directory of the active buffer. But with NERDTree the last browse location
    " is saved. ;nt just toggles the NERDTree window on and off. So I can browse
    " a project a bit, close the NERDTree window, and then from any buffer
    " reopen the NERDTree window and be back at that same project!
" [ ] Use new path when entering a code project.
    " Context: path should point to /avr when editing Atmel avr code.
" [ ] Is there a way for ctags to pull from multiple paths?
    " Context: ctags does not find _BV(bit) used in my src/main.c
" [ ] Automatically remove old Vim undofiles? (:h undopersistence)
" [ ] What is the .md tag for a title? Use this in log.md.
" [x] Add #include paths outside the project path to Vim's path for :h gf.
    " Context:
    " I want to use 'gf' on <avr/interrupt.h> to look at this file.
    " But I get the error: E447: Can't find file "avr/interrupt.h" in path.
    " Quick fix: literally add the "avr/" path to my .vimrc in 'set path+='
" [ ] TODO: use autocommands to make 'gf' project dependent.
    " Note that paths cannot have spaces.
    " The help shows \\\ to escape a space.
    " :set path+=/cygdrive/c/Program\\\ Files\\\ (x86)/Atmel/Studio/7.0/toolchain/avr8/avr8-gnu-toolchain/avr/include/avr
    " But \ works.
    " :set path+=/cygdrive/c/Program\ Files\ (x86)/Atmel/Studio/7.0/toolchain/avr8/avr8-gnu-toolchain/avr/include/avr
    "
" [x] Access build output in quickfix.
" [ ] Make a shortcut to open Windows explorer for the path under the cursor.
" [x] Install NERDTree
    " https://github.com/scrooloose/nerdtree
    " I am done with netrw.
    " netrw does not work the way it is explained in its help:
    " 'c' does not update the directory consistently, so a task like:
    "     make a directory
    "     enter the directory
    "     make another directory there
    " does not work consistently
    " Also, netrw creates Netrw buffers that pollute the directory and make it
    " annoying to exit Vim.
" [-] While browsing in netrw: (forget this -- using NERDTree now)
    " See :h :netrw-browse-maps
    " [-] Learn to create a hiding-list so that 'a' hides '.' files.
    " [-] How do I quickly collapse an open folder?
    " [-] Create a shortcut for <M-x> to open a netrw browser for the folder of
    " the currently active file.
    " The browser should
    "     - open in a window split on the left -- This is just :Lex
    "     - show the relative number on the side
" Replace format mm/dd/yyyy with mm-dd-yyyy
    " see :h :&
    " How do I search for a character that is any number?
" I want <F2> to toggle the terminal in and out...
    " How do I type exit at the terminal prompt:
    " $exit
    " And then have Vim delete the buffer:
    " bd
    " Or maybe there is another way where I just hide the window... close the
    " window... the buffer stays and the next press of <F2> just pulls it back up?
    "
    " I'd also like <A-w> to still work in the :term window, but only <C-w> works...
    " this tells me the :term window is another Vim mode. Find out what mode it is
    " and map the <A-w> key there...
"  Temporariliy change the background color.
    " This would be handy for tracking which file I'm looking at when there are
    " multiple windows open. I wouldn't want a permanent change, just to
    " quicklhy temporarily make the background blue, like how vimdiff makes the
    " background blue for new text.
" Change default paste behavior to NOT format the paste with a hard wrap.
    "
" Fix fold behavior for markdown files.
    " Temporary fix: I 'set foldignore= '
    " Default behavior :set foldignore? Returns '#'.
    " TODO(sustainablelab@gmail.com): Implement 'set foldignore= ' for markdown
    " files only.
    "
"  Save a session (instead of writing down paths and making path shortcuts...)
    "  see :h sesion
"  Use marks to move around a file.
    "  see :h marks
    "  Use a combination of marks and regex search to move text based on other
    "  text.

" ---NEAT STUFF, LOOK AT LATER---
" See :h win32-faq
"
" See :h :!start    -   
    " Examples:
    " :!        -   Opens the bash prompt.
    " but
    " :!start   -   Open a Windows Command Prompt!
    " From here you can run explorer, do whatever!
    " Though the prompt kind of sucks.
" See :h :!cmd
    " Examples:
    " :!notepad++.exe   -   Starts notepad++.
    " :!explorer        -   Starts a Windows Explorer.
    " Explore at a specific path:
    " :!explorer 'C:\chromation-dropbox\Dropbox\design files and protocols\circuits\mcu\Atmel Studio\LIS-770i_Interface'
    " But '&' doesn't work for opening files.
    " You should be able to select a command with !start, but this does not work.
    " Example of attempting to add a command and failing.
    " :!start explorer %:h  -   does the same thing as :start!
    " :! start notepad++.exe    does the same thing as :start!
"
" :h usr_29.txt     -   tags
" :h :retab         -   Replace all tabs with spaces.
" :h K              -   Run the program under the cursor.
    "                   Change this default program with the 'keywordprg' (kp)
    "                   option (default is "man").
" q:                -   Open command-line window from normal mode.
"
" ---LATEST GOTO SESSION---
"  
"    Window setup while hunting down avr-gcc:
"        UpperLeft: log.md                --- ;el ../log.md
"                                        (parent of latest c learning project)
"        UpperRight: notes_for_update (this file) --- ;en
"        LowerLeft: readme.md             --- ;bc ;eh<CR> /readme.md
"        LowerRight: atmel_dfp_readme.txt --- ;bc ;eh<CR> /Atmel/atmel_dfp_readme.txt
"

"-----------------------------------------------------
" Recovered with backblaze from my deleted .vimrc text
"-----------------------------------------------------
"---START RECOVERED FROM 2-4-2018 .VIMRC---
" Searches
" Find special characters by backslash escaping them.
" /\[\ \]       - finds the string '[ ]'
" Review basic search patterns here:
" :h 03.9       - Help section 'Simple search patterns'
"
" Visual Blocks
" Apply Ex command (e.g., search/replace) to a visual block:
" Select block, type :, command automatically starts with '<,'>
" Apply another command to the most recently defined visual block:
" Just start the command again with '<,'>
" gv            - show the last selected visual block.

" Misc
" gU{motion}    - Make {motion} text uppercase.
" see :h uppercase

" Windows
" CTRL-W |      - expand a vertical split to fill the full-width.
" CTRL-W =      - set all splits to equal sizes
" CTRL-W CTRL-R - rotate split positions
" CTRL-W CTRL-X - swap split
" :sb {bufname} - open bufname in a split window
" :bn :bN       - go to next/previous buffer
" quickly cycle through buffers:
"   :bn
"   hammer on @:
" see h: special-buffers
"
" Accidents
" CTRL-Z        - suspends Vim
" $ fg<Enter>   - return to Vim
"
" Info
" CTRL-G        - display current file name
" 9CTRL-G       - buf# and path to current file
" :dis          - check what is in the registers.
" "-i           - paste from the small delete register
" "%            - paste the file name
" ":            - paste the most recently executed command-line.
" "+ does the same thing as "*
" "/            - paste the last search pattern
"
" Open a terminal like Vim window!
" See :h terminal-use
" :term
" Now you have a shell...
" Exit the shell with:
" exit
" The shell window remains as a buffer you could go check out. Delete the buffer
" with :bd
" These seems to have messed up my cursor... figure this out tomorrow.
" :term bash    -   opens a bash instead of a sh
" Always use bash instead of sh:
" set shell=bash
"
"nnoremap <leader>hw :call WhiteSpaceToggle()<CR>
"function! WhiteSpaceToggle()
"    let HiInfo = execute('highlight SpecialKey')
"    if matchstr(HiInfo, "Ignore") == "Ignore"
"        exec('hi! link SpecialKey SpecialKey')
"        echo "Whitespace is visible."
"    elseif matchstr(HiInfo, "Ignore") == ""
"        exec('hi! link SpecialKey Ignore')
"        echo "Whitespace is barely visible."
"    endif
"endfunction
"
"nnoremap <leader>hc :call CommentToggle()<CR>
"function! CommentToggle()
"    let HiInfo = execute('highlight Comment')
"    if matchstr(HiInfo, "Ignore") == "Ignore"
"        exec('hi! link Comment Comment')
"        echo "Comments are visible."
"    elseif matchstr(HiInfo, "Ignore") == ""
"        exec('hi! link Comment Ignore')
"        echo "Comments are barely visible."
"    endif
"endfunction
"---END RECOVERED FROM 2-4-2018 .VIMRC---
"---START RECOVERED FROM 2-4-2018 .VIMRC---
"  Do not set background.
"    set background=dark
"
"  Do set number of colors.
"  Default is t_Co=8
"  The color scheme with t_Co=8 and no other color settings is actually pretty
"  good!
"  t_Co=8
"  But to use any of the installed color schemes, set t_Co=256.
"  So we do that in the .vimrc
"  And you can treat set t_Co=8 as a nice default color scheme.
" :colo<Tab><Space><Tab> to list available colorschemes.
"---END RECOVERED FROM 2-4-2018 .VIMRC---

"---EXPERIMENTAL---

" Luke Smith:
" https://www.youtube.com/watch?v=Q4I_Ft-VLAg
" map <F6> :echo "hi"<CR>

"---Autocommands---
" http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
" Also, look at FileType events.
" Autocommand Structure
" :autocmd BufEnter *.txt :write
"          ^        ^     ^
"          |        |     |
"          |        |     The command to run
"          |        |
"          |        A 'pattern' to filter the event.
"          |
"          The 'event' to watch for.
" A few things about autocommands:
" 1. autocommands are like writing functions on one line.
"    Separate each line of the function with '|'.
" 2. Make this readable with line-continuation.
"    Use '\' to continue the line. See :h line-continuation.
" 3. Define autocommands in a group so that they are easier to manage.
"    See :h aug
" Quick refresher on autocommand groups:
" The group below is called 'vimrc'.
" :aug  - list the autocommand groups " Note that vimrc is now listed!
" :au vimrc   - just list the autocommands defined in group 'vimrc'
"
" Quit Vim to completely remove the vimrc group.
" Remove all vimrc autocommands:
"   :au! vimrc
" Remove every BufEnter event in the vimrc group:
"   :au! vimrc BufEnter
" Remove a single vimrc autocommand:
"   :au! vimrc {event} {pat}
" e.g.
"   :au! vimrc BufEnter *.txt
" The 'redraw | file' displays the file name:
"   :file   - shows the file name
"   :redraw - calling this right before 'file' prevents the file name message
"   from getting clobbered by the redraw.

"---Scratch code---
    "function! BufKludgeHeight()
    "    " Get the number of rows.
    "    let extra_rows = 1
    "    let height = line("$")+extra_rows
    "    "Auto-adjust the window height to 1 row.
    "    1wincmd_
    "    " Go to the NERDTree window.
    "    execute "wincmd t"
    "    execute height . "wincmd -"
    "    " Go back to the terminal buffer window.
    "    execute winnr('#') . "wincmd w"
    "endfunction
    "function! OldrunUnityTestSuite()
    "    " Get the window number so we can return back later.
    "    let orig_window_number = winnr()
    "    " Delete the old terminal buffer if it exists.
    "        " Possibly better way to do this:
    "        " Vim has functions specifically to handle terminal buffers.
    "        " Try :h term_list()
    "        " term_setsize() is not implemented yet.
    "        " TODO: try scraping the buffer with term_scrape()
    "        " Then deleting the window and completely redrawing your own window with
    "        " the test results.
    "        " Alternatively, you could figure out the number of rows needed, call
    "        " with term_start() and set the term_rows option.
    "        " What I don't get is why it was so easy to do other stuff to the
    "        " terminal window. And why I can resize it when I am interacting with
    "        " it.
    "        " Another option is to try working with the terminal window buffer in
    "        " the background somehow, getting the size of the window that way.
    "        " Oh, the problem is the variable space.
    "    let TermBufSearch = execute('filter /!\.\/build\/TestSuite.exe/ ls')
    "    let BufExists = matchstr(TermBufSearch, '!./build/TestSuite.exe') != ''
    "    if BufExists
    "        exec 'bdelete \!./build/TestSuite.exe'
    "    endif
    "    " Run the test in a terminal window at the bottom of the screen.
    "    botright terminal ./build/TestSuite.exe
    "    " Color the test output.
    "    call ColorMeUnittest()
    "    " Manually set the test repot to 9 rows tall.
    "    9wincmd_
    "    " Put the cursor back in the window that invoked the unittest with ;te.
    "    execute orig_window_number . "wincmd w"
    "    " Adjust the height of the test report -- could not get this to work.
    "        "Wait for the terminal buffer to finish its job.
    "        "This didn't help.
    "        "Same problem as line('$'):
    "        "  the result is correct when I run from the command line,
    "        "  but the result is incorrect when it runs from this script...
    "        "  GetTerminalBufferNumber is only returning the last digit.
    "        "  And line('$') is evaluating to zero.
    "        " My latest attempt:
    "        "let buffer_number = GetTerminalBufferNumber()
    "        "while term_wait(buffer_number)
    "        "endwhile
    "        "echo buffer_number
    "        "call BufAutoHeight()
    "endfunction
    "I created this to figure out how to check if the test output buffer already
    "exists before I try to delete it. This avoids getting a few errors the
    "first time a test is run.
    "nnoremap <leader>tx :call TestListingOnlyTestOutput()<CR>
    "function! TestListingOnlyTestOutput()
    "    let TerminalBufferSearchResult = execute('filter /!\.\/build\/TestSuite.exe/ ls')
    "    if matchstr(TerminalBufferSearchResult, '!./build/TestSuite.exe') == ''
    "        echo "No terminal buffer to delete."
    "    else
    "        echo "Terminal buffer exists --EXTERMINATE--"
    "    endif
    "endfunction
    "function! GetTerminalBufferNumber()
    "    let TerminalBufferSearchResult = execute('filter /!\.\/build\/TestSuite.exe/ ls')
    "    "Search for any number of digits, followed by a space.
    "    let pattern_for_digits = '\d\+'
    "        "This works from the command line, but only the last digit is returned
    "        "when the script is called.
    "        "Even this explicit call does not work:
    "        "let pattern_for_digits = '\d\d\d'
    "    return matchstr(TerminalBufferSearchResult, pattern_for_digits)
    "endfunction

"=====[ Run a Perl module's test suite ]=========================
    "
    " let g:PerlTests_program       = 'perltests'   " ...What to call
    " let g:PerlTests_search_height = 5             " ...How far up to search
    " let g:PerlTests_test_dir      = '/t'          " ...Where to look for tests

    " augroup Perl_Tests
    "     autocmd!
    "     autocmd BufEnter *.p[lm]  Nmap <buffer> ;t [Run local test suite] :call RunPerlTests()<CR>
    "     autocmd BufEnter *.t      Nmap <buffer> ;t [Run local test suite] :call RunPerlTests()<CR>
    " augroup END

    " function! RunPerlTests ()
    "     " Start in the current directory...
    "     let dir = expand('%:h')

    "     " Walk up through parent directories, looking for a test directory...
    "     for n in range(g:PerlTests_search_height)
    "         " When found...
    "         if isdirectory(dir . g:PerlTests_test_dir)
    "             " Go there...
    "             silent exec 'cd ' . dir

    "             " Run the tests...
    "             exec ':!' . g:PerlTests_program

    "             " Return to the previous directory...
    "             silent cd -
    "             return
    "         endif

    "         " Otherwise, keep looking up the directory tree...
    "         let dir = dir . '/..'
    "     endfor

    "     " If not found, report the failure...
    "     echohl WarningMsg
    "     echomsg "Couldn't find a suitable" g:PerlTests_test_dir '(tried' g:PerlTests_search_height 'levels up)'
    "     echohl None
    " endfunction

" Do not replace every "function!" with "function".
    " Do not do this:
    "   :%s/function!/function/g
    " If you do, you will not be able to source the .vimrc without closing Vim
    " and reopening because all the functions will already be defined and Vim
    " will not want to overwrite them.

"syn match pythonTodo  />\^\.\^</
"syn match pythonTodo /<\'\.\'>/
    " Fence the fruits of TDD with bright happy cat faces.
    " The 'syn match ptyhonTodo' is what makes the faces bright.
        "Example:
        " #   >^.^<     >^.^<    >^.^<    >^.^<    >^.^<  
        " #---BEGIN - Code covered by the above tests---
        " def function_covered_by_TDD():
        " ...
        " def another_function_covered_by_TDD():
        " ...
        " #---END - Code covered by the above tests---
        " #  <'.'>    <'.'>    <'.'>    <'.'>    <'.'>  
    " Details on developing the 'syn match pythonTodo':
        " pythonTodo contained NOTE XXX etc.
        " pythonComment contains=pythonTodo,blah
        "               links to Todo
            " The 'Todo' highlight group is yellow or black on yellow.
            " Make up a group: pythonTDD, link it to WarningMsg.
            " 'WarningMsg' is red or pink.
            " MatchParen is pink on grey
            " Statement and Conditional are bold red
            " Type is pink
            " Exception is green
            " Tag is blod yellow-orange
            " Cursor is bold black on green
            " InterestingWord1 though 6 are black on various backgrounds
            " Add it to contains field of pythonComment
            " But where do I do this?
        " See :h tag-highlight
        "<F11>	-- Generate tags.vim file, and highlight tags.
        "<F12>	-- Just highlight tags based on existing tags.vim file.
        ":map <F11>  :sp tags<CR>:%s/^\([^	:]*:\)\=\([^	]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12>
        ":map <F12>  :so tags.vim<CR>
        "So the key is to do "syntax keyword Tag blah"
        ":h syn-keyword
        " Example:
        "   syntax keyword pythonTodo Kurt
        " But that does not work for weird characters.
        " See nerdtree/syntax/nerdtree.vim
        " /home/Mike/.vim/pack/bundle/start/nerdtree/syntax/nerdtree.vim
        " 'contains' defines a list of syntax group names (see :h syn-contains)
        "syn match pythonComment contains=/>\^\.\^</
        "https://superuser.com/questions/110054/custom-vim-highlighting
        "syn match Statement  />\^\.\^</
function! OldmakeQuickfixAndTest()
    cclose
        " Close the existing quickfix window so the size will be automatic.
    copen
    let there_are_errors=len(getqflist())>1
    if there_are_errors
        call ColorMeQuick()
        " Place the cursor on the first error
        cc
        " Expand any folds hiding the cursor line.
        normal! zv
        redraw
        echo "<°.°>  make...failed. Cursor is on the first error."
    else
        " Shrink the quickfix window to 2 lines high.
        2wincmd_
        " Go back to the window where you invoked make with ;m.
        exe winnr('#').'wincmd w'
        " Close the quickfix window.
        cclose
        redraw
        echo ">^.^<  make...OK.    <°.°>  Running unit tests..."
        " Run tests.
        call RunUnityTestSuite()
        redraw
        echo ">^.^<  make...OK.    >▸.~<  Unit tests finished: see results above."
    endif
endfunction

