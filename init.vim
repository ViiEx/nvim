" ================================================ "
" Title: NeoVim configuration                      "
" Author: ViiEx                                    "
" ================================================ "


"augroup mygroup
"  autocmd!
" Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"autocmd CursorHold * silent call CocActionAsync('highlight')

" ================================================= "
" Section: SetUp                                    "
" ================================================= "

let s:core_conf_files = [
      \ 'globals.vim',
      \ 'options.vim',
      \ 'autocommands.vim',
      \ 'mappings.vim',
      \ 'plugins.vim',
      \]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
