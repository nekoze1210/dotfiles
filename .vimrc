" NERDTree設定
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT

" 拡張子別でハイライトを設定
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

"タイトルをバッファ名に変更しない
set notitle
set shortmess+=I

"ターミナルで256色表示を使う
set t_Co=256

"内容が変更されたら自動的に再読み込み
set autoread

"Swapを作るまでの時間m秒
set updatetime=0

"Unicodeで行末が変になる問題を解決
"set ambiwidth=double

"バックスペースキーで行頭を削除する
set backspace=indent,eol,start

"titleを変更しない
set notitle

"beep音を出さない
set belloff=all

"コマンドラインでTABで補完できるようにする
set wildchar=<C-Z>

"改行後に「Backspace」キーを押すと上行末尾の文字を1文字消す
set backspace=2

"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

"コマンド、検索パターンを50まで保存
set history=50

"履歴に保存する各種設定
set viminfo='100,/50,%,<1000,f50,s100,:100,c,h,!

"バックアップを作成しない
set nobackup

"-------Search--------
"インクリメンタルサーチを有効にする
set incsearch

"大文字小文字を区別しない
set ignorecase

"大文字で検索されたら対象を大文字限定にする
set smartcase

"行末まで検索したら行頭に戻る
set wrapscan

"-------Format--------
"自動インデントを有効化する
set smartindent
set autoindent

"フォーマット揃えをコメント以外有効にする
set formatoptions-=c

"括弧の対応をハイライト
set showmatch

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"ターミナル上からの張り付けを許可
set paste

"タブ幅の設定 http://peace-pipe.blogspot.com/2006/05/vimrc-vim.html
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab

"-------Look&Feel-----
"TAB,EOFなどを可視化する
set list
set listchars=tab:>-,extends:<,trail:-

"検索結果をハイライトする
set hlsearch

"ルーラー,行番号を表示
set ruler
set number

"コマンドラインの高さ
set cmdheight=1

"マクロなどの途中経過を描写しない
set lazyredraw

"カーソルラインを表示する
set cursorline

"ウインドウタイトルを設定する
set title

"行を折り返さない
set nowrap

"自動文字数カウント
augroup WordCount
    autocmd!
    autocmd BufWinEnter,InsertLeave,CursorHold * call WordCount('char')
augroup END
let s:WordCountStr = ''
let s:WordCountDict = {'word': 2, 'char': 3, 'byte': 4}
function! WordCount(...)
    if a:0 == 0
        return s:WordCountStr
    endif
    let cidx = 3
    silent! let cidx = s:WordCountDict[a:1]
    let s:WordCountStr = ''
    let s:saved_status = v:statusmsg
    exec "silent normal! g\<c-g>"
    if v:statusmsg !~ '^--'
        let str = ''
        silent! let str = split(v:statusmsg, ';')[cidx]
        let cur = str2nr(matchstr(str, '\d\+'))
        let end = str2nr(matchstr(str, '\d\+\s*$'))
        if a:1 == 'char'
            " ここで(改行コード数*改行コードサイズ)を'g<C-g>'の文字数から引く
            let cr = &ff == 'dos' ? 2 : 1
            let cur -= cr * (line('.') - 1)
            let end -= cr * line('$')
        endif
        let s:WordCountStr = printf('%d/%d', cur, end)
    endif
    let v:statusmsg = s:saved_status
    return s:WordCountStr
endfunction

"ステータスラインにコマンドを表示
"set showcmd

"ステータスラインを常に表示
"set laststatus=2

"ファイルナンバー表示
"set statusline=[%n]

"ホスト名表示
"set statusline+=%{matchstr(hostname(),'\\w\\+')}@

"ファイル名表示
"set statusline+=%<%F

"変更のチェック表示
"set statusline+=%m

"読み込み専用かどうか表示
"set statusline+=%r

"ヘルプページなら[HELP]と表示
"set statusline+=%h

"プレビューウインドウなら[Prevew]と表示
"set statusline+=%w

"ファイルフォーマット表示
"set statusline+=[%{&fileformat}]

"文字コード表示
"set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]

"ファイルタイプ表示
"set statusline+=%y

"-------エンコード------
"ファイルタイプに応じて挙動,色を変える
syntax on
"filetype plugin on
"filetype indent on

"-------キー設定-------
"矢印キーでは表示行単位で行移動する
nmap <UP> gk
nmap <DOWN> gj
vmap <UP> gk
vmap <DOWN> gj

"------Vundle設定------
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
" My Bundles here:
Plugin 'preservim/nerdtree'
Plugin 'jpo/vim-railscasts-theme'

" lightline.vimの設定
Bundle 'itchyny/lightline.vim'
set laststatus=2

" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'fatih/vim-go'

filetype plugin indent on     " required!
