set number
set autoindent

:tnoremap <Esc> <C-\><C-n>:q!<CR>set shiftwidth=2
:set smarttab
set tabstop=2
:set softtabstop=0
set shiftwidth=2
:set scrolloff=999
let mapleader = " "

nmap <leader>nh :noh<CR>
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>3 :so init.vim<CR>
imap <C-Space> <Esc>

" configure line creating
map o o<Esc>i
map <C-o> o<Esc>
imap <C-o> <CR>
map <leader>o i<CR><Esc>
imap <C-p> <Esc>o

" navigation in editing mode
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" Jump editor navigation in vim mode
map L 5l
map K 5k

" jump to end of line or doc
map <leader>l $
map <leader>h 0

" delete in editing mode
imap <C-s> <Bs>
" imap <C-w> <Esc>diwa
imap <C-d> <delete>

" delete content of line without deleting the line
nmap <leader>d d$d0x

" open and navigate tabs -->

" open tabs hor and ver
nmap <leader>s <C-w>s
nmap <leader>v <C-w>v

" navigating between tabs
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" resising tabs
nmap . <C-w>>
nmap , <C-w><
nmap = <C-w>+
nmap - <C-w>-
nmap <leader>L <C-w>L
nmap <leader>K <C-w>K
nmap <leader>J <C-w>J
nmap <leader>H <C-w>H
nmap <leader>R <C-w>R
nmap <leader>r <C-w>r

nnoremap <leader>t :term<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"Langauge Shorcuts
set iminsert=0

let s:hebrew = 1

function SmoothScroll(up)
    if a:up
        let scrollaction="k"
    else
        let scrollaction="j"
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    let mil = 10
    while counter<5
        let counter+=1
	exec 'sleep '.mil.'m'  
	let mil += 10
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

map K :call SmoothScroll(1)<Enter>
map J :call SmoothScroll(0)<Enter>

function! LangToggle()
  if s:hebrew
    execute 'set keymap=hebrew'
    let s:hebrew = 0
  else
    execute 'set iminsert=0'
    let s:hebrew = 1
  endif
endfunction

nnoremap w :call LangToggle()<CR>

let g:instant_markdown_mathjax = 1

let g:coq_settings = { 'auto_start': v:true }

call plug#begin()

Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'scrooloose/nerdtree'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'vimwiki/vimwiki'

Plug 'psliwka/vim-smoothie'

call plug#end()
