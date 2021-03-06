set nocompatible               " be iMproved
filetype off                   " required for vundle

" autocommit vimrc
autocmd! bufwritepost .vimrc source %

set background=dark

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Bundles
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
"Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'leshill/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'taxilian/vim-web-indent'
Plugin 'tpope/vim-markdown'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-perl/vim-perl'
Plugin 'othree/html5.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rking/ag.vim'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'lambdatoast/elm.vim'
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on     " required!
syntax on
set mouse=a
scriptencoding utf-8

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"

" use default osx clipboard
set clipboard=unnamed

" always switch to the current file directory.
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" replace all by default
set gdefault

set spell
set history=1000
set shortmess+=filmnrxoOtT

let g:solarized_termcolors=256
"let base16colorspace=256
color solarized 
"color base16-default
set showmode
set cursorline

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set showcmd

" Use relative line numbers
set rnu

if has('statusline')
    set laststatus=2
  
    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start  " backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set expandtab                   " use spaces
set wrap                        " wrap long lines
set linebreak                   " wrap on word boundaries
set textwidth=0                 " don't insert line breaks
set wrapmargin=0                " don't insert line breaks
set formatoptions+=l
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent
"set matchpairs+=<:>                " match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd BufNewFile,BufRead *.tt set filetype=html

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType xml setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType java setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType json setlocal ts=3 sts=3 sw=3 expandtab
autocmd FileType perl setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType tt setlocal ts=4 sts=4 sw=4 expandtab

let mapleader = ','
nnoremap Y y$

" clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a== :Tabularize /==<CR>
vmap <Leader>a== :Tabularize /==<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
nmap <Leader>a], :Tabularize /],<CR>
vmap <Leader>a], :Tabularize /],<CR>
nmap <Leader>a] :Tabularize /]<CR>
vmap <Leader>a] :Tabularize /]<CR>

" The following function automatically aligns when typing a
" supported character
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction


let g:ctrlp_working_path_mode = 2
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|target$',
    \ 'file': '\v\.(exe|so|dll|class)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

" comma comma to remove highlighting
map <silent> <Leader><Leader> :nohlsearch<cr>

" Fugative
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" Use ag to match files
let g:ctrlp_user_command = 'ag --skip-vcs-ignores %s -l --nocolor -g ""'

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7\<Esc>]Pl00bdff\<Esc>\\" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7\<Esc>]Plccaa55\<Esc>\\" " Block in normal mode
endif

com! FormatJSON %!python -m json.tool
