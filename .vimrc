set nocp
set backspace=indent,eol,start
set t_Co=256
syntax enable
filetype plugin on

"set mouse=a
set selection=inclusive
set hlsearch
set expandtab
set smarttab
set autoread
set incsearch
"set so=7
set tabstop=4
set autoindent shiftwidth=4
set smartindent
set wrap
"set autochdir
set cindent
set cino=g0to(sus
set ignorecase
set shiftwidth=4
set iskeyword+=_,$,@,%,#
set ambiwidth=single
" use system clipboard
set clipboard=unnamedplus

" good!!! 
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i
"inoremap $t <><esc>i
"
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>
"
"map j <C-f>
"map <space> <C-f>
map n <C-b>

"
let mapleader="," 
map <silent><leader>w : w<cr>
map <silent><leader>qa : qa<cr>
map <silent><leader>qq : q!<cr>
map <silent><leader>wq : wq<cr>
map <silent><leader>q : q<cr>
map <silent><leader>s :source /home/listar/.vimrc <cr>
"Taglist
map <silent><leader>tl :TlistToggle<cr>
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1

let &termencoding=&encoding
set fileencodings=utf-8,cp936,ucs-bom,gbk
"set fileencoding=cp936
set fileencoding=utf-8
"set encoding=cp936
set encoding=utf-8
" cscope
if has("cscope")
set csprg=/usr/bin/cscope
set csto=1
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out
endif
set csverb
endif
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" bufexploer
map <silent><leader>be :BufExplorer<cr>
map <silent><leader>bs :BufExplorerHorizontalSplit<cr>
map <silent><leader>bv :BufExplorerVerticalSplit<cr>
" quickfix
nmap <F6> :cn<cr> 
nmap <F7> :cp<cr>
"nmap <F5> :make<cr>
nmap <F8> :cw<cr>
" select all && copy
map <C-a> ggVG
"map <C-c> "+y
"map <C-v> "+p
" press control + s to save
"imap <C-c> <ESC> :w<cr>
"nmap <C-c> <ESC> :w<cr>
" quick jump between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" NERD_tree
map <silent><leader>t :NERDTreeToggle<cr>
" another explorer
map <silent><leader>e :Ex<cr>
" only one window
"map <silent><leader>m :only<cr>
" A.vim
map <silent><leader>a :A<cr>
" omnicppcomplete
set completeopt=menu
let OmniCpp_SelectFirstItem = 0
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags+=/home/listar/cppstltags
" pydiction
let g:pydiction_location = '/home/listar/.vim/tools/pydiction/complete-dict'
"php set
"au FileType php source /usr/share/vim/vim72/colors/murphy.vim
let g:phpColor = "murphy"
let g:defaultColor = "desert"
"au! FileType * exe ":colorscheme " . g:defaultColor
"au! FileType php exe ":colorscheme " . g:phpColor

" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" don't auto select for me
let g:neocomplcache_enable_auto_select = 0
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" don't popup the completion list
let g:neocomplcache_disable_auto_complete = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Ignore case
let g:neocomplcache_enable_ignore_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' 
" let supertab use tab to complete
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
" code_complete
let g:completekey="<c-j>"
"colorscheme desert256
syntax enable
filetype plugin on
"hi normal ctermbg=black
"imap jj <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if(has("win32") || has("win95") || has("win64") || has("win16"))
let g:iswindows=1
else
let g:iswindows=0
endif
"µ¥¸öÎÄ¼þ±àÒë
    map <F5> :call Do_OneFileMake()<CR>
function Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
    echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
    return
    endif
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
    echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
    return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
if strlen(deletedspacefilename)!=strlen(sourcefileename)
    echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
    return
    endif
    if &filetype=="c"
    if g:iswindows==1
    set makeprg=gcc\ -g\ -o\ %<.exe\ %
    else
    set makeprg=gcc\ -g\ -std=c99\ -o\ %<\ %
    endif
    elseif &filetype=="cpp"
    if g:iswindows==1
    set makeprg=g++\ -g\ -o\ %<.exe\ %
    else
    set makeprg=g++\ -g\ -o\ %<\ %
    endif
    "elseif &filetype=="cs"
    "set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
    endif
if(g:iswindows==1)
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','.exe','g')
    let toexename=outfilename
    else
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','','g')
    let toexename=outfilename
    endif

    if filereadable(outfilename)
if(g:iswindows==1)
    let outdeletedsuccess=delete(getcwd()."\\".outfilename)
    else
    let outdeletedsuccess=delete("./".outfilename)
    endif
if(outdeletedsuccess!=0)
    set makeprg=make
    echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
    return
    endif
    endif
    execute "silent make"
    set makeprg=make

    execute "normal :"
    if filereadable(outfilename)
if(g:iswindows==1)
    execute "!".toexename
    else
    execute "!./".toexename
    endif
    else
    execute "copen"
    endif
    redraw!

    endfunction

    "½øÐÐmakeµÄÉèÖÃ
    "map <F6> :call Do_make()<CR>
    "map <c-F6> :silent make clean<CR>
function Do_make()
    set makeprg=make
    execute "silent make"
    execute "copen"
    endfunction
    map <F9> :set paste<CR>
    map <F10> :set nopaste<CR>

" behave like mswin
"source $VIMRUNTIME/mswin.vim
"behave mswin

" session and viminfo
"au VimLeave * mksession! ~/.vim/session/%:t.session
"au VimLeave * wviminfo! ~/.vim/session/%:t.viminfo

" vim template
autocmd BufNewFile *.cpp 0 r ~/.vim/template/cpp.tpl
autocmd BufNewFile *.c 0 r ~/.vim/template/gnuc.tpl
autocmd BufNewFile *.py 0 r ~/.vim/template/python.tpl

" minibufexpl.vim
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplModSelTarget=1

" <tag> autocomplete
function! InsertHtmlTag()
        let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
        normal! a>
        let save_cursor = getpos('.')
        let result = matchstr(getline(save_cursor[1]), pat)
        if (search(pat, 'b', save_cursor[1]))
           normal! lyiwf>
           normal! a</
           normal! p
           normal! a>
        endif
        :call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
endfunction
inoremap > <ESC>:call InsertHtmlTag()<CR>a
" html indent setting
au FileType html,python,vim,javascript setl shiftwidth=4
au FileType html,python,vim,javascript setl tabstop=4

" mark.vim
"source ~/.vim/plugin/mark.vim

" change the cursor shape
"if has("autocmd")
  "au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  "au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  "au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"endif

" settings of cscope.
" I use GNU global instead cscope because global is faster.
"set cscopetag
"set cscopeprg=gtags-cscope
set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-
nmap <silent> <leader>j <ESC>:cstag <c-r><c-w><CR>
nmap <silent> <leader>g <ESC>:lcs f c <c-r><c-w><cr>:lw<cr>
nmap <silent> <leader>s <ESC>:lcs f s <c-r><c-w><cr>:lw<cr>
command! -nargs=+ -complete=dir FindFiles :call FindFiles(<f-args>)
au VimEnter * call VimEnterCallback()
"au BufAdd *.[ch],*.cpp call FindGtags(expand('<afile>'))
au BufWritePost *.[ch],*.cpp call UpdateGtags(expand('<afile>'))
 
function! FindFiles(pat, ...)
     let path = ''
     for str in a:000
         let path .= str . ','
     endfor
 
     if path == ''
         let path = &path
     endif
 
     echo 'finding...'
     redraw
     call append(line('$'), split(globpath(path, a:pat), '\n'))
     echo 'finding...done!'
     redraw
endfunc
 
function! VimEnterCallback()
     for f in argv()
         if fnamemodify(f, ':e') != 'c' && fnamemodify(f, ':e') != 'h'
             continue
         endif
 
         call FindGtags(f)
     endfor
endfunc
 
function! FindGtags(f)
     let dir = fnamemodify(a:f, ':p:h')
     while 1
         let tmp = dir . '/GTAGS'
         if filereadable(tmp)
             silent exe 'cs kill -1'
             exe 'cs add ' . tmp . ' ' . dir
             break
         elseif dir == '/'
             break
         endif
 
         let dir = fnamemodify(dir, ":h")
     endwhile
endfunc
 
function! UpdateGtags(f)
     let dir = fnamemodify(a:f, ':p:h')
     exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
endfunction
map <F2> :call FindGtags(expand('<afile>'))<CR>

"if filereadable("GTAGS")
  "silent exe 'cs add GTAGS'
"endif

" abbre
abbre em zhangzhibiao01@baidu.com
" astyle
map <S-F> <Esc>:%! astyle<CR>
" large.vim
let g:LargeFile=50
" easymotion
let g:EasyMotion_leader_key = ';'
let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized
"colorscheme desert256
let g:molokai_original=0
colorscheme molokai
"colorscheme murphy

" auto load tags
function! AutoLoadCTagsAndCScope()
    let max = 15
    let dir = getcwd()
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . '/cscope.out')
            execute 'cs add ' . dir . '/cscope.out'
            let break = 1
        endif
        if filereadable(dir . '/tags')
            execute 'set tags =' . dir . '/tags'
            let break = 1
        endif
        if break == 1
            "execute 'lcd ' . dir
            break
        endif
        let dir = strpart(dir, 0, strridx(dir, "/"))
        let i = i + 1
    endwhile
endf
nmap <F7> :call AutoLoadCTagsAndCScope()<CR>


" vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Valloric/YouCompleteMe'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" syntastic
call pathogen#infect()
" ycm
let g:ycm_global_ycm_extra_conf = '/home/zhanglistar/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" ack & ag
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ycm_max_diagnostics_to_display = 0

Bundle 'wting/rust.vim'
