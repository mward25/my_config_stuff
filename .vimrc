set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" These lines may be ignored
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
		Plugin 'VundleVim/Vundle.vim'

	" The following are examples of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	" plugin on GitHub repo
	Plugin 'tpope/vim-fugitive'

	" plugin from http://vim-scripts.org/vim/scripts.html
	" Plugin 'L9'
	" Git plugin not hosted on GitHub
	Plugin 'git://git.wincent.com/command-t.git'

	" git repos on your local machine (i.e. when working on your own plugin)
	" Plugin 'file:///home/gmarik/path/to/plugin'
	" The sparkup vim script is in a subdirectory of this repo called vim.
	" Pass the path to set the runtimepath properly.
	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

	" Install L9 and avoid a Naming conflict if you've already installed a
	" different version somewhere else.
	" Plugin 'ascenator/L9', {'name': 'newL9'}


" My Syntax Plugins ( I did not create them )
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'octol/vim-cpp-enhanced-highlight'
" Plugin 'OrangeT/vim-csharp' " didn't like this one much

" Other Plugins
Plugin 'Yggdroot/indentLine' 


" All of your Plugins must be added before the following line
call vundle#end()            " required




filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line


call plug#begin()
	Plug 'crusoexia/vim-monokai'
call plug#end()

set backupdir=~/vim_backup
set directory=~/vim_backup

syntax on
set backspace=2
set autoindent
set smartindent
set noexpandtab
set number
set mouse=a
set spell spelllang=en_us

" start NERDtree
autocmd VimEnter * NERDTree

" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap { {}<left>
" inoremap [ []<left>
colorscheme monokai
" colorscheme monokai

" colorscheme sublimemonokai

