" setup the language options in the beginning
if has("multi_byte")
    set encoding=utf-8
    " let $LANG="zh_TW.UTF-8"
    let $LANG="en.UTF-8"
    " set langmenu=none
    "set bomb " write BOM to usc file (not to utf-8 file)
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=usc-bom,utf-8,big5,sjis,latin1
    "set guifont=Bitstream\ Vera\ Sans\ Mono:h12
    set guifont=Consolas:h14 guifontwide=MingLiU:h14
else
    echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

" Linewidth to endless
set textwidth=0

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Repair wired terminal/vim settings
"set backspace=start,eol
set backspace=indent,eol,start

" {{{ Wrap visual selections with chars
:vnoremap ( "zdi(<C-R>z)<ESC>
:vnoremap { "zdi{<C-R>z}<ESC>
:vnoremap [ "zdi[<C-R>z]<ESC>
:vnoremap ' "zdi'<C-R>z'<ESC>
:vnoremap " "zdi"<C-R>z"<ESC>
" }}} Wrap visual selections with chars

"{{{ General
set nocompatible " get out of horrible vi-compatible mode

" vim-plug
" https://github.com/junegunn/vim-plug
let g:plug_threads = 1 " disable parallell installers
call plug#begin()
Plug 'franklai/vim-colors-franklai'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'walm/jshint.vim'
Plug 'elzr/vim-json'
Plug 'jtratner/vim-flavored-markdown'
call plug#end()

colorscheme franklai
syntax enable

" {{{Vim UI
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom 
set cmdheight=1 " the command bar is 2 high
"}}}

set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
set listchars=tab:»\  " what to show when I hit :set list
set list
set novisualbell " don't blink
set noerrorbells " no noises
set laststatus=2

highlight User1 ctermfg=red guifg=red
highlight User2 gui=underline cterm=underline ctermfg=green guifg=green ctermbg=black
highlight User3 gui=underline cterm=underline ctermfg=yellow guifg=yellow ctermbg=black
highlight User4 cterm=underline ctermfg=white ctermbg=black gui=underline guifg=white
highlight User5 ctermfg=cyan  guifg=cyan
highlight User6 ctermfg=white guifg=white

" %1* -> User1's highlight, %2*->User2's highlight
" =   -> Separation point between left and right aligned items.
" <   -> Where to truncate line if too long.  Default is at the start.
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&fileencoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>

" {{{Text Formatting/Layout
" set formatoptions=tcrqn " See Help (complex)
set formatoptions=tcrq " See Help (complex)
set ai " autoindent
set si " smartindent 
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify 
"set expandtab " real tabs please!
set nowrap " do not wrap lines  
set smarttab " use tabs at the start of a line, spaces elsewhere
set ignorecase " case of normal letters in pattern is ignored
set smartcase  " ignorecase when only lowercase latters in patterns.

"}}}

"{{{ Self-defined mapping
" Map ; to run PHP parser check
if has("autocmd")
" F5, F6 maaping
" imap allow recursive mapping, [i]noremap NOT allow
    autocmd FileType *          imap <F6> <ESC>:w<CR><F6>
    autocmd FileType *          imap <F5> <ESC>:w<CR><F5>
    autocmd FileType *          noremap <F5> :!make <CR>
    autocmd FileType tex        noremap <F6> :!latex %<CR>
    autocmd FileType tex        noremap <F7> :!pdflatex %<CR>
    autocmd FileType tex        noremap <F8> :!xelatex %<CR>
    autocmd FileType php        noremap <F6> :!php %<CR>
    autocmd FileType python     noremap <F6> :!python %<CR>
    autocmd FileType python     noremap <F7> :!pythonw %<CR>
    autocmd FileType tcl        noremap <F6> :!ns2 %<CR>
    autocmd FileType c,cpp      noremap <F6> :!gcc -c -Wall %<CR>
    autocmd FileType ruby       noremap <F6> :!ruby %<CR>
    autocmd FileType perl       noremap <F6> :!perl %<CR>
    autocmd FileType javascript noremap <F6> :!clear;jshint %<CR>

    " Automatic close char mapping
    autocmd FileType *          inoremap { {}<LEFT>
    autocmd FileType *          inoremap [ []<LEFT>
    autocmd FileType *          inoremap ( ()<LEFT>
    autocmd FileType c,cpp      inoremap { {<CR>}<C-O>O
    "autocmd FileType javascript inoremap { {<CR>}<C-O>O
    autocmd FileType c,cpp,php  inoremap " ""<LEFT>
    autocmd FileType c,cpp,php  inoremap ' ''<LEFT>

    " different format options
    "autocmd FileType *          set formatoptions=tcql  nocindent
    autocmd FileType *          set nocindent
    autocmd FileType *          set nosmartindent
    autocmd FileType c,cpp,php  set cindent
"     autocmd FileType python     set expandtab

    " Comment Block of Text
    " Python/Perl # comments
    autocmd FileType python,perl,make        map ,r :s/^/# /<CR>
    autocmd FileType python,perl,make        map ,t :s/^# \=//<CR>
    autocmd FileType sh,conf,apache          map ,r :s/^/# /<CR>
    autocmd FileType sh,conf,apache          map ,t :s/^# \=//<CR>

    " C/C++/C#/Java // comments
    autocmd FileType c,cpp,java     map ,r :s/^/\/\/ /<CR>
    autocmd FileType c,cpp,java     map ,t :s/^\/\/ \=//<CR>
    autocmd FileType javascript,php,html     map ,r :s/^/\/\/ /<CR>
    autocmd FileType javascript,php,html     map ,t :s/^\/\/ \=//<CR>

    " TeX % comments
    autocmd FileType tex,matlab     map ,r :s/^/% /<CR>
    autocmd FileType tex,matlab     map ,t :s/^% \=//<CR>

    " Vim " comments
    autocmd FileType vim            map ,r :s/^/" /<CR>
    autocmd FileType vim            map ,t :s/^" \=//<CR>

    " read different setting file
    "autocmd FileType python source C:/Vim/python.vim

    autocmd BufEnter config.define  set ft=json
endif

if expand("%:e") == "ctx"
    set filetype=tex
endif

	imap    jj  <ESC>

    imap    <M-z>     <ESC><M-z>
    imap    <M-x>     <ESC><M-x>
    imap    <F12>     <ESC>: shell<CR>
    imap    <C-l>     <ESC><C-h>
    imap    <C-h>     <ESC><C-l>
    imap    <C-n>     <ESC><C-n>
    map     <M-1>     <ESC>:tabn 1<CR>
    map     <M-2>     <ESC>:tabn 2<CR>
    map     <M-3>     <ESC>:tabn 3<CR>
    map     <M-4>     <ESC>:tabn 4<CR>
    map     <C-x>     <ESC>:tabclose<CR>
    map     <C-n>     <ESC>:tabnew<CR>
    map     <S-TAB>   <ESC>:tabprevious<CR>
    map     <TAB>     <ESC>:tabnext<CR>
"     map     <F12>     : shell<CR>
"     map     <F11>     :set hls!<CR>
    map     <F9>      <ESC>:tabprevious<CR>
    map     <F10>     <ESC>:tabnext<CR>
    map     <M-z>     <ESC>:tabprevious<CR>
    map     <M-x>     <ESC>:tabnext<CR>

"}}}

"}}}
"set foldmethod=marker

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" for :TOhtml
let html_use_css=1
let use_xhtml=1

" automatic change directory to current buffer
if exists('+autochdir')
  set autochdir
endif

" Use mouse in Vim, test
" set mouse=a
" set ttymouse=xterm2


" *** useful vim script ***
" 
" SuperTab continued.
"   http://www.vim.org/scripts/script.php?script_id=1643
"
set modeline

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
