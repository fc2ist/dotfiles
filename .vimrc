"==================================
" 基本設定
"==================================
" オートインデント
set autoindent
" Vi互換OFF
set nocompatible
" インクリメンタルサーチ
set incsearch
" 行番号表示
set number
" 現在の位置を表示
set ruler
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" スマートインデント
set smartindent
" 検索時に大文字を含んでいたら大小区別
set smartcase
" スマートタブ
set smarttab
" ファイル内の <Tab> が対応する空白の数
set tabstop=2
" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数
set softtabstop=2
set shiftwidth=2
" ソフトタブを無効化
"set noexpandtab
" 右端で折り返し
set wrap
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" シンタックスハイライト
syntax on
" カラースキーム
colorscheme desert
" カーソル移動の設定
set whichwrap=b,s,h,l,<,>,[,]
" BSの設定
set backspace=indent,eol,start
" 文字エンコーディング
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis
" Inverse Tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
 autocmd! cch
 autocmd WinLeave * set nocursorline
 autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
" ESC2回押しで検索ハイライトの消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
" ウィンドウ移動
nnoremap <Space>j  <C-w>j
nnoremap <Space>k  <C-w>k
nnoremap <Space>h  <C-w>h
nnoremap <Space>l  <C-w>l
nnoremap <Space>w  <C-w><C-w>
nnoremap <Space>c  <C-w>c
nnoremap <Space>o  <C-w>o

"バッファ切り替え
nnoremap <Space><Space>  :<C-u>bn<CR>
"Shift押してたら逆順
nnoremap <Space><S-Space>  :<C-u>bp<CR>
nnoremap <S-Space><Space>  :<C-u>bp<CR>
nnoremap <S-Space><S-Space>  :<C-u>bp<CR>
"C-Spaceでバッファを閉じる
nnoremap <C-Space><C-Space>  :<C-u>bd<CR>

"==================================
" プラグイン設定
"==================================
" init
"-------------------------
filetype plugin indent off
" bundleの位置設定
if has( 'vim_starting' )
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand( '~/.vim/bundle/' ) )
endif

" NeoBundle
"--------------------------
" unite.vim
NeoBundle 'Shougo/unite.vim'
" vimshell
NeoBundle 'Shougo/vimshell'
" neocomplcache
NeoBundle 'Shougo/neocomplcache'
" zen-coding
NeoBundle 'mattn/zencoding-vim'
" YankRing
NeoBundle 'yankring'
" Rails
NeoBundle 'tpope/vim-rails'

" NeoBundle exit
"-------------------------
filetype plugin indent on

" neocomplcache
"-------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
 \ 'default' : '',
 \ 'vimshell' : $HOME.'/.vimshell_hist',
 \ 'scheme' : $HOME.'/.gosh_completions'
 \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
 let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Unite
"-------------------------
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
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
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

" Crontab用
set backupskip=/tmp/*,/private/tmp/*

