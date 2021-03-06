"======================================================================================================================================================
" 行为、按键映射、外观显示主题配置
"======================================================================================================================================================
set nocompatible  
set number  
set nobackup					"关闭自动备份功能
set noswapfile					"关闭swp文件
syntax enable  
syntax on						"打开高亮  
"colorscheme desert  
set nocompatible				"不要vim模仿vi模式  
"set foldmethod=indent "设置折叠  
source $VIMRUNTIME/vimrc_example.vim  
source $VIMRUNTIME/mswin.vim  
behave mswin
"========================================================================================================================
let g:snipMate = { 'snippet_version' : 0 }
"我的按键映射定义
inoremap jk <ESC>				"用jk键映射ESc键，快速退出编辑模式！
nnoremap mm o<ESC>				"用mm键映射o<ESC>键，快速键入mm，插入空行而不进入编辑模式！
nnoremap <C-j> i<CR><ESC>		"Ctrl+j在光标处断行
"nnoremap <S-j> Jx				"Shift+j,执行J合并光标所在行和下行为一行，同时删除J命令后出现的空格
"========================================================================================================================
"在normal模式下，先后按下 ,s 两个键执行_vimrc，而 ,v 则是编辑_vimrc
:nmap ,v :e $VIM/_vimrc<CR>
"使更新 _vimrc 更容易  :nmap 是绑定一个在normal模式下的快捷
:nmap ,s :source $VIM/_vimrc<CR>

"	nnoremap % :!start "E:\ProDesign\Source Insight 3\Insight3.exe" -i +=expand(line("."))
if has('gui_running') && has('win32')
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif
"set guioptions-=l				"隐藏左侧滚动条
"set guioptions-=b				"隐藏底部滚动条
set guioptions-=r				"隐藏右侧滚动条
"set showtabline=0				"隐藏Tab栏

set tabstop=4					"设置缩进参照  2015/09/29
set softtabstop=4 
set shiftwidth=4 
set noexpandtab 

set encoding=utf-8				"必须设置该项，否则Airline无法正常显示,但与此同时需要设置如下配置，否则会出现乱码
set fileencodings=utf-8,gbk,gb18030,gk2312
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
vnoremap . :norm.<CR>			"可视模式下，对于选中的文本，可以通过点命令来执行之前缓存的命令

if has("win32") 
	set clipboard=unnamed		"将Vim默认剪贴板设为系统剪贴板,是的系统剪贴板与Vim剪贴板互通互用
endif

"定制GUI界面  
"set go= "无菜单、工具栏"  
set go-=T
set go-=m

"高亮当前列 cuc
set cursorcolumn
"高亮当前行 cul
"set cursorline 

" 设置颜色主题
"colo solarized   "monokai  cool     
set background=dark "light
colorscheme solarized

"let mapleader = ","
" Allow to trigger background
function! ToggleBG()
	let s:tbg = &background
	" Inversion
	if s:tbg == "dark"
		set background=light
	else
		set background=dark
	endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>

"设置光标颜色为绿色
hi Cursor guibg=green					
" 设置显示字体 =>
" 在下面的Airline插件中设置字体（因为需要用到增加特殊图形字符的补丁字体）
"......

" 保存窗口大小、位置 
"set sessionoptions+=resize 
if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction
  
  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction
  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction
  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif
"===============================================================================================================================
"================2015/10/01研究配置=============================================================================================
"===============================================================================================================================
" 插件管理器Vunldle设置:
filetype off
"Vundle的路径
set rtp+=$VIM/vimfiles/bundle/Vundle.vim

"插件的安装路径
call vundle#begin('$VIM/vimfiles/bundle/')
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'L9'
  Plugin 'bling/vim-airline'
  Plugin 'tpope/vim-fugitive'					" 用于Airline显示Git分枝状态=> https://github.com/bling/vim-airline/wiki/FAQ
  Plugin 'altercation/vim-colors-solarized'	" 经典颜色主题
  Plugin 'uguu-org/vim-matrix-screensaver'		"Matrix屏保插件
  Plugin 'godlygeek/tabular'					"Markdown语法高亮显示插件
  Plugin 'plasticboy/vim-markdown'				
 					
  Plugin 'MarcWeber/vim-addon-mw-utils'			"Markdown代码补全插件
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  " Optional:
  Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()				" required

filetype plugin indent on		" required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-----------------------------------------------------------------------------------
"au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
let g:vim_markdown_frontmatter=1		"markdown对YAML语法做个配置
let g:vim_markdown_folding_disabled=1	"禁用了vim-markdown的自动折叠
"nnoremap <F8> :!cmd /c c:\Python27\python c:\Python27\scripts\markdown.py %:t -e chinese > %:r.html<CR> 
nnoremap <F8> :!cmd /c python c:\Python27\scripts\markdown2.py %:t > %:r.html<CR> 
noremap \e  :!cmd /c start ./%:r.html<CR>

" 状态按增强插件airline设置
set laststatus=2				"必须设置该项，否则状态栏无法显示
" 使用powerline打过补丁的字体
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10        "这种字体配置写法在Windows OS上很别扭，用下面的写法效果一样，但更容易理解~
"set guifont=Consolas\ for\ Powerline\ FixedD:h10:b:cANSI
if (has("win32") || has("win64"))
	set guifont=Consolas_for_Powerline_FixedD:h10:b:cANSI  "配置使用网友修改过的已加入箭头符号的字体，使用该字体，需要同时修改~vim\vimfiles\bundle\vim-airline\autoload\airline\init.vim中对应的符号Unicode码值（在word中插入符号中可看到具体数值）
else
	set guifont=Consolas\ for\ Powerline\ FixedD:h10:b:cANSI  
endif
"set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI  "使用该字体需从git上下载安装
"set guifont=DejaVu_Sans_Mono_for_Powerline:h10.5:b:cANSI
"set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI  "使用该字体需从git上下载安装
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '  "\u2b80
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
let g:airline_theme = 'dark'   "强制设置主题颜色(主题文件名见：~\vim-airline\autoload\airline\themes)，否则插件会自动根据主窗口主题自动匹配设置相应的主题 . Libin. 2015/10/1 研究  badwolf/badcat




"======================================================================================================================================================
" 国外专家的Vim显示增强配置(Find by Youtube) _20151004
"======================================================================================================================================================
"====[ Make the 81st column stand out ]====================
    " EITHER the entire 81st column, full-screen...
"    highlight ColorColumn ctermbg=magenta
"    set colorcolumn=81

    " OR ELSE just the 81st column of wide lines...
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%81v', 100)

    " OR ELSE on April Fools day...
"    highlight ColorColumn ctermbg=red ctermfg=blue
"    exec 'set colorcolumn=' . join(range(2,80,3), ',')

"=====[ Highlight matches when jumping to next ]=============

    " This rewires n and N to do the highlighing...
    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>

"    " EITHER blink the line containing the match...
"    function! HLNext (blinktime)
"        set invcursorline
"        redraw
"        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"        set invcursorline
"        redraw
"    endfunction
	

    " OR ELSE ring the match in red...
"    function! HLNext (blinktime)
"        highlight RedOnRed ctermfg=red guibg=red
"        let [bufnum, lnum, col, off] = getpos('.')
"        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
"        echo matchlen
"        let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
"                \ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
"                \ . '\|'
"                \ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
"                \ . '\|'
"                \ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
"        let ring = matchadd('RedOnRed', ring_pat, 101)
"        redraw
"        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"        call matchdelete(ring)
"        redraw
"    endfunction

    " OR ELSE briefly hide everything except the match...
"    function! HLNext (blinktime)
"        highlight BlackOnBlack ctermfg=black guibg=black
"        let [bufnum, lnum, col, off] = getpos('.')
"        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
"        let hide_pat = '\%<'.lnum.'l.'
"                \ . '\|'
"                \ . '\%'.lnum.'l\%<'.col.'v.'
"                \ . '\|'
"                \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
"                \ . '\|'
"                \ . '\%>'.lnum.'l.'
"        let ring = matchadd('BlackOnBlack', hide_pat, 101)
"        redraw
"        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"        call matchdelete(ring)
"        redraw
"    endfunction
"
    " OR ELSE just highlight the match in red...
    function! HLNext (blinktime)
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let target_pat = '\c\%#'.@/
		highlight WhiteOnRed ctermbg=green guibg=red
        let ring = matchadd('WhiteOnRed', target_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
    endfunction

"======================================================================================================================================================
" 启用Vim7.3 的持久撤销(重启后撤销历史可用 persistent undo) 
"======================================================================================================================================================
"Vim 7.3 提供 持久撤销 (Persistent Undo) 功能，即使文件关闭后，再次打开时仍然可以撤销文件关闭之前的编辑历史。要使用这一功能，在 vimrc 中添加:
set undofile	 "开启本功能。开启之后会默认在文件当前目录下建立一个 filename.ext.un~ 的文件，自然是会给我们带来麻烦的。所以配置一个 undodir 集中放置所有undofile。
if has("win32")
	set undodir=$VIM/vimfiles/\_undodir	"$VIMFILES 是我们之前在 vimrc 中定义的环境变量， windows 下是 $VIM/vimfiles/ 。注意，为了和其他目录区分，undodir前面有下划线 _undodir 。
										"因为有下划线，前面的反斜杠又不可少了。而且这个目录必须自己手动建立。如果不存在，Vim 是不会帮你自动建立的。
else	
	set undodir=$VIMFILES/\_undodir
endif

set undolevels=5000						"maximum number of changes that can be undone


"======================================================================================================================================================
" 网友配置参考
"======================================================================================================================================================
"编程快捷设置，参考链接：https://github.com/wsdjeg/DotFiles/blob/master/vimrc
" 映射Ctrl+上下左右来切换窗口
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Left> <C-W><Left>
nnoremap <C-Up> <C-W><Up>
nnoremap <C-Down> <C-W><Down>
""Ctrl+Shift+上下移动当前行
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
""上下移动选中的行
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
"设置移动行
"Normal 模式下<A-j> <A-k>移动当前行到下1行或上1行
"Visual模式下<A-j> <A-k>移动当前选中的多行到下1行或上1行
nnoremap <A-k>  mz:m-2<cr>`z==
nnoremap <A-j>  mz:m+<cr>`z==
xnoremap <A-k>  :m'<-2<cr>gv=gv
xnoremap <A-j>  :m'>+<cr>gv=gv
