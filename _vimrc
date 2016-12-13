"======================================================================================================================================================
" ��Ϊ������ӳ�䡢�����ʾ��������
"======================================================================================================================================================
set nocompatible  
set number  
set nobackup					"�ر��Զ����ݹ���
set noswapfile					"�ر�swp�ļ�
syntax enable  
syntax on						"�򿪸���  
"colorscheme desert  
set nocompatible				"��Ҫvimģ��viģʽ  
"set foldmethod=indent "�����۵�  
source $VIMRUNTIME/vimrc_example.vim  
source $VIMRUNTIME/mswin.vim  
behave mswin
"========================================================================================================================
"�ҵİ���ӳ�䶨��
inoremap jk <ESC>				"��jk��ӳ��ESc���������˳��༭ģʽ��
nnoremap mm o<ESC>				"��mm��ӳ��o<ESC>�������ټ���mm��������ж�������༭ģʽ��
nnoremap <C-j> i<CR><ESC>		"Ctrl+j�ڹ�괦����
nnoremap <S-j> Jx				"Shift+j,ִ��J�ϲ���������к�����Ϊһ�У�ͬʱɾ��J�������ֵĿո�
"========================================================================================================================
"��normalģʽ�£��Ⱥ��� ,s ������ִ��_vimrc���� ,v ���Ǳ༭_vimrc
:nmap ,v :e $VIM/_vimrc<CR>
"ʹ���� _vimrc ������  :nmap �ǰ�һ����normalģʽ�µĿ��
:nmap ,s :source $VIM/_vimrc<CR>

"	nnoremap % :!start "E:\ProDesign\Source Insight 3\Insight3.exe" -i +=expand(line("."))
if has('gui_running') && has('win32')
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif
"set guioptions-=l				"������������
"set guioptions-=b				"���صײ�������
set guioptions-=r				"�����Ҳ������
"set showtabline=0				"����Tab��

set tabstop=4					"������������  2015/09/29
set softtabstop=4 
set shiftwidth=4 
set noexpandtab 

set encoding=utf-8				"�������ø������Airline�޷�������ʾ,�����ͬʱ��Ҫ�����������ã�������������
set fileencodings=utf-8,gbk,gb18030,gk2312
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8
vnoremap . :norm.<CR>			"����ģʽ�£�����ѡ�е��ı�������ͨ����������ִ��֮ǰ���������

if has("win32") 
	set clipboard=unnamed		"��VimĬ�ϼ�������Ϊϵͳ������,�ǵ�ϵͳ��������Vim�����廥ͨ����
endif

"����GUI����  
"set go= "�޲˵���������"  
set go-=T
set go-=m

"������ǰ�� cuc
set cursorcolumn
"������ǰ�� cul
"set cursorline 

" ������ɫ����
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

"���ù����ɫΪ��ɫ
hi Cursor guibg=green					
" ������ʾ���� =>
" �������Airline������������壨��Ϊ��Ҫ�õ���������ͼ���ַ��Ĳ������壩
"......

" ���洰�ڴ�С��λ�� 
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
"================2015/10/01�о�����=============================================================================================
"===============================================================================================================================
" ���������Vunldle����:
filetype off
"Vundle��·��
set rtp+=$VIM/vimfiles/bundle/Vundle.vim

"����İ�װ·��
call vundle#begin('$VIM/vimfiles/bundle/')
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'L9'
  Plugin 'bling/vim-airline'
  Plugin 'tpope/vim-fugitive'					" ����Airline��ʾGit��֦״̬=> https://github.com/bling/vim-airline/wiki/FAQ
  Plugin 'altercation/vim-colors-solarized'	" ������ɫ����
  Plugin 'uguu-org/vim-matrix-screensaver'		"Matrix�������
  Plugin 'godlygeek/tabular'					"Markdown�﷨������ʾ���
  Plugin 'plasticboy/vim-markdown'				
 					
  Plugin 'MarcWeber/vim-addon-mw-utils'			"Markdown���벹ȫ���
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
let g:vim_markdown_frontmatter=1		"markdown��YAML�﷨��������
let g:vim_markdown_folding_disabled=1	"������vim-markdown���Զ��۵�
"nnoremap <F8> :!cmd /c c:\Python27\python c:\Python27\scripts\markdown.py %:t -e chinese > %:r.html<CR> 
nnoremap <F8> :!cmd /c python c:\Python27\scripts\markdown2.py %:t > %:r.html<CR> 
noremap \e  :!cmd /c start ./%:r.html<CR>

" ״̬����ǿ���airline����
set laststatus=2				"�������ø������״̬���޷���ʾ
" ʹ��powerline�������������
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10        "������������д����Windows OS�Ϻܱ�Ť���������д��Ч��һ���������������~
"set guifont=Consolas\ for\ Powerline\ FixedD:h10:b:cANSI
if (has("win32") || has("win64"))
	set guifont=Consolas_for_Powerline_FixedD:h10:b:cANSI  "����ʹ�������޸Ĺ����Ѽ����ͷ���ŵ����壬ʹ�ø����壬��Ҫͬʱ�޸�~vim\vimfiles\bundle\vim-airline\autoload\airline\init.vim�ж�Ӧ�ķ���Unicode��ֵ����word�в�������пɿ���������ֵ��
else
	set guifont=Consolas\ for\ Powerline\ FixedD:h10:b:cANSI  
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
" �������òο�
"======================================================================================================================================================
"��̿�����ã��ο����ӣ�https://github.com/wsdjeg/DotFiles/blob/master/vimrc
" ӳ��Ctrl+�����������л�����
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Left> <C-W><Left>
nnoremap <C-Up> <C-W><Up>
nnoremap <C-Down> <C-W><Down>
""Ctrl+Shift+�����ƶ���ǰ��
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
""�����ƶ�ѡ�е���
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
"�����ƶ���
"Normal ģʽ��<A-j> <A-k>�ƶ���ǰ�е���1�л���1��
"Visualģʽ��<A-j> <A-k>�ƶ���ǰѡ�еĶ��е���1�л���1��
nnoremap <A-k>  mz:m-2<cr>`z==
nnoremap <A-j>  mz:m+<cr>`z==
xnoremap <A-k>  :m'<-2<cr>gv=gv
xnoremap <A-j>  :m'>+<cr>gv=gv
