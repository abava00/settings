"settings
"map
"plugins
"font
"colorscheme
"~~~~~~~~~~~~~~~~~~~~~~

"settings
"ターミナルでも256色使えるようにする
set termguicolors
"256色
set t_Co=256
"なにこれ
au ColorScheme * hi Normal ctermbg=none
set background=dark
"文字コード変換
set encoding=utf-8
"gvimの文字化けを直したい
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim
"編集中のファイルが変更されたら自動で読み直す
set autoread
"バックアップファイルを作らない
set nobackup
"スワップファイルを作らない
set noswapfile
"バッファが編集中でもその他のファイルを開けるように
set hidden
"入力中のコマンドをステータスに表示する
set showcmd
"作業ディレクトリの自動移動
set autochdir
"クリップボードの有効化
set clipboard+=unnamedplus
"行番号を表示
set number
"現在の行を強調表示 重くなるかもしれない
set cursorline
"現在の列を強調表示
"set cursorcolumn
"行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
"インデントはスマートインデント
set smartindent
"ビープ音を可視化
"set visualbell
"ビープいらんでしょ
set belloff=all
"括弧入力時の対応する括弧を協調表示
set showmatch
"シンタックスハイライトの有効化
syntax enable
"￥を/に自動へんかんする
set shellslash
"vimのコマンドを見やすく
set wildmenu
"Tabを押すとファイル名前が補完できる :e [name]とかで
set wildmode=list,full
"不可視文字を可視化(タブが「?-」と表示される)
set list listchars=tab:\?\-
"Tab文字を半角スペースにする
set expandtab
"行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
"行頭でのTab文字の表示幅
set shiftwidth=2
"バックスペース系のあれこれ
"indent:オートオンデマンド機能によって挿入されたスペースを消せる(?)
"start:Insertに入ったときより前の文字を消せるようになる
"eol:改行文字を消せる
set backspace=indent,eol,start
"ファイルタイプに基づいたインデントを有効化
filetype plugin indent on
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
"検索時に最後まで行ったら最初に戻る
set wrapscan
"検索語をハイライト表示
set hlsearch
"カーソルの形を定義する
if has('vim_starting')
    "挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    "ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    "置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif
"補完してみようぜ的な？
"nvim-cmpと競合したためOFF
"set completeopt=menuone
"for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
"endfor
"前回編集箇所から再開する
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" | endif
    augroup END
"永続undo有効化,ファイルごとにundodirを生成する
if has('persistent_undo')
  set undodir=$HOME/.config/nvim/undodir
  set undofile
endif
"jjとかの次入力までの猶予時間の短縮
augroup timeout
  autocmd!
  autocmd InsertEnter * set timeoutlen=300
  autocmd InsertLeave * set timeoutlen=1000
  autocmd TermEnter * set timeoutlen=300
  autocmd TermLeave * set timeoutlen=1000
  autocmd CmdlineEnter * set timeoutlen=300
  autocmd CmdlineLeave * set timeoutlen=1000
augroup END
"利用シェルの変更
if has('win64') || has('win32')
  set sh=Powershell
elseif has('unix')
  set sh=bash
endif
"コマンドラインの高さの変更 なんかチカチカする
set cmdheight=0
"分割数が2以上ならばステータスラインを表示する 常に表示されてしまっている
set laststatus=0
"ポップアップの透明度
set winblend=30
set pumblend=30
"python3認識
let g:python3_host_prog = system('echo -n $(which python3)')
"settings end------------------------------------

"map
"jjでescを行うようにする
inoremap <silent>jj <ESC>
inoremap <silent>jk <ESC>
"範囲選択を同一行内検索で行う時に便利になるかもしれないやつ
vnoremap v iw
nnoremap <silent>VV vF
"画面の移動
nnoremap <Space>w <C-w><C-w>
"全て選択する
nnoremap <Space>a ggVG
"バッファ入れ替え
nnoremap <Space>bb :b
"バッファ削除
nnoremap <Space>bd :bd!<CR>
"バッファ移動
nnoremap <silent><A-j> :bn<CR>
nnoremap <silent><A-k> :bp<CR>
inoremap <silent><A-j> <ESC>:bn<CR>i
inoremap <silent><A-k> <ESC>:bp<CR>i
"inoremap ê <C-\><C-n>:bn<CR>i
"inoremap ë <C-\><C-n>:bn<CR>i
"vimrc の再起動
nnoremap <Space>, :source $MYVIMRC<CR>
"ターミナル起動(縦)
nnoremap <Space>bt :vs<CR> <C-w><C-w> :term<CR>
"ターミナル起動(横)
nnoremap <Space>br :sp<CR> <C-w><C-w> :term<CR>
"terminalでESCを押すとnormalモードになる
tnoremap <ESC> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>
tnoremap <silent>jj <C-\><C-n>
tnoremap ê <C-\><C-n>:bn<CR>i
tnoremap ë <C-\><C-n>:bn<CR>i
"単語関係の処理
nnoremap <Space>d diw
nnoremap <Space>c ciw
nnoremap <Space>y yiw
nnoremap <Space>v viw
"shift押すの面倒なの
nnoremap vi2 vi"
nnoremap di2 di"
nnoremap yi2 yi"
nnoremap ci2 ci"
nnoremap vi7 vi'
nnoremap di7 di'
nnoremap yi7 yi'
nnoremap ci7 ci'
nnoremap vi8 vi(
nnoremap di8 di(
nnoremap yi8 yi(
nnoremap ci8 ci(
nnoremap vi9 vi)
nnoremap di9 di)
nnoremap yi9 yi)
nnoremap ci9 ci)
"サラウンド.vim のコマンドが覚えられないので 簡易版として実装
nnoremap s <Nop>
nnoremap s" viw<ESC>bi"<ESC>ea"<ESC>
nnoremap s2 viw<ESC>bi"<ESC>ea"<ESC>
nnoremap s' viw<ESC>bi'<ESC>ea'<ESC>
nnoremap s7 viw<ESC>bi'<ESC>ea'<ESC>
nnoremap s( viw<ESC>bi(<ESC>ea)<ESC>
nnoremap s8 viw<ESC>bi(<ESC>ea)<ESC>
nnoremap s) viw<ESC>bi(<ESC>ea)<ESC>
nnoremap s9 viw<ESC>bi(<ESC>ea)<ESC>
nnoremap s{ viw<ESC>bi{<ESC>ea}<ESC>
nnoremap s} viw<ESC>bi{<ESC>ea}<ESC>
nnoremap s[ viw<ESC>bi[<ESC>ea]<ESC>
nnoremap s] viw<ESC>bi[<ESC>ea]<ESC>
nnoremap s< viw<ESC>bi<<ESC>ea><ESC>
nnoremap s> viw<ESC>bi<<ESC>ea><ESC>
"コロン・セミコロン問題に終止符
"nnoremap \ :
"行番号をF12で絶対表示と相対表示に切り替える ＊重くなるかもしれない
nnoremap <F12> :set relativenumber!<CR>
"行末を折り返すかを切り替える
nnoremap <F11> :set wrap!<CR>
"折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
"ESC連打でハイライト解除
nnoremap <silent><Esc><Esc> :nohlsearch<CR><Esc>
"Tab文字の入力
inoremap <C-x> <c-v><Tab>
"F1誤爆しても安心
noremap <F1> <ESC>
inoremap <F1> <ESC>
"代わりにF2でカーソル下の単語についてヘルプを出す、すごい！
function SophHelp()
  if &buftype=="help" && match( strpart( getline("."), col(".")-1,1), "\\S")<0
    bw
  else
    try
      exec "help ".expand("<cWORD>")
    catch /:E149:\|:E661:/
      " E149 no help for <subject>
      " E661 no <language> help for <subject>
      exec "help ".expand("<cword>")
    endtry
  endif
endfunc
nnoremap <silent> <F2> :call SophHelp()<CR>
inoremap <F2> <Esc><F2>
"keymap end------------------------------------

"plugins
if has('win64') || has('win32')
    if expand(glob('$LOCALAPPDATA\\vimfiles\\plugrc')) != ""
      source $LOCALAPPDATA\\nvim-data\\plugrc
    endif
elseif has('unix')
  if 1==1
    source $HOME/.config/nvim/plugrc
  endif
endif

"TeXの設定
"set concealcursor=""
"let g:tex_flavor='platex'
"let g:vimtex_view_method='general'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'
"let g:tex_conceal='a'

"vim-airlineの設定
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#whitespace#mixed_indent_algo=1
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
"unicode symbols
let g:airline_left_sep='»'
let g:airline_left_sep='▶'
let g:airline_right_sep='«'
let g:airline_right_sep='◀'
let g:airline_symbols.crypt='🔒'
let g:airline_symbols.linenr='☰'
let g:airline_symbols.linenr='␊'
let g:airline_symbols.linenr='␤'
let g:airline_symbols.linenr='¶'
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.maxlinenr='㏑'
let g:airline_symbols.branch='⎇'
let g:airline_symbols.paste='ρ'
let g:airline_symbols.paste='Þ'
let g:airline_symbols.paste='∥'
let g:airline_symbols.spell='Ꞩ'
let g:airline_symbols.notexists='∄'
let g:airline_symbols.whitespace='Ξ'
" powerline symbols
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr='Ξ'
"let g:airline_symbols.linenr='|'
let g:airline_symbols.maxlinenr=''
let g:airline_mode_map = {
  \ 'n'  : 'つーじょー',
  \ 'i'  : 'そーにゅー',
  \ 't'  : 'ピコピコ',
  \ 'R'  : 'おきかえ',
  \ 'c'  : 'コマンド',
  \ 'v'  : 'びじゅある',
  \ 'V'  : 'ぎょー選択',
  \ '' : 'くけー選択',
  \ } "は<c-v><c-v>で入力している
"plugins end------------------------------------


"font
"set guifont=Cica:h15
"set guifontwide=Cica:h15
"font end------------------------------------


"colorscheme
" colorscheme nord
colorscheme tender
"colorscheme end------------------------------------
