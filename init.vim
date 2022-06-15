" ================================================ "
" Title: NeoVim configuration                      "
" Author: ViiEx                                    "
" ================================================ "

" ================================================ "
" Section: Plugins                                 "
" ================================================ "

call plug#begin('~/.vim/plugged')

" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Started Migration to build
" in lsp
Plug 'neovim/nvim-lspconfig'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'preservim/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch' : 'v2.x'}
Plug 'kdheepak/lazygit.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
Plug 'mhinz/vim-startify'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'

call plug#end()

" ================================================ "
" Section: Global Settings                         "
" ================================================ "

set number relativenumber
set nu rnu
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

colorscheme gruvbox

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

let g:airline#extensions#tabline#left_sep = ""
let g:airline#extensions#tabline#right_sep = ""


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ctrlp#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#xkblayout#enabled = 1

let g:airline#extensions#tabline#formatter = 'default'  " f/p/file-name.js
let g:airline#extensions#tabline#formatter = 'jsformatter' " path-to/f
let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " f/p/file-name.js

let g:mapleader = "\<Space>"

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

let g:which_key_map =  {}
let g:which_key_centered = 0

let g:blamer_enabled = 1

lua require('config')

"let g:coc_global_extensions = [
"  \ 'coc-snippets',
"  \ 'coc-pairs',
"  \ 'coc-tsserver',
"  \ 'coc-eslint', 
"  \ 'coc-prettier', 
"  \ 'coc-json', 
"  \ 'coc-css'
"  \ ]

"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"command! -nargs=0 Format :call CocAction('format')
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

call which_key#register('<Space>', "g:which_key_map")

" ================================================ "
" Section: Custom Functions                        "
" ================================================ "

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! Floating_Diagnostic() abort
  execute :lua vim.diagnostic.open_float()
endfunction

"function! ShowDocumentation()
"  if CocAction('hasProvider', 'hover')
"    call CocActionAsync('doHover')
"  else
"    call feedkeys('K', 'in')
"  endif
"endfunction

" ================================================ "
" Section: Mappings                                "
" ================================================ "

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

let g:which_key_map['g'] = { 
      \ 'name' : '+Git',
      \ 'g' : ['LazyGit', 'LazyGit'],
      \ }

let g:which_key_map['b'] = {
      \ 'name' : '+Tabs',
      \ 'n' : ['bn', 'Next Tab'],
      \ 'p' : ['bp', 'Preview Tab']
      \}

inoremap jk <ESC>
:tnoremap <Esc> <C-\><C-n>
nmap <C-s> :w<CR>
nmap <C-n> :NeoTreeShowToggle<CR>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nmap <silent> [g :lua vim.diagnostic.goto_prev()<CR>
nmap <silent> ]g :lua vim.diagnostic.goto_next()<CR>

"nmap <F2> <Plug>(coc-rename)

"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"nmap <leader>ac  <Plug>(coc-codeaction)
"nmap <leader>qf  <Plug>(coc-fix-current)

"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)

"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent><C-Right> :<C-u>wincmd l<CR>
nnoremap <silent><C-Left>  :<C-u>wincmd h<CR>
nnoremap <silent><C-Up>    :<C-u>wincmd k<CR>
nnoremap <silent><C-Down>  :<C-u>wincmd j<CR>

nmap <C-Tab> :bn<CR>

" ================================================ "
" Section: AutoCmds                                "
" ================================================ "

"augroup mygroup
"  autocmd!
" Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"autocmd CursorHold * silent call CocActionAsync('highlight')
