" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @panda2bat

" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file=1
if empty(glob('~/.config/nvim/_machine_spefific.vim'))
	let hsa_machine_spefific_file=0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" ======================
" ==== Editor Setup ====
" ======================
" ===
" === System
" ===
" ===
" set clipboard=unnamedplus

let &t_ut=''
" 使配色更加兼容终端
set autochdir
" vim执行的命令会在当前目录下执行
scriptencoding utf-8
set encoding=utf-8
" 设置编码模式为utf-8


" ===
" === Editor behavior
" ===
" set exrc
" set secure
set number
" 显示行号
" set relativenumber
" 设置相对行号
set cursorline
" 设置光标所在行高亮显示
set noexpandtab
" 设置插入模式下缩进使用\t而非空格，如果希望设置空格替换\t，可以使用expandtab，但是对于非python的程序不方便，所以python的缩进稍后使用autocmd单独设置
set tabstop=4
" 设置插入模式按<tab>等于4空格
set shiftwidth=4
" 设置Normal模式下>>的缩进为4空格
set autoindent
" 设置自动缩进
set softtabstop=0
" 设置softtabstop(空格和\t混用)为关闭
" set list
" 设置显示不可见字符，例如空格，\t等
" set listchars=tab:▸\ ,trail:·
" 设置不可见字符的显示方式，该设置将\t设置为▸，将结尾符设置为·
set tw=0
" 设置文本的宽度
set scrolloff=10
" 设置光标上显示的行数，可以保持光标一直处于屏幕中间
set indentexpr=
" 设置是否使用indentexpr格式的缩进
set foldmethod=indent
" 启用折叠代码，折叠代码方式为indent，即根据缩进折叠；其他设置方式manual，根据指定行数折叠；syntax，根据语法折叠；marker，根据标记折叠
set foldlevel=99
" 计算相对于上一折叠级别的折叠级别
set foldenable
" 复位时打开所有的折叠
" set formatoptions-=tc
" 设置nvim中文本的注释和注释换行的方式；t：文本自动换；c：注释自动换行，同时在行首添加注释标记；r：添加新行时自动添加注释符；o：当用O或者o添加向新行时行首添加注释符；q：允许使用gq来格式化文本；2：第二行缩进两个字符；v：使用vi的换行方式，输入空格自动换行；b：在到达textwidth以前输入空格换行；l：在插入模式下不换行，只用gq完成相应工作
set splitright
" 设置新分割的窗口在右边
set splitbelow
" 设置新分割的窗口在下边
" set noshowmode
" 隐藏下方的-- INSTERT --
set showcmd
" 设置右下角显示当前操作
set wildmenu
" 启用增强模式的补全,输入部分命令后，按<tab>会有选项让选择
set ignorecase
" 设置正则表达式引擎忽略搜索模式的大小写
set smartcase
" 只能的判断是否区分正则模式的的大小，须在开启ignorecase的情况下才能生效
" set shortmess=atl
" 设置信息缩写，例如atl，启动时不显示援助乌干达儿童的提示
set inccommand=split
" nvim新功能，可以即时的预览命令的效果，split表示分屏预览，nosplit命令的效果会在原位置显示
" set completeopt=noinsert,menuone,noselect,preview
" 设置nvim默认的补全功能,参数包括menu，使用弹出菜单显示可能的选项，仅当存在足够多的选项时才弹出；menuone，只存在一个选项时也弹出；longest,只插入匹配项中最长的普通文本。noinsert，在用户选择前，不要插入匹配的文本；noselect，不在menu选项中选择匹配的项，强制用户选择。preview，显示当前补全选项的额外信息
set ttyfast
" 让滚动条划的更快
set lazyredraw 
" 处于性能考虑，避免不必要的重绘
set visualbell
" 设置响铃行为，errorbells，发出报错响铃（鸣叫或屏幕闪烁），使用noerrorbells；visualbell，屏幕闪烁，novisualbell，关闭；既不想屏幕闪烁，也不想鸣叫，set vb t_vb= 
" set colorcolumn=100
" 设置在第100个字符出显示颜色提示，很丑
" set virtualedit=block
" 虚拟编辑意味着光标可以定位在没有实际字符的地方。选项有待深入了解，暂时不进行设置

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" |endif
endif
" 设置打开文件后，光标停留在文件关闭时的位置
" au为autocmd的简写，命令的思路为，打开buff，判断上次退出文件时光标所在的行，如果不在第一行，那么执行exe命令，使用normal! g'跳转到指定的行（如果想同时跳转到指定的列，将g'替换为g`）

" ===
" === 设置备份文件夹
" ===
" silent !mkdir -p ~/.config/nvim/tmp/backup
" silent !mkdir -p ~/.config/nvim/tmp/undo
" silent隐式的执行命令
" set backupdir=~/.config/nvim/tmp/backup,.
" set directory=~/.config/nvim/tmp/backup,.
" 设置备份文件和缓存文件的目录，系统默认的目录为'$XDG_DATA_HOME/nvim/backup'，其中$XDG_DATA_HOME指的是~/.local/share/目录，这个设置可以，单没必要
" if has('presistent_undo')
"        set undofile
        " 开启undo文件功能
"        set undofile=~/.config/nvim/tmp/undo,.
        " 指定undofile保存的目录
" endif
set updatetime=1000
" 设置交换文件的刷新时间



" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll=1
" 没有找到解释，不启用
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
" terminal的键位映射，<C-N>进入类似于nvim窗口的Normal模式，可以输入命令
tnoremap <C-O> <C-\><C-N><C-O>
" terminal的键位映射，<C-O>退出termianl，但是会进入nvim的窗口，还需要使用:q退出
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

noremap st :split term://$SHELL<CR>
noremap vt :vs term://$SHELL<CR>
" 设置快捷键st和vt，水平或者垂直分屏打开终端

" ===
" === Basic Mappings
" ===
let mapleader=" "
" 设置 <LEADER>为<SPACE>。设置<LEADER>后，map <Leader>A，就等效于按<SPACE>A
" noremap ; :
" 将:利用快捷键绑定为;,不知道有何意义，不启用，留待观察

" Save & quit
" noremap Q :q<CR>
" noremap <C-q> :qa<CR>
" noremap S :w<CR>
" 设置保存和退出的快捷键，不启用

noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
" 快捷键，<SPACE>rc打开nvim的配置文件，:e命令用于打开修改过的文件

" ===
" === Window management
" ===
" Use <SPACE> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
" 光标在各个窗口间切换
noremap <LEADER>k <C-w>k
" 光标切换到上一个窗口
noremap <LEADER>j <C-w>j
" 光标切换到下一个窗口
noremap <LEADER>h <C-w>h
" 光标切换到左边的窗口，如果左边没有窗口，保持当前窗口不变
noremap <LEADER>l <C-w>l
" 光标切换到左边的窗口

" split the screens to up (horizontal), down(horizontal), left(vertical), right(vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
" Resize splited windows with arrow keys
function! Resize() 
    if get(winlayout(), 0) == "col"
		noremap <A--> :res -5<CR>
		noremap <A-=> :res +5<CR>
	elseif get(winlayout(), 0) == "row"
		noremap <A--> :vertical resize-5<CR>
		noremap <A-=> :vertical resize+5<CR>
	elseif get(winlayout(), 0) == "leaf"
		noremap <A--> <Nop>
		noremap <A-=> <Nop>
	endif
endfunction

autocmd WinEnter * call Resize()
" 自定义函数，通过winlayout()方法，然后使用get获取对应的值，进而判断当前的窗口是水平还是垂直分割，然后根据条件将快捷便分别绑定
" 通过WinEnter判断进入窗口事件，*表示进入任何事件，然后使用call调用Resize方法

" ===
" === Tab management
" ===
noremap tn :tabe<CR>
" :tabe,建立新的tab，绑定为tn
noremap th :-tabnext<CR>
" :-tabnext进入前一个tab，绑定为th
noremap tl :+tabnext<CR>
" :+tabnext进入下一个tab，绑定为tl
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>
" :tabmove移动tab，-表示一定到坐标，+表示移动到右边
" 但是貌似体会不到用途
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt
noremap <A-0> :tablast<CR>
" 类似苹果的，利用gt，直接跳转到指定tab

" ===
" === Markdown Settings
" ===
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Compile function
" ===
function! CompileRun()
	exec "w"
	if &filetype           == "c"
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype       == "java"
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype       == "sh"
		exec "!time bash %<"
	elseif &filetype       == "python"
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype       == "javascript"
		set splitbelow
		:sp
		:term export DEBUG  = "INFO,ERROR,WARNING"; node --trace-warnings
	elseif &filetype       == "go"
		set splitbelow
		:sp
		:term go run .
	endif
endfunction
noremap <LEADER>run :call CompileRun()<CR>
" 自定义函数，使用<SPCAE>run运行当前脚本，支持c,python,javascript,java,go；原理有些不太懂，但是明白了大概的思路

" ===
" === Dress up my vim
" ===
set termguicolors
let $NVIM_TUI_ENABLE_TREU_COLOR=1

" hi NonText ctermfg=gray guifg=grey10


" ===
" === Install Plugins with Vim-Plug
" ===
" 安装vim插件

call plug#begin('~/.config/nvim/plugged')

" Treesitter
" 该插件作用为高亮显示语法
" Plug 'nvim-treesitter/nvim-treesitter' ,{'commit': '3c07232'}
" Plug 'nvim-treesitter/playground', {'commit': '3c07232'}
" 需要使用nightly版本的nvim


" Pretty Dress
" 高亮显示主题
Plug 'theniceboy/nvim-deus'

" Stats line
" 状态栏
Plug 'ojroques/vim-scrollstatus'

" General Highlighter
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" 该插件显示程序中的颜色数据，以颜色快的方式进行显示
Plug 'RRethy/vim-illuminate'
" 该插件显示程序中光标下单词在程序中其他位置的显示

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" 著名的NETD tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" fzf文件搜索
Plug 'airblade/vim-rooter'
" vim支持工程目录
Plug 'pechorin/any-jump.vim'

" Vim snippets
Plug 'theniceboy/vim-snippets'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 传说中的coc.vim

" table line of nvim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

" Align
Plug 'junegunn/vim-easy-align'

" Theme
" 安装主题
Plug 'ayu-theme/ayu-vim'

" 增加R支持
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'gaalcaras/ncm-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

call plug#end()
" 表示插件配置结束

" ===
" === Plugin Set结束


" ======================== Plugin Settings =================================

" ===
" === coc.nvim
" ===

let g:coc_global_extensions = [
	\ 'coc-python',
	\ 'coc-vimlsp', 
	\ 'coc-yaml', 
	\ 'coc-snippets',
	\ 'coc-sh',
	\ 'coc-pairs',
	\ 'coc-syntax',
	\ 'coc-git', 
	\ 'coc-jedi',
	\ 'coc-highlight']
" 安装coc扩展支持

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 使coc补全时可以像vscode一样，按<TAB>进行补全，而非输入\t

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" 在空白行，使用<CTRL>和<SPACE>打开补全菜单

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 按下回车，补全输入，同时不跳到下一行

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" 使用[g和]g在报错之间跳转

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" GoTo code navigation.跳转到函数定义的地方

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" nomel模式下的noremap，使用K打开函数的文档文件

" ===
" === NERDTree
" ===
noremap <F3> :NERDTree<CR>

let g:NERDTreeShowBookmarks = 0
" 开启NERDTree时自动显示Bookmark

" ===
" === Vim Easy Align
" ===
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)

" ===
" === My theme
" ===
let ayucolor="dark"
colorscheme ayu
