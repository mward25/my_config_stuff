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
	"Plugin 'git://git.wincent.com/command-t.git'

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
Plugin 'crusoexia/vim-monokai'
Plugin 'vim-scripts/Conque-GDB'
" Plugin 'luochen1990/indent-detector.vim' " this plugin is also bothersome
" Plugin 'ycm-core/YouCompleteMe' " This pluging is kind of annoying
"
"
" For refactoring
Plugin 'prabirshrestha/vim-lsp'


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



" Configure refactoring
if executable('ccls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ccls',
        \ 'cmd': {server_info->['ccls']},
        \ 'allowlist': ['cpp'],
        \ })
endif
let g:lsp_format_sync_timeout = 1000

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    " nmap <buffer> gs <plug>(lsp-document-symbol-search)
    " nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    " nmap <buffer> gr <plug>(lsp-references)
    " nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    " nmap <buffer> <leader>rn <plug>(lsp-rename)
    " nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    " nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    " nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction


augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


set backupdir=~/vim_backup
set directory=~/vim_backup

syntax on
set backspace=2
set autoindent
set smartindent
set noexpandtab
set number
" set mouse=a
set spell spelllang=en_us

" Make vim terminal better
hi Terminal ctermbg=black


" start NERDtree
"autocmd VimEnter * NERDTree

" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap { {}<left>
" inoremap [ []<left>
colorscheme monokai

" Disable vim-lsp reference highlighting
let g:lsp_document_highlight_enabled = 0
" colorscheme monokai

" colorscheme sublimemonokai

" set ycm_auto_trigger off
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
