    set nocompatible  
    set number  
	set nobackup  "�ر��Զ����ݹ���
	set noswapfile "�ر�swp�ļ�
    syntax enable  
    syntax on "�򿪸���  
    "colorscheme desert  
    set nocompatible "��Ҫvimģ��viģʽ  
"   set foldmethod=indent "�����۵�  
    source $VIMRUNTIME/vimrc_example.vim  
    source $VIMRUNTIME/mswin.vim  
    behave mswin
" ��jk��ӳ��ESc���������Ƴ��༭ģʽ��
	inoremap jk <ESC>
" ��mm��ӳ��o<ESC>�������ټ���mm��������ж�������༭ģʽ��
	nnoremap mm o<ESC>
"	nnoremap % :!start "E:\ProDesign\Source Insight 3\Insight3.exe" -i +=expand(line("."))
" ������������  2015/09/29
	set tabstop=4 
	set softtabstop=4 
	set shiftwidth=4 
	set noexpandtab 
" ����ģʽ�£�����ѡ�е��ı�������ͨ����������ִ��֮ǰ���������
	vnoremap . :norm.<CR>

 
 " ������ʾ���� 
if has("win32") 
    "set guifont=Courier_New:h11:cANSI 
    "set guifont=YaHei\ Mono:h11 
    "set guifontwide=Microsoft\ Yahei\ Monotype:h11 
    "set guifont=YaHei\ Consolas\ Hybrid:h12 
    set guifont=Consolas:h10:b:cANSI 
endif 
" ������ɫ����
	colo solarized "cool     
    
"======================================================================================================================================================
"================2015/10/01�о�����===================
"--------------------------------------------------
" ���ò��������Vunldle:
filetype off

"Vundle��·��
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"����İ�װ·��
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
set encoding=utf-8		"�������ø������Airline�޷�������ʾ,�����ͬʱ��Ҫ�����������ã�������������
set fileencodings=utf-8,gbk,gb18030,gk2312
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8

" ״̬����ǿ���airline����
set laststatus=2       " �������ø������״̬���޷���ʾ
" ʹ��powerline�������������
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10        "������������д����Windows OS�Ϻܱ�Ť���������д��Ч��һ���������������~
"set guifont=Consolas\ for\ Powerline\ FixedD:h10:b:cANSI
set guifont=Consolas_for_Powerline_FixedD:h10:b:cANSI  "����ʹ�������޸Ĺ����Ѽ����ͷ���ŵ����壬ʹ�ø����壬��Ҫͬʱ�޸�~vim\vimfiles\bundle\vim-airline\autoload\airline\init.vim�ж�Ӧ�ķ���Unicode��ֵ����word�в�������пɿ���������ֵ��
"set guifont=DejaVu_Sans_Mono_for_Powerline:h10:b:cANSI  "ʹ�ø�������ѽ��git�����ذ�װ
let g:airline_powerline_fonts = 1
" ����tabline
let g:airline#extensions#tabline#enabled = 1
" tabline�е�ǰbuffer���˵ķָ��ַ�
let g:airline#extensions#tabline#left_sep = ' '
" tabline��δ����buffer���˵ķָ��ַ�
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline��buffer��ʾ���
let g:airline#extensions#tabline#buffer_nr_show = 1
" ӳ���л�buffer�ļ�λ
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
let g:airline_theme = 'badwolf'   "ǿ������������ɫ(�����ļ�������~\vim-airline\autoload\airline\themes)�����������Զ����������������Զ�ƥ��������Ӧ������ . Libin. 2015/10/1 �о�


" Powerline���ò������ѱ�Airlineȡ��������װ���øò��
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
" ����ר�ҵ�Vim��ʾ��ǿ����(Find by Youtube) _20151004
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
" ����Vim7.3 �ĳ־ó���(����������ʷ���� persistent undo) 
"======================================================================================================================================================
"Vim 7.3 �ṩ �־ó��� (Persistent Undo) ���ܣ���ʹ�ļ��رպ��ٴδ�ʱ��Ȼ���Գ����ļ��ر�֮ǰ�ı༭��ʷ��Ҫʹ����һ���ܣ��� vimrc �����:
set undofile	 "���������ܡ�����֮���Ĭ�����ļ���ǰĿ¼�½���һ�� filename.ext.un~ ���ļ�����Ȼ�ǻ�����Ǵ����鷳�ġ���������һ�� undodir ���з�������undofile��
if has("win32")
	set undodir=$VIM/vimfiles/\_undodir	"$VIMFILES ������֮ǰ�� vimrc �ж���Ļ��������� windows ���� $VIM/vimfiles/ ��ע�⣬Ϊ�˺�����Ŀ¼���֣�undodirǰ�����»��� _undodir ��
										"��Ϊ���»��ߣ�ǰ��ķ�б���ֲ������ˡ��������Ŀ¼�����Լ��ֶ���������������ڣ�Vim �ǲ�������Զ������ġ�
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
    if(has("win32") || has("win95") || has("win64") || has("win16")) "�ж���ǰ����ϵͳ����  
        let g:iswindows=1  
    else  
        let g:iswindows=0  
    endif  
    autocmd BufEnter * lcd %:p:h  
      
    if has("autocmd")  
        filetype plugin indent on "�����ļ���������  
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
    set tabstop=4 "��һ��tab����4���ո�  
    set vb t_vb=  
    set nowrap "���Զ�����  
    set hlsearch "������ʾ���  
    set incsearch "������Ҫ����������ʱ��vim��ʵʱƥ��  
    set backspace=indent,eol,start whichwrap+=<,>,[,] "�����˸����defʹ��  
    if(g:iswindows==1) "��������ʹ��  
        "��ֹlinux�ն����޷�����  
        if has('mouse')  
            set mouse=a  
        endif  
        au GUIEnter * simalt ~x  
    endif  
      
    "����GUI����  
    set go= "�޲˵���������"  
      
    "����Python�ı���&����(F5���нű���F6����ű�  
    autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
    autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
    autocmd BufRead *.py nmap <F5> :!python %<CR>  
    autocmd BufRead *.py nmap <F6> :make<CR>  
    autocmd BufRead *.py copen "�����py�ļ�����ͬʱ�򿪱�����Ϣ����  
      
    "NERDTree,�ṩ�鿴�ļ��۵�/չ���б���  
    nmap <F2> :NERDTreeToggle<CR>  
    "imap <F2> <ESC> :NERDTreeToggle<CR>  
      
    "����Tlist������  
    "filetype on  
    let Tlist_Show_Menu = 1  
    "TlistUpdate���Ը���tags  
    map <F3> :silent! Tlist<CR>  "����F3�Ϳ��Ժ���Taglist  
    let Tlist_Ctags_Cmd='ctags' "��Ϊ���Ƿ��ڻ�����������Կ���ֱ��ִ��  
    let Tlist_Use_Right_Window=0 "�ô�����ʾ���ұߣ�0�Ļ�������ʾ�����  
    let Tlist_Show_One_File=1 "��taglist����ͬʱչʾ����ļ��ĺ����б������ֻ��1��������Ϊ1  
    let Tlist_File_Fold_Auto_Close=1 "�ǵ�ǰ�ļ��������б��۵�����  
    let Tlist_Exit_OnlyWindow=1 "��taglist�����һ���ָ��ʱ���Զ��˳�vim  
    let Tlist_Process_File_Always=0 "�Ƿ�һֱ����tags.1:����;0:������  
    let Tlist_Inc_Winwidth=0  
    "set tags=C:\Program Files\Vim\vim73\Tags "����tags�ļ�·��  
      
      
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
      
"    "��NERD_commenter������  
"    "let NERDShutUp=1  
"      
"    " ʹ��F8��  
"    "nnoremap <silent> <F8> :TlistToggle<CR>  
"      
"    "�����ļ������������ʾ��ʽ  
"    "ͨ��WinManager�������TagList���ں�netrw������������  
"    let g:winManagerWindowLayout='FileExplorer|TagList'  
"    nmap wm :WMToggle<cr>  
"      
"    "����PythonDict��Tab�Զ���ȫ����  
"    filetype plugin on   
"    let g:pydiction_location = 'C:\Program Files\Vim\vim73\tools\pydiction\complete-dict'  
"    let g:pydiction_menu_height = 20  

" ���洰�ڴ�С 
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
	
