" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  --> GENERAL	
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
    
" Pathogen
execute pathogen#infect()

" Enable filetype plugins
filetype plugin indent on

" Set map leader
let mapleader=","

" Fast saving
nmap <leader>w :w!<cr>

" Copy/paste to/from clipboard (clipboard feature needed)
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-l> c<ESC>"+p
imap <C-l> <C-r><C-o>+

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curson - when moving vertically using j/k
set so=7

" Always show current position
set ruler
set number
set relativenumber

" Trun on the Wild menu
set wildmenu

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Make search act liek search in modern browsers
set incsearch

" Don't redraw while executing macros (perf config)
set lazyredraw

" For regular expressions trun magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many thenths of secound to blink when matching brackets
set mat=2

" No annoyinh sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> COLORS AND FONTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on
set cursorline

" Enable 256 colors palette
"let g:solarized_termcolors=256

" If it is between 6AM and 5PM then light else dark solarized scheme
let hour = strftime("%H")
if 6 <= hour && hour < 18
	set background=light
else
	set background=dark
endif

set background=dark
" Solarized color scheme
colorscheme solarized

" Set utf8 as standard encoding
set encoding=utf8

" Toggle between dark and light backgrounds
map <F9> :let &background = ( &background == "dark"? "light" : "dark" )<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> TEXT, ,AB AND INDENT RELATED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces insted of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Line break on 500 characters 
set lbr
set tw=500

set ai " auto indent
set si " smart indent
set wrap " wrap lines
set colorcolumn=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Spell checker
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run Spell checker with <F6>
map <F6> :setlocal spell! spelllang=en<CR>

" Change spell checker to serbian latin
map <F7> :setlocal spell! spelllang=sr@latin<CR>

" Change spell checker to serbian 
map <F8> :setlocal spell! spelllang=sr<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> VISUAL MODE RELATED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> MOVING AROUND, TABS, WINDOWS AND BUFFERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><CR> is pressed
map <silent> <leader><CR> :noh<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<CR>:tabclose<CR>gT
" Close all the buffers
map <leader>ba :bufdo bd<CR>

map <leader>l :bnext<CR>
map <leader>h :bpreviouse<CR>

" Mapping for managing tab
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabremove
map <leader>t<leader> :tabnext
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> EDITING MAPPINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remam VIM 0 to first non-blank character
map 0 ^

"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if has("mac") || has("macunix")
 " nmap <D-j> <M-j>
 "nmap <D-k> <M-k>
  "vmap <D-j> <M-j>
  "vmap <D-k> <M-k>
"endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> TURN PERSISTENT UNDO ON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> PARENTHESIS/BRACKET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap [ <esc>`>a]<esc>`<i[<esc>
vnoremap { <esc>`>a}<esc>`<i{<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>
vnoremap " <esc>`>a"<esc>`<i"<esc>

inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> OMNI COMPLETION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable omni completion
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
endif

set cot-=preview "disable doc preview in omnicomplete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -->PYTHON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDocorater True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set tf=mako

au FileType python map <buffer> F :set foldmethod=indent<CR>

au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> MARKDOWN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interpret .md files, etc. as .markdown
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Code snippets
au FileType markdown,rmd inoremap <leader>n ---<CR>title:<CR>author:<CR>output:<CR>---<Esc>3kA
au FileType markdown,rmd inoremap <leader>b ****<Esc>hi
au FileType markdown,rmd inoremap <leader>s ~~~~<Esc>hi
au FileType markdown,rmd inoremap <leader>e **<Esc>i
au FileType markdown,rmd inoremap <leader>i ![]()<Esc>F[a
au FileType markdown,rmd inoremap <leader>a []()<Esc>F[a
au FileType markdown,rmd inoremap <leader>l ---------<CR>
au FileType rmd inoremap <leader>t $$<Esc>i
au FileType rmd inoremap <leader>1 ````<Esc>hi
au FileType rmd inoremap <leader>r ```{r}<CR>```<Esc>ko
au FileType rmd inoremap <leader>p ```{python}<CR>```<Esc>ko
au FileType rmd inoremap <leader>c ```<CR>```<Esc>ko
" Auto compile
au FileType rmd map <F5> :!echo<Space>"require(rmarkdown);<Space>render('<c-r>%')"<Space>\|<Space>R<Space>--vanilla<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> SYNTASTIC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disable highlighting
let g:ale_set_highlight=0

" Only run linting when saving the file
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -->LATEX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:livepreview_previewer='zathura'

" Run Latex Live Preview
nmap <F12> :LLPStartPreview<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> NERD TREE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc$', '__pycashe__']
let g:NERDTreeWinSize=25
map <leader>nn :NERDTreeToggle<CR>
map <leader>nb :NERDTreeFromBookmaprk<Space>
map <leader>nf :NERDTreeFind<CR>


