" ================================================ "
" Section: Mappings                                "
" ================================================ "
inoremap jk <ESC>
:tnoremap <Esc> <C-\><C-n>
nmap <C-s> :w<CR>
nmap <C-n> :NeoTreeShowToggle<CR>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nmap <silent> [g :lua vim.diagnostic.goto_prev()<CR>
nmap <silent> ]g :lua vim.diagnostic.goto_next()<CR>

nnoremap <silent><C-Right> :<C-u>wincmd l<CR>
nnoremap <silent><C-Left>  :<C-u>wincmd h<CR>
nnoremap <silent><C-Up>    :<C-u>wincmd k<CR>
nnoremap <silent><C-Down>  :<C-u>wincmd j<CR>

nmap <silent><space>gg :LazyGit<CR>

nmap <C-Tab> :bn<CR>

