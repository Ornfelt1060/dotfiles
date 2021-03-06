if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged') " Specify a directory for plugins

Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'vim-syntastic/syntastic'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'jalvesaq/vimcmdline'
" Plug 'dracula/vim'

call plug#end() " Initialize plugin system

set runtimepath+=~/.vim
set rtp+=~/.fzf

" let mysyntaxfile = "~/.vim/syntax/wiki.vim" " Get syntax highlighting
" au BufRead,BufNewFile *.wiki set filetype=wiki

" General settings
filetype plugin indent on
if (has("termguicolors"))
    set termguicolors
endif
syntax on
syntax enable
set encoding=UTF-8
set number relativenumber
set noerrorbells
set noeb vb t_vb=
set autoread
set autowrite
set wildmenu
set backspace=indent,eol,start
set nocompatible
set smartindent
set autoindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set hls
set ic
set splitright
" set t_Co=256
" highlight Normal ctermbg=NONE
" highlight CursorLine cterm=NONE ctermbg=darkblue
set cursorline
set autochdir
set scrolloff=8
set noswapfile
set complete+=kspell
set shortmess+=c
set completeopt+=longest,menuone
set completeopt+=preview
let g:jedi#popup_on_dot = 1

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
        highlight! link DiffText MatchParen
endif

" Leader remap
nnoremap <SPACE> <Nop>
let mapleader=" "
" Replace from void
noremap <leader>p viw"_dP
noremap Y y$
" Delete to void
vnoremap <leader>d "_d
nnoremap <leader>d "_d
" Paste from previous registers
noremap <leader>1 "0p
noremap <leader>2 "1p

" Vimgrep and QuickFix Lists
nnoremap <M-f> :vimgrep // **/*.txt<left><left><left><left><left><left><left><left><left><left><C-f>i
nnoremap <M-g> :vimgrep // **/*<Left><Left><Left><Left><Left><Left><C-f>i
nnoremap <M-h> :cfdo s//x/gc<left><left><left><left><left><C-f>i
nnoremap <M-c> :cnext<CR>
nnoremap <M-p> :cprev<CR>
nnoremap <M-l> :clast<CR>
nnoremap <M-b> :copen<CR>

" Neovim FZF
nnoremap <M-a> :FZF <cr>
" nnoremap <M-d> :FZF ../../..<cr>
nnoremap <M-d> :FZF ~/<cr>
nnoremap <M-o> :FZF /<cr>

" NERDTree
map <M-w> :NERDTree ~/<CR>
nnoremap <M-e> :NERDTreeToggle %:p<CR>
map <C-b> :NERDTreeToggle<CR>

" Settings
map <M-z> :noh<CR>
map <M-x> :call CompileRun()<CR>
map <F4> <Esc>:set cursorline!<CR>
map <F5> <Esc>:setlocal spell! spelllang=en_us<CR>
map <F6> <Esc>:setlocal spell! spelllang=sv<CR>
imap <C-v> <Esc>"+gP

" Window management and movement
nnoremap <Down> :resize +2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Left> :vertical resize -2<CR>
map <silent> <C-h> <Plug>WinMoveLeft
map <silent> <C-j> <Plug>WinMoveDown
map <silent> <C-k> <Plug>WinMoveUp
map <silent> <C-l> <Plug>WinMoveRight
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
noremap <leader>j :join<CR>
noremap <leader>J :join!<CR>
nmap <leader>z <Plug>Zoom

" Tab maps
nnoremap <M-q> :q<cr>
nnoremap <M-t> :tabe<cr>
nnoremap <M-s> :split<cr>
nnoremap <M-Enter> :vsp<cr>
nnoremap <M-<> :vsp<cr>

" Go to tab by number
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt
noremap <M-0> :tablast<cr>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <leader>l :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <leader>l :exe "tabn ".g:lasttab<cr>
nnoremap <leader>o <C-^>

" Filetype shortcuts
autocmd FileType html inoremap <i<Tab> <em></em> <Space><++><Esc>/<<Enter>GNi
autocmd FileType html inoremap <b<Tab> <b></b><Space><++><Esc>/<<Enter>GNi
autocmd FileType html inoremap <h1<Tab> <h1></h1><Space><++><Esc>/<<Enter>GNi
autocmd FileType html inoremap <h2<Tab> <h2></h2><Space><++><Esc>>/<<Enter>GNi
autocmd FileType html inoremap <im<Tab> <img></img><Space><++><Esc>/<<Enter>GNi

autocmd FileType java inoremap fore<Tab> for (String s : obj){<Enter><Enter>}<Esc>?obj<Enter>ciw
autocmd FileType java inoremap for<Tab> for(int i = 0; i < val; i++){<Enter><Enter>}<Esc>?val<Enter>ciw
autocmd FileType java inoremap sout<Tab> System.out.println("");<Esc>?""<Enter>li
autocmd FileType java inoremap psvm<Tab> public static void main(String[] args){<Enter><Enter>}<Esc>?{<Enter>o

autocmd FileType cs inoremap sout<Tab> Console.WriteLine("");<Esc>?""<Enter>li
autocmd FileType cs inoremap fore<Tab> for each (object o : obj){<Enter><Enter>}<Esc>?obj<Enter>ciw
autocmd FileType cs inoremap for<Tab> for(int i = 0; i < val; i++){<Enter><Enter>}<Esc>?val<Enter>ciw

autocmd FileType sql inoremap fun<Tab> delimiter //<Enter>create function x ()<Enter>returns int<Enter>no sql<Enter>begin<Enter><Enter><Enter>end //<Enter>delimiter ;<Esc>/x<Enter>GN
autocmd FileType sql inoremap pro<Tab> delimiter //<Enter>create procedure x ()<Enter>begin<Enter><Enter><Enter>end //<Enter>delimiter ;<Esc>/x<Enter>GN
autocmd FileType sql inoremap vie<Tab> create view x as<Enter>select <Esc>/x<Enter>GN

autocmd FileType wiki,text inoremap <line<Tab> --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<Enter>
autocmd FileType wiki,text inoremap <date<Tab> <-- <C-R>=strftime("%Y-%m-%d %a")<CR><Esc>A -->
autocmd FileType c inoremap for<Tab> for(int i = 0; i < val; i++){<Enter><Enter>}<Esc>?val<Enter>ciw

" Statusline
set statusline=
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%#Difftext#
set statusline+=\ %M "track if changes has been made to file
set statusline+=\ %y "show filetype
set statusline+=\ %r "ReadOnly flag
set statusline+=\ %F "show full path to file
set statusline+=%= "right side settings
set statusline+=%#DiffChange#
set statusline+=\ %c:%l/%L "display column and line pos
" set statusline+=\ %p%% "display percentage traversed of file

" Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" Use tab and s-tab to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
inoremap <S-Insert> <Esc><MiddleMouse>A

" Coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-java',
  \ 'coc-python',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-clangd',
  \ ]
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
xmap <leader>cg  mcggVG<Plug>(coc-format-selected)'c
nmap <leader>cg  mcggVG<Plug>(coc-format-selected)'c
" Show all diagnostics using CocList
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
" Prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Show extra whitespace
nmap <leader>s /\s\+$/<cr>
" Remove extra whitespace
nmap <leader>wa :%s/\s\+$<cr>
" Format rest of the text with vim formatting, go back and center screen
nmap <leader>r gqG<C-o>zz
" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>a

" If on laptop (set specific settings for my laptop which runs arch linux)
if !empty(glob("~/isLinux"))
	set tw=180
	set clipboard=unnamedplus
	"let g:python3_host_prog='/bin/python3'
	"let g:coc_node_path = "/usr/bin/node"
	" Open vim config in new tab
	noremap <M-m> :tabe ~/.config/nvim/init.vim<cr>
	" Open i3 config in new tab
	noremap <M-,> :tabe ~/.config/i3/config<cr>
	" Open zshrc in new tab
	noremap <M-.> :tabe ~/.zshrc<cr>
	" Copy everything from file into clipboard
	inoremap <C-a> <Esc>gg"yG
	" Copy selection to clipboard
	noremap <C-c> y
	colorscheme gruvbox
	highlight Normal guibg=none
	highlight NonText guibg=none
	highlight LineNr cterm=NONE ctermfg=grey gui=NONE guifg=grey guibg=NONE term=bold
	let NERDTreeShowHidden=1

	" Function for compiling code
	func! CompileRun()
		exec "w"
		if &filetype == 'c'
			exec "!gcc % && ./a.out"
		elseif &filetype == 'cpp'
			exec "!g++ % -o %<"
			exec "!%:r.exe"
		elseif &filetype == 'java'
			"exec "!java -cp %:p:h %:t:r"
			exec "!java %"
		elseif &filetype == 'sh'
			exec "!time bash %"
		elseif &filetype == 'python'
			exec "!python3 %"
		elseif &filetype == 'html'
			exec "!firefox % &"
		elseif &filetype == 'javascript'
			exec "!node %"
		elseif &filetype == 'jsx'
			exec "!node %"
		elseif &filetype == 'typescript'
			exec "!node %"
		elseif &filetype == 'go'
			exec "!go build %<"
			exec "!time go run %"
		elseif &filetype == 'mkd'
			exec "!~/.vim/markdown.pl % > %.html &"
			exec "!firefox %.html &"
		elseif &filetype == 'cs'
			exec "!mcs % && mono ./%:t:r.exe"
		endif
	endfunc
else
	let g:python3_host_prog='~\anaconda3\envs\pynvim\python.exe'
	set guifont=Consolas:h10
	:winpos -8 -1
	set lines=48
	set columns=210
	set lines=999" cumns=999 "set fullscreen
	set tw=235
	imap <C-v> <C-r>+
	noremap <M-m> :tabe $myvimrc<cr>
	nnoremap <M-o> :FZF c:/<cr>
	" Copy everything from file into clipboard
	inoremap <C-a> <Esc>gg"*yG
	" Copy selection to clipboard
	noremap <C-c> "*y
	"colorscheme hybrid
	"colorscheme gruvbox
	colorscheme dracula
endif
