set visualbell

let mapleader = "\<Space>"

if &compatible
  set nocompatible               " Be iMproved
endif

require("avante").setup({
  ai = {
    provider = "openai",
  }
})

" dein setup
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  "a call dein#add(s:dein_repo_dir)

  call dein#load_toml(s:dein_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:dein_dir . '/lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

" color
syntax enable
set t_Co=256 "256color
set termguicolors
set background=dark
colorscheme molokai
highlight Normal guibg='NONE' guifg='NONE'
highlight LineNr guibg='NONE' guifg='#888888'
highlight Search guibg='Purple' guifg='NONE'
highlight Visual guibg=#768798 guifg='NONE'
highlight qfLineNr guifg=#c0c0c0

" show . file nerdtreee
let NERDTreeShowHidden = 1

set clipboard+=unnamed
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set virtualedit=onemore
set smartindent
set showmatch
set wildmode=list:longest

set expandtab
set tabstop=2
set shiftwidth=2

set ignorecase
set smartcase
set incsearch
set laststatus=2

" auto cd current buffer path
set autochdir

set wrapscan
set hlsearch
set encoding=utf-8
set fileformats=unix,dos,mac

nnoremap <F3> :noh<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
noremap : ;
noremap ; :

inoremap jj <Esc>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" split command
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap <S-Tab> :tabprev<Return>
nnoremap <Tab> :tabnext<Return>
noremap <S-h> ^
noremap <S-l> $

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

set completeopt+=noinsert

"unite prefix key.
nnoremap [unite] <Nop>
nmap <leader><leader> [unite]

"unite keyconfig
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 100
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
"現在開いているファイルのディレクトリ下のファイル一覧。

"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
	"ESCでuniteを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
	"入力モードのときctrl+wでバックスラッシュも削除
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"ctrl+sで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
	"ctrl+aで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-a> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-a> unite#do_action('vsplit')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

let g:node_host_prog = system('echo -n $(which neovim-node-host)')

nnoremap <silent> <leader>u :PhpactorImportClass<CR>

map <Leader>f <Plug>(easymotion-prefix)
nmap <Leader>j <Plug>(easymotion-w)
nmap <Leader>k <Plug>(easymotion-b)

