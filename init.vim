" 基础
"
lua require('basic')

" Backup
" 禁止生成临时文件
set noswapfile          " disable temp files

set nobackup
set nowritebackup
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 快捷键
lua require('key-bindings')
" 自动加载
lua require('autocmds')

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"允许插件
"filetype plugin on

if has('gui_running') 
    set guioptions-=T  " no toolbar
    colorscheme elflord
    set lines=60 columns=108 linespace=0
    if has('gui_win32')
       set guifont=DejaVu_Sans_Mono:h10:cANSI
    else
       set guifont=DejaVu\ :Sans\ Mono\ 10
  endif
endif

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>

lua require('plugins')
lua require('plugin-config.nvim-tree')
lua require('plugin-config.bufferline')
lua require('plugin-config.nvim-treesitter')
lua require('plugin-config.comment')
lua require('plugin-config.telescope')
" 格式化插件
lua require('plugin-config.neoformat')
lua require('plugin-config.nvim-autopairs')
lua require('plugin-config.toggleterm')

" -- 内置LSP
lua require("lsp.setup")
lua require("lsp.cmp")
lua require("lsp.ui")
" -- 格式化
"-- require("lsp.formatter")
lua require("lsp.null-ls")

call plug#begin()
" 这里写上需要安装的插键
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'scrooloose/nerdtree'  " Famous file explorer plugin.
" Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'dracula/vim'
Plug 'jreybert/vimagit'
Plug 'dgryski/vim-godef'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Chiel92/vim-autoformat'
Plug 'posva/vim-vue'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  "Fuzzy search files/buffers etc, Ctrl-p.
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' } "All-in-one code completion plugin.
if has("nvim")

else " vim   
  Plug 'hit9/vim-go-syntax' "Fork from vim-go for syntax highlighting only.
endif
call plug#end()

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

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
" autocmd vimenter * NERDTree  "自动开启Nerdtree
"let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
"开启/关闭nerdtree快捷键
" map <C-w> :NERDTreeToggle<CR>
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
" 过滤: 所有指定文件和文件夹不显示
" let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
" 是否显示行号
"let g:NERDTreeShowLineNumbers=1
" 不显示隐藏文件 
" let g:NERDTreeHidden= 0
"Making it prettier
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1

" map <F3> :NERDTreeMirror<CR>
" map <F3> :NERDTreeToggle<CR>

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
if has("unix")
  let s:uname = system("uname -s")
  let g:ycm_server_python_interpreter='/usr/bin/python3'
  " Do Mac 
  if s:uname == "Darwin\n"
     let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.10/bin/python3'
     " let g:coc_node_path = '/opt/homebrew/bin/node'
     if !has("python") && !has("python3")
       let g:leaderf_loaded = 1
       let g:Lf_ShortcutF='<C-P>'
     endif
       let g:ycm_server_python_interpreter='/opt/homebrew/bin/python3'
  endif
endif
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

" terryma/vim-multiple-cursors
" let g:multi_cursor_use_default_mapping=0
" Default mapping
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'
