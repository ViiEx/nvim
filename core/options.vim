scriptencoding utf-8

" ================================================ "
" Section: Global Settings                         "
" ================================================ "

set number relativenumber
set nu rnu
set smarttab
set cindent
set expandtab
set hidden
set updatetime=300
set signcolumn=yes

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99

colorscheme gruvbox

if !empty(provider#clipboard#Executable())
  set clipboard+=unnamedplus
endif

set noswapfile

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

set ignorecase smartcase

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set linebreak
set showbreak=↪

set wildmode=list:longest

set scrolloff=3

set mouse=a
set mousemodel=popup

set noshowmode

set confirm

set visualbell noerrorbells
set history=500


set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set autowrite

set title
set titlestring=
set titlestring=%{utils#Get_titlestr()}

set undofile
set shortmess+=c
set shortmess+=S

set completeopt+=menuone
set completeopt-=preview

set pumheight=10
set pumblend=10

set winblend=5

set complete+=kspell complete-=w complete-=b complete-=u complete-=t

set spelllang=en,gr
set spellsuggest+=9

set formatoptions+=mM

set tildeop


if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

set termguicolors
