" ================================================ "
" Title: NeoVim configuration                      "
" Author: ViiEx                                    "
" ================================================ "

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
