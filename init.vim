call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/highlight.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" coc-clangd Keybinds
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Saving the file
:map <C-S> :noh \| w<Enter>
:imap <C-S> <C-O>:noh \| w<Enter>

" Closing the Tab
:map <C-Q> :q!<Enter>
:imap <C-Q> <Esc>:q!<Enter>

" Opening New File
:map <C-O> :e src/

" Finding Content in File
:map <C-F> :/
:imap <C-F> <C-O>:/

" Undo
:map <C-Z> u
:imap <C-Z> <C-O>u

" Redo
:map <C-U> <C-R>
:imap <C-U> <C-O><C-R>

" Copy
:map <C-C> yy
:imap <C-C> <C-O>yy

" Paste
:map <C-V> p
:imap <C-V> <C-O>p

" Open New Tab
:nmap <C-T> :tabnew<Enter>:NERDTree<Enter>:wincmd p<Enter>

" Goto End of Line
:imap <C-Left> <C-O>0
:imap <C-Right> <Esc><S-A>

" Switch Tab Focus
:map <A-1> 1gt
:map <A-2> 2gt
:map <A-3> 3gt
:map <A-4> 4gt
:map <A-5> 5gt
:map <A-6> 6gt
:map <A-7> 7gt
:map <A-8> 8gt
:map <A-9> 9gt
:map <A-0> 0gt
:imap <A-1> <C-O>1gt
:imap <A-2> <C-O>2gt
:imap <A-3> <C-O>3gt
:imap <A-4> <C-O>4gt
:imap <A-5> <C-O>5gt
:imap <A-6> <C-O>6gt
:imap <A-7> <C-O>7gt
:imap <A-8> <C-O>8gt
:imap <A-9> <C-O>9gt
:imap <A-0> <C-O>0gt

" Access Terminal Anytime
:map <A-`> :
:imap <A-`> <C-O>:
:tmap <A-`> <C-D>

" Extra Settings
:syntax on
:set splitbelow
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set mouse=a
:set nu
:set nowrap
:set clipboard=unnamedplus
:colo gruvbox-material
:let NERDTreeWinSize=20

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "cpp",
  highlight = { enable = true },
  indent = { enable = true }
}
EOF
