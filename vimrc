
set nocompatible
" remeber the position of last exit
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
     \| exe "normal g'\"" | endif
endif

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
set encoding=utf-8
set fileencodings=utf-8,gbk

colorscheme desert
filetype plugin on
set number
set nobackup
set hlsearch
set incsearch
set ignorecase
syntax on


" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " http://vim-scripts.org/vim/scripts.html
    Bundle 'EasyGrep'
    Bundle 'syntastic'
    Bundle 'taglist-plus'
    Bundle 'bufexplorer.zip'
    Bundle 'winmanager'
    Bundle 'lookupfile'
    Bundle 'genutils'
    Bundle 'The-NERD-Commenter'
    "Bundle 'Markdown-syntax'
    "Bundle 'vim-markdown'
    "Bundle 'Markdown'
    Bundle 'srcexpl'
    "Bundle 'nerdtree-ack'
    Bundle 'Textile-for-VIM'
    "Bundle 'instant-markdown.vim'
    Bundle 'minibufexpl.vim'
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " non vim-scripts repos on github
    Bundle 'gmarik/vundle'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'https://github.com/hallison/vim-markdown.git'
    Bundle 'https://github.com/suan/vim-instant-markdown.git'
    " cvim
    Bundle 'https://github.com/WolfgangMehner/vim-plugins.git'
    " tabular
    Bundle 'https://github.com/godlygeek/tabular.git'
    " tcomment
    Bundle 'https://github.com/tomtom/tcomment_vim.git'
    " non github repos
    "Bundle 'git://git.wincent.com/command-t.git'
    Bundle 'https://github.com/scrooloose/nerdtree.git'
    Bundle 'https://github.com/jistr/vim-nerdtree-tabs.git'
    Bundle 'https://github.com/Xuyuanp/git-nerdtree.git'
    Bundle 'https://github.com/bling/vim-airline.git'

    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
nmap <silent> <F12> :Sexplore!<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "left"
let NERDTreeShowBookmarks=1
nmap <silent> <F7> :NERDTreeTabsToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口 
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Auto_Open = 0
nmap <silent> <F8> :TlistToggle<cr>
set tags=/home/lg2841/work/tbea/zlg3352/tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
cs add /home/lg2841/work/tbea/zlg3352/tags/cscope.out /home/lg2841/work/tbea/zlg3352/tags
set csverb
nmap <C-i>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-i>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-i>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-i>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-i>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-i>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-i>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap <C-i>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0
nmap <silent> <F9> :SrcExplToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufExplorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0 " Do not show default help.
let g:bufExplorerShowRelativePath=1 " Show relative paths.
let g:bufExplorerSortBy='mru' " Sort by most recently used.
let g:bufExplorerSplitRight=0 " Split left.
let g:bufExplorerSplitVertical=1 " Split vertically.
let g:bufExplorerSplitVertSize = 30 " Split width
let g:bufExplorerUseCurrentWindow=1 " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 
nmap <silent> <F10> :BufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" miniBufExplorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" winManager setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
" nmap <silent> <F6>wm :WMToggle<cr> 

let mapleader=','
"  this is ) and [ and } test
"imap jj <ESC>/[)}\]]<RETURN><Right>i
