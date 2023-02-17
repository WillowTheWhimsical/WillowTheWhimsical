" vim-plug
call plug#begin()
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

" Saving the file
:map <C-S> :w<Enter>
:imap <C-S> <C-O>:w<Enter>

" Closing the Tab
:map <C-Q> :q!<Enter>:q!<Enter>
:imap <C-Q> <Esc>:q!<Enter>:q!<Enter>

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
:nmap <C-T> :tabnew<Enter>:8 vsplit<Enter>:view .<Enter><C-W>l<C-W>h<C-W>l

" Goto End of Line
:imap <C-Right> <Esc><S-A>

" Switch Tab Focus
:map <A-1> 1gt
:map <A-2> 2gt
:map <A-3> 3gt
:map <A-4> 4gt
:imap <A-1> <C-O>1gt
:imap <A-2> <C-O>2gt
:imap <A-3> <C-O>3gt
:imap <A-4> <C-O>4gt

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
:set wrap
:set clipboard=unnamedplus
:colo gruvbox-material

" Open File Explorer on the Left
:8 vsplit
:view .
