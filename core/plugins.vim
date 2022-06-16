scriptencoding utf-8

lua require('lua-init')

call utils#Cabbrev('pi', 'PackerInstall')
call utils#Cabbrev('pud', 'PackerUpdate')
call utils#Cabbrev('pc', 'PackerClean')
call utils#Cabbrev('ps', 'PackerSync')

let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0

let g:Lf_WildIgnore = {
  \ 'dir': ['.git', '__pycache__', '.DS_Store'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
  \ '*.mp3', '*.aac']
  \}

let g:Lf_ShowDevIcons = 0

let g:Lf_DefaultMode = 'FullPath'

let w = float2nr(&columns * 0.8)
if w > 140
  let g:Lf_PopupWidth = 140
else
  let g:Lf_PopupWidth = w
endif

let g:Lf_PopupPosition = [0, float2nr((&columns - g:Lf_PopupWidth)/2)]

let g:Lf_UseVersionControlTool = 0

let g:Lf_DefaultExternalTool = "rg"

let g:Lf_ShowHidden = 1

let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''

let g:Lf_WorkingDirectoryMode = 'a'

nnoremap <silent> <leader>ff :<C-U>Leaderf file --popup<CR>
nnoremap <silent> <leader>fg :<C-U>Leaderf rg --no-messages --popup<CR>
nnoremap <silent> <leader>fh :<C-U>Leaderf help --popup<CR>
nnoremap <silent> <leader>ft :<C-U>Leaderf bufTag --popup<CR>
nnoremap <silent> <leader>fb :<C-U>Leaderf buffer --popup<CR>
nnoremap <silent> <leader>fr :<C-U>Leaderf mru --popup --absolute-path<CR>

let g:Lf_PopupColorscheme = 'gruvbox_material'
let g:Lf_CommandMap = {'<C-J>': ['<C-N>'], '<C-K>': ['<C-P>']}

nmap ga <Plug>(UnicodeGA)
