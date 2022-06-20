" ================================================ "
" Section: Mappings                                "
" ================================================ "
inoremap jk <ESC>
:tnoremap <Esc> <C-\><C-n>
nmap <silent><C-s> :w<CR>
nmap <silent><C-n> :Neotree toggle<CR>

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
nmap <silent><space>fc :find ~/.config/nvim/init.vim<CR> :cd `pwd`<CR>
nnoremap <silent><space>fp :lua require'telescope'.extensions.project.project{}<CR>
nnoremap <silent><space>fm :lua require('telescope').extensions.media_files.media_files()<CR>
nnoremap <silent><space>fn :Telescope node_modules list<CR>

nmap <C-Tab> :bn<CR>

