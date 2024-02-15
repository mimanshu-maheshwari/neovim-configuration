set number
set relativenumber

set mouse=a

set encoding=utf-8
set fileencoding=utf-8
set nobackup 
set nowritebackup
set path+=**

set autoindent
set signcolumn=yes
set smarttab
set softtabstop=2
set tabstop=2
set shiftwidth=2

set hlsearch
set showmatch

set foldmethod=syntax
set nofoldenable
set foldnestmax=10
set foldlevel=2

"set spell
"setlocal spell spelllang=en_us

syntax enable
filetype plugin on
filetype indent on
set backspace=indent,eol,start

set updatetime=300

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/neoclide/coc.nvim', {'do': 'npm ci'}
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/mfussenegger/nvim-dap'
Plug 'https://github.com/simrat39/rust-tools.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-lua/popup.nvim'
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/hrsh7th/cmp-path'
Plug 'https://github.com/hrsh7th/cmp-buffer'
Plug 'https://github.com/hrsh7th/vim-vsnip'
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/onsails/lspkind-nvim'
Plug 'https://github.com/dinhhuy258/git.nvim'
Plug 'https://github.com/lewis6991/gitsigns.nvim'
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'https://github.com/lervag/vimtex'
" Plug 'https://github.com/xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

" nertree setup
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-f> :NERDTreeFind<CR>


let &shell='bash.exe'
let &shellcmdflag = '-c'
let &shellredir = '>%s 2>&1'
set shellquote= shellxescape=
set noshelltemp
set shellxquote=
let &shellpipe='2>&1 | tee'
let $TMP="~/tmp"

set dir=~/tmp

"let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
"let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
"let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
"let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
"set shellquote= shellxquote=
"set noshelltemp

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:livepreview_previewer = 'mupdf'

"lua require('vimtex-config')
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
"filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
"syntax enable

" let g:vimtex_quickfix_mode=0

" let g:vimtex_view_general_viewer = 'SumatraPDF'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let maplocalleader = ","


let g:mkdp_auto_close=1
let g:mkdp_browser='"C:\Program Files\Google\Chrome\Application\chrome.exe"'

"function OpenMarkdownPreview (url)
"  execute "silent ! chrome --new-window " . a:url
"endfunction
"let g:mkdp_browserfunc = 'OpenMarkdownPreview'

"let g:coc_global_extensions=]
"   \'coc-markdownlint', 
"   \'coc-highlight', 
"   \'coc-vetur',
"   \'coc-go'
"   \]

lua require('configs')

