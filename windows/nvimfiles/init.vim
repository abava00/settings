"拡張機能
source $HOME/nvim/plugrc
"setting
" 256色
set t_Co=256
"ターミナルでも256色使えるようにする
set termguicolors
au ColorScheme * hi Normal ctermbg=none
set background=dark

"文字コード変換
set encoding=utf-8
"gvimの文字化けを直したい
"まあ上の utf-8を消せばいいだけなんだけどさ
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
"クリップボードの有効化
set clipboard+=unnamedplus
"前回編集箇所から再開する
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" | endif
    augroup END
"jjでescを行うようにする
inoremap <silent>jj <ESC>
"1バッファ入れ替え
nnoremap <Space>b :b

"見た目系
" 行番号を表示
set number
"行番号をF12で絶対表示と相対表示に切り替える 重くなるかもしれない
map <F12> :set relativenumber!<CR>
"現在の行を強調表示 重くなるかもしれない
set cursorline
" 現在の列を強調表示
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell
"ビープいらんでしょ
set belloff=all
" 括弧入力時の対応する括弧を協調表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
noremap k gk
" シンタックスハイライトの有効化
syntax enable
"￥を/に自動へんかんする
set shellslash
"vimのコマンドを見やすく
set wildmenu
"ターミナルを起動させる(Powershell) 横
noremap <Space>t  :sp<CR><c-w><c-w> :terminal Powershell<CR>
"ターミナルを起動させる<(Powershell)縦
noremap <Space>r  :vs<CR><c-w><c-w> :terminal powershell<CR>
" Tab系
" 不可視文字を可視化(タブが「?-」と表示される)
set list listchars=tab:\?\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
"Tabを押すとファイル名前が補完できる :e [name]とかで
set wildmode=list,full
"バックスペース系のあれこれ
"indent:オートオンデマンド機能によって挿入されたスペースを消せる(?)
"start:Insertに入ったときより前の文字を消せるようになる
"eol:改行文字を消せる
set backspace=indent,eol,start

"括弧の補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>


"
""複数のタブとしてテキストを表示""""""""""""""""""""""""""""""""""
"" Anywhere SID
"function! s:SID_PREFIX()
"  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
"endfunction
"
"" Set tabline.
"function! s:my_tabline()  "{{{
"  let s = ''
"  for i in range(1, tabpagenr('$'))
"    let bufnrs = tabpagebuflist(i)
"    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
"    let no = i  " display 0-origin tabpagenr.
"    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
"    let title = fnamemodify(bufname(bufnr), ':t')
"    let title = '[' . title . ']'
"    let s .= '%'.i.'T'
"    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
"    let s .= no . ':' . title
"    let s .= mod
"    let s .= '%#TabLineFill# '
"  endfor
"  let s .= '%#TabLineFill#%T%=%#TabLine#'
"  return s
"endfunction "}}}
"let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
"set showtabline=2 " 常にタブラインを表示
"
"" The prefix key.
"nnoremap    [Tag]   <Nop>
"nmap    t [Tag]
"" Tab jump
"for n in range(1, 9)
"  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
"endfor
"" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
"
"map <silent> [Tag]c :tablast <bar> tabnew<CR>
"" tc 新しいタブを一番右に作る
"map <silent> [Tag]x :tabclose<CR>
"" tx タブを閉じる
"map <silent> [Tag]n :tabnext<CR>
"" tn 次のタブ
"map <silent> [Tag]p :tabprevious<CR>
"" tp 前のタブ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"TeXの設定
"set concealcursor=""
"let g:tex_flavor='platex'
"let g:vimtex_view_method='general'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'
"let g:tex_conceal='a'

"vim-airlineの設定
"Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"フォントの設定
set guifont=Cica:h15
set guifontwide=Cica:h15

"テーマ
"colorscheme hybrid
colorscheme evening
