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
" ��VimĬ�ϼ�������Ϊϵͳ������,�ǵ�ϵͳ��������Vim�����廥ͨ����
if has("win32") 
	set clipboard=unnamed
endif

 " ������ʾ���� 
if has("win32") 
    "set guifont=Courier_New:h11:cANSI 
    "set guifont=YaHei\ Mono:h11 
    "set guifontwide=Microsoft\ Yahei\ Monotype:h11 
    "set guifont=YaHei\ Consolas\ Hybrid:h12 
    set guifont=Consolas:h10:b:cANSI 
endif 
" ������ɫ����
	colo solarized   "monokai  cool     
    
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
" vim-fugitive: invoke most by :Gdiff
" ---------------------------------------------------
Plugin 'tpope/vim-fugitive'      " ����Airline��ʾGit��֦״̬=> https://github.com/bling/vim-airline/wiki/FAQ

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
if (has("win32") || has("win64"))
	set guifont=Consolas_for_Powerline_FixedD:h10:b:cANSI  "����ʹ�������޸Ĺ����Ѽ����ͷ���ŵ����壬ʹ�ø����壬��Ҫͬʱ�޸�~vim\vimfiles\bundle\vim-airline\autoload\airline\init.vim�ж�Ӧ�ķ���Unicode��ֵ����word�в�������пɿ���������ֵ��
else
	set guifont=Consolas\ for\ Powerline\ FixedD:h10:b:cANSI  "����ʹ�������޸Ĺ����Ѽ����ͷ���ŵ����壬ʹ�ø����壬��Ҫͬʱ�޸�~vim\vimfiles\bundle\vim-airline\autoload\airline\init.vim�ж�Ӧ�ķ���Unicode��ֵ����word�в�������пɿ���������ֵ��
endif
"set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI  "ʹ�ø��������git�����ذ�װ
"set guifont=DejaVu_Sans_Mono_for_Powerline:h10.5:b:cANSI
"set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI  "ʹ�ø��������git�����ذ�װ
let g:airline_powerline_fonts = 1
" ����tabline
let g:airline#extensions#tabline#enabled = 1
" tabline�е�ǰbuffer���˵ķָ��ַ�
let g:airline#extensions#tabline#left_sep = ' '  "\u2b80
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

set undolevels=5000						"maximum number of changes that can be undone

"======================================================================================================================================================
" �����ʾ��������
"======================================================================================================================================================
"����GUI����  
"set go= "�޲˵���������"  
set go-=T
set go-=m
"������ǰ�� cuc
set cursorcolumn
"������ǰ�� cul
"set cursorline 
"���ù����ɫΪ��ɫ
hi Cursor guibg=green					

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

"======================================================================================================================================================
" �������òο�
"======================================================================================================================================================
"��̿�����ã��ο����ӣ�https://github.com/wsdjeg/DotFiles/blob/master/vimrc
" ӳ��Ctrl+�����������л�����
"nnoremap <C-Right> <C-W><Right>
"nnoremap <C-Left> <C-W><Left>
"nnoremap <C-Up> <C-W><Up>
"nnoremap <C-Down> <C-W><Down>
""Ctrl+Shift+�����ƶ���ǰ��
"nnoremap <C-S-Down> :m .+1<CR>==
"nnoremap <C-S-Up> :m .-2<CR>==
"inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
"inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
""�����ƶ�ѡ�е���
"vnoremap <C-S-Down> :m '>+1<CR>gv=gv
"vnoremap <C-S-Up> :m '<-2<CR>gv=gv
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i

