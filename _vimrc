    set nocompatible  
    set number  
	set nobackup  "关闭自动备份功能
	set noswapfile "关闭swp文件
    syntax enable  
    syntax on "打开高亮  
    "colorscheme desert  
    set nocompatible "不要vim模仿vi模式  
"   set foldmethod=indent "设置折叠  
    source $VIMRUNTIME/vimrc_example.vim  
    source $VIMRUNTIME/mswin.vim  
    behave mswin
" 用jk键映射ESc键，快速推出编辑模式！
	inoremap jk <ESC>
" 用mm键映射o<ESC>键，快速键入mm，插入空行而不进入编辑模式！
	nnoremap mm o<ESC>
"	nnoremap % :!start "E:\ProDesign\Source Insight 3\Insight3.exe" -i +=expand(line("."))
" 设置缩进参照  2015/09/29
	set tabstop=4 
	set softtabstop=4 
	set shiftwidth=4 
	set noexpandtab 
" 可视模式下，对于选中的文本，可以通过点命令来执行之前缓存的命令
	vnoremap . :norm.<CR>

 
 " 设置显示字体 
if has("win32") 
    "set guifont=Courier_New:h11:cANSI 
    "set guifont=YaHei\ Mono:h11 
    "set guifontwide=Microsoft\ Yahei\ Monotype:h11 
    "set guifont=YaHei\ Consolas\ Hybrid:h12 
    set guifont=Consolas:h10:b:cANSI 
endif 
" 设置颜色主题
	colo solarized "cool     
    
"======================================================================================================================================================
"================2015/10/01研究配置===================
"--------------------------------------------------
" 设置插件管理器Vunldle:
filetype off

"Vundle的路径
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"插件的安装路径
call vundle#begin('$VIM/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on	" required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"--------------------------------------------------
set encoding=utf-8		"必须设置该项，否则Airline无法正常显示,但与此同时需要设置如下配置，否则会出现乱码
set fileencodings=utf-8,gbk,gb18030,gk2312
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8

" 状态按增强插件airline设置
set laststatus=2       " 必须设置该项，否则状态栏无法显示
" 使用powerline打过补丁的字体
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10        "这种字体配置写法在Windows OS上很别扭，用下面的写法效果一样，但更容易理解~
"set guifont=Consolas\ for\ Powerline\ FixedD:h10:b:cANSI
set guifont=Consolas_for_Powerline_FixedD:h10:b:cANSI  "配置使用网友修改过的已加入箭头符号的字体，使用该字体，需要同时修改~vim\vimfiles\bundle\vim-airline\autoload\airline\init.vim中对应的符号Unicode码值（在word中插入符号中可看到具体数值）
"set guifont=DejaVu_Sans_Mono_for_Powerline:h10:b:cANSI  "使用该字体需呀从git上下载安装
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
let g:airline_theme = 'badwolf'   "强制设置主题颜色(主题文件名见：~\vim-airline\autoload\airline\themes)，否则插件会自动根据主窗口主题自动匹配设置相应的主题 . Libin. 2015/10/1 研究


" Powerline设置参数，已被Airline取代，不安装配置该插件
 "powerline{
	"set guifont=PowerlineSymbols\ for\ Powerline
	"set encoding=utf-8
"  	set nocompatible
"	set laststatus=2
"	set t_Co=256
"	let g:Powerline_symbols = 'fancy'
"	set guifont=Consolas\ for\ Powerline\ FixedD:h10
    "let g:Powerline_symbols="fancy"
 "}
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

set undolevels=5000 "maximum number of changes that can be undone

"======================================================================================================================================================
    set diffexpr=MyDiff()  
    function MyDiff()  
      let opt = '-a --binary '  
      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif  
      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif  
      let arg1 = v:fname_in  
      if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif  
      let arg2 = v:fname_new  
      if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif  
      let arg3 = v:fname_out  
      if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif  
      let eq = ''  
      if $VIMRUNTIME =~ ' '  
        if &sh =~ '\<cmd'  
          let cmd = '""' . $VIMRUNTIME . '\diff"'  
          let eq = '"'  
        else  
          let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'  
        endif  
      else  
        let cmd = $VIMRUNTIME . '\diff'  
      endif  
      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq  
    endfunction  
      
    "  
    if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型  
        let g:iswindows=1  
    else  
        let g:iswindows=0  
    endif  
    autocmd BufEnter * lcd %:p:h  
      
    if has("autocmd")  
        filetype plugin indent on "根据文件进行缩进  
        augroup vimrcEx  
            au!  
            autocmd FileType text setlocal textwidth=78  
            autocmd BufReadPost *  
                        \ if line("'\"") > 1 && line("'\"") <= line("$") |  
                        \ exe "normal! g`\"" |  
                        \ endif  
        augroup END  
    else  
        set autoindent " always set autoindenting on   
    endif " has("autocmd")  
    set tabstop=4 "让一个tab等于4个空格  
    set vb t_vb=  
    set nowrap "不自动换行  
    set hlsearch "高亮显示结果  
    set incsearch "在输入要搜索的文字时，vim会实时匹配  
    set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的def使用  
    if(g:iswindows==1) "允许鼠标的使用  
        "防止linux终端下无法拷贝  
        if has('mouse')  
            set mouse=a  
        endif  
        au GUIEnter * simalt ~x  
    endif  
      
    "定制GUI界面  
    set go= "无菜单、工具栏"  
      
    "配置Python的编译&运行(F5运行脚本，F6编译脚本  
    autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
    autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
    autocmd BufRead *.py nmap <F5> :!python %<CR>  
    autocmd BufRead *.py nmap <F6> :make<CR>  
    autocmd BufRead *.py copen "如果是py文件，则同时打开编译信息窗口  
      
    "NERDTree,提供查看文件折叠/展开列表功能  
    nmap <F2> :NERDTreeToggle<CR>  
    "imap <F2> <ESC> :NERDTreeToggle<CR>  
      
    "进行Tlist的设置  
    "filetype on  
    let Tlist_Show_Menu = 1  
    "TlistUpdate可以更新tags  
    map <F3> :silent! Tlist<CR>  "按下F3就可以呼出Taglist  
    let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行  
    let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边  
    let Tlist_Show_One_File=1 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1  
    let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏  
    let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动退出vim  
    let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理  
    let Tlist_Inc_Winwidth=0  
    "set tags=C:\Program Files\Vim\vim73\Tags "设置tags文件路径  
      
      
    map <F12> :call Do_CsTag()<CR>  
    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>  
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>  
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
    function Do_CsTag()  
        let dir = getcwd()  
        if filereadable("tags")  
            if(g:iswindows==1)  
                let tagsdeleted=delete(dir."\\"."tags")  
            else  
                let tagsdeleted=delete("./"."tags")  
            endif  
            if(tagsdeleted!=0)  
                echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None  
                return  
            endif  
        endif  
        if has("cscope")  
            silent! execute "cs kill -1"  
        endif  
        if filereadable("cscope.files")  
            if(g:iswindows==1)  
                let csfilesdeleted=delete(dir."\\"."cscope.files")  
            else  
                let csfilesdeleted=delete("./"."cscope.files")  
            endif  
            if(csfilesdeleted!=0)  
                echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None  
                return  
            endif  
        endif  
        if filereadable("cscope.out")  
            if(g:iswindows==1)  
                let csoutdeleted=delete(dir."\\"."cscope.out")  
            else  
                let csoutdeleted=delete("./"."cscope.out")  
            endif  
            if(csoutdeleted!=0)  
                echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None  
                return  
            endif  
        endif  
        if(executable('ctags'))  
            "silent! execute "!ctags -R --c-types=+p --fields=+S *"  
            silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."  
        endif  
        if(executable('cscope') && has("cscope") )  
            if(g:iswindows!=1)  
                silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"  
            else  
                silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"  
            endif  
            silent! execute "!cscope -b"  
            execute "normal :"  
            if filereadable("cscope.out")  
                execute "cs add cscope.out"  
            endif  
        endif  
    endfunction  
      
"    "对NERD_commenter的设置  
"    "let NERDShutUp=1  
"      
"    " 使用F8打开  
"    "nnoremap <silent> <F8> :TlistToggle<CR>  
"      
"    "设置文件浏览器窗口显示方式  
"    "通过WinManager插件来将TagList窗口和netrw窗口整合起来  
"    let g:winManagerWindowLayout='FileExplorer|TagList'  
"    nmap wm :WMToggle<cr>  
"      
"    "设置PythonDict用Tab自动补全功能  
"    filetype plugin on   
"    let g:pydiction_location = 'C:\Program Files\Vim\vim73\tools\pydiction\complete-dict'  
"    let g:pydiction_menu_height = 20  

" 保存窗口大小 
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
	
