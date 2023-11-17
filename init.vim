set relativenumber
set mouse=a
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set encoding=utf-8
set fileencoding=utf-8
set nobackup 
set nowritebackup
set showmatch
set softtabstop=4
set path+=**
set hlsearch
syntax enable
filetype plugin indent on
set backspace=indent,eol,start

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/mfussenegger/nvim-dap'
Plug 'https://github.com/simrat39/rust-tools.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/hrsh7th/cmp-buffer'
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/onsails/lspkind-nvim'
Plug 'https://github.com/dinhhuy258/git.nvim'
Plug 'https://github.com/lewis6991/gitsigns.nvim'

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
let &shellpipe='2>&1| tee'
let $TMP='"C:\tmp"'

"let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
"let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
"let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
"let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
"set shellquote= shellxquote=
"set noshelltemp

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

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

lua require('configs')
