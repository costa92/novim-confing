set sw=4
set ts=4
set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
set nu
set expandtab
set nocp
set ru
set tabstop=4

set shiftwidth=4

set autoindent  "自动对齐

set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

set showmatch
set matchtime=5
set cindent 
" 在复制/粘贴过程中保持缩进
set pastetoggle=<F2>
filetype on


lua require('key-bindings')


" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全
set completeopt=preview,menu
"允许插件
"filetype plugin on
"共享剪贴板
"set clipboard+=unnamed
"自动保存
set autowrite
set autowriteall
"set ruler                   " 打开状态栏标尺
"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
""set foldcolumn=0
""set foldmethod=indent
""set foldlevel=3
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase

syntax on

if has('gui_running') 
    set guioptions-=T  " no toolbar
    colorscheme elflord
    set lines=60 columns=108 linespace=0
    if has('gui_win32')
       set guifont=DejaVu_Sans_Mono:h10:cANSI
    else
       set guifont=DejaVu\ Sans\ Mono\ 10
  endif
endif



"将tab替换为空格
nmap tt :%s/\t/    /g<CR>

call plug#begin()
" 这里写上需要安装的插键
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'  " Famous file explorer plugin.
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'jreybert/vimagit'
Plug 'dgryski/vim-godef'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Chiel92/vim-autoformat'
Plug 'posva/vim-vue'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  "Fuzzy search files/buffers etc, Ctrl-p.
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' } "All-in-one code completion plugin.
if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter'
else " vim   
  Plug 'hit9/vim-go-syntax' "Fork from vim-go for syntax highlighting only.
endif
call plug#end()

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'unique_tail'


" nerdtree
" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" If another buffer tries to replace NERDTree, put it in the other window, and
" bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"   \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <F3> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" let NERDTreeChDirMode=1
"显示书签"
" let NERDTreeShowBookmarks=1
"设置忽略文件类型"
" let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
" let NERDTreeWinSize=25
" autocmd vimenter * NERDTree  "自动开启Nerdtree
" let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
" let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'
" let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
" let g:NERDTreeShowLineNumbers=0 " 是否显示行号
" let g:NERDTreeHidden=0     "不显示隐藏文件
"Making it prettier
" let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
" nnoremap <F3> :NERDTreeToggle<CR> 
"开启/关闭nerdtree快捷键
"Plugin :: scrooloose/nerdtree ------------------------------------------------ {{{
autocmd vimenter * NERDTree  "自动开启Nerdtree
"let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
"开启/关闭nerdtree快捷键
map <C-f> :NERDTreeToggle<CR>
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 过滤: 所有指定文件和文件夹不显示
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
" 是否显示行号
"let g:NERDTreeShowLineNumbers=1
" 不显示隐藏文件 
let g:NERDTreeHidden= 0
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" End Plugin :: scrooloose/nerdtree ----------------------------------------- }}}

"Fold
set nofoldenable
set foldlevelstart=99
set foldmethod=indent
set foldcolumn=0 "number of columns showing the foldlevels on the left sidebar.
set foldlevel=0
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo  "Which commands trigger auto-unfold
" 设置为自动关闭折叠  
set foldclose=all  "Close all folds (which level>foldlevel) automatically when cursor leaves.
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
autocmd FileType c,go,python,javascript,bitproto,protobuf setlocal foldenable "Enable folding for programming purpose.



"golang
"Processing... % (ctrl+c to stop)
let g:fencview_autodetect=0
let g:go_version_warning = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }
let g:go_fmt_fail_silently = 1
set rtp+=$GOROOT/misc/vim



" 主题预览配置
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:Powerline_symbols='fancy'
let Powerline_symbols='fancy'
set t_Co=256 " 状态栏就有颜色了


"yuCompleteMe配置相关
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" 主题
colorscheme molokai
let g:molokai_original = 1
let g:molokai_original = 1

" vim-godef 配置
" go 函数
autocmd FileType go nnoremap <buffer> gd :call GodefUnderCursor() <cr>
autocmd FileType go nnoremap <buffer> <C-]> :call GodefUnderCursor() <cr>
let g:godef_split=3  "左右打开新窗口的时候
let g:godef_same_file_in_same_window=1 "函数在同一个文件中时不需要打开新窗口

" indentLine
let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'

nmap <F8> :TagbarToggle<CR>

" syntastic
let g:syntastic_javascript_checkers = ['eslint']
" 此后在 Vim 中保存（:w） JavaScript 时就会触发风格检查， 你也可以使用
" :SyntasticCheck 来手动触发。 如果需要 location list （:help lnext）
" 来导航错误列表，需要设置 Syntastic 填充 location list：
let g:syntastic_always_populate_loc_list = 1 
" 更多 syntastic 配置可参考：https://github.com/vim-syntastic/syntastic

" 配置 vim-autoformat
let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
let g:formatters_javascript = ['eslint']
noremap <F4> :Autoformat<CR>:w<CR>

" Yggdroot/LeaderF  
" https://github.com/Yggdroot/LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

" vue
let g:vue_pre_processors = ['pug', 'scss']
