set nocp
set backspace=indent,eol,start
set t_Co=256
syntax enable
filetype plugin on

"set mouse=a
set selection=inclusive
set hlsearch
set expandtab
set autoread
set incsearch
"set so=7
set tabstop=4
set nosmarttab
set autoindent shiftwidth=4
"set smartindent
set wrap
"set autochdir
"set cindent
set cino=g0to(sus
set ignorecase
set shiftwidth=4
set iskeyword+=_,$,@,%,#
set ambiwidth=single
" use system clipboard
set clipboard=unnamedplus

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

syntax enable
filetype plugin on

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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

call vundle#begin()
" let Vundle manage Vundle

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'FuzzyFinder'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dracula/vim', { 'name': 'dracula' }
call vundle#end()            " required
filetype plugin indent on    " required

call pathogen#infect()
syntax on 
colorscheme dracula
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1
