" Vim keymap file for annotating NERDTree directory structure, engineering
" symbols like plus/minus and degree, and who knows what else!
" Maintainer: Mike Gazes <sustainablelab@gmail.com>
" Created: 2018-02-24
" Last Changed: 2018-02-4

" ---Installation---
	" Place this file in a 'keymap' folder in the runtimepath.
	" For example, if ~/.vim is in the runtimepath:
	" $ mkdir ~/.vim/keymap/
	" $ cp /tmp/symbols.vim ~/.vim/keymap/symbols.vim
" ---Add Symbols---
	" Separate shortcut and symbol with a tab:
	" :set noexpandtab	-	<Tab> inserts a tab
	" :set expandtab	-	<Tab> inserts spaces
    " Update the current session to use the latest version of this file:
    " :set keymap=symbols
" ---Usage---
	" i			-	enter insertmode
	"				status line shows: --- INSERT ---
	" Ctrl-^	-	status line shows: --- INSERT (sym) ---
	" deg		-	places '°' instead of 'deg'

" Use this short name in the status line.
let b:keymap_name = "sym"

loadkeymap
deg	°
pm	±
leq	≤
lnm	λ
dae	▸ "[d]irectory [a]rrow [e]xpandable
dac	▾ "[d]irectory [a]rrow [c]ollapsible
bdr	┌ "[b]ox [d]own [r]ight
bdl	┐ "[b]ox [d]own [l]eft
bur └ "[b]ox [u]p   [r]ight
bul	┘ "[b]ox [u]p   [l]eft
bhh	─ "[b]ox [h]orizontal [h]
bvv	│ "[b]ox [v]ertical   [v]
Dlv	┆ "[D]ashed [l]ight [v]ertical
Dlh	┄ "[D]ashed [l]ight [h]orizontal
Dhv	┇ "[D]ashed [h]eavy [v]ertical
Dhh	┅ "[D]ashed [h]eavy [h]orizontal
dlv	┊ "[d]ot    [l]ight [v]ertical
dlh	┈ "[d]ot    [l]ight [h]orizontal
dhv	┋ "[d]ot    [h]eavy [v]ertical
dhh	┉ "[d]ot    [h]eavy [h]orizontal
ddr	┏ "[d]ot [d]own [r]ight
ddl	┓ "[d]ot [d]own [l]eft
dur ┗ "[d]ot [u]p   [r]ight
dul	┛ "[d]ot [u]p   [l]eft
"	─━│┃┄┅┆┇┈┉┊┋┌┍┎┏
"2500123456789abcdef
"	┐┑┒┓└┕┖┗┘┙┚┛├┝┞┟
"2510123456789abcdef
"	┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯
"2520123456789abcdef
"	┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿
"2530123456789abcdef

