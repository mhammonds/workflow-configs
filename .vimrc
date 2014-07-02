" Enable Vim Boilerplate Shortcuts
if exists("*VBPShortcuts")
    autocmd VimEnter * :call VBPShortcuts()
else
    so ~/vimboilerplate/vimrc
    call VBPShortcuts()
endif

" Easily reload VIM configuration
map <leader>rc :so ~/.vimrc<CR>

" Search bar from insert mode
imap <C-f> <ESC>/

" New windows open below or to the right
set splitbelow
set splitright

" Quickly resize splits
map <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
map <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Easily reposition windows 
map <leader>Wl <C-w>L " Move window far right
map <leader>Wh <C-w>H " Move window far left 
map <leader>Wj <C-w>J " Move window to bottom
map <leader>Wk <C-w>K " Move window to top
map <leader>Wr <C-w>R " Rotate window UP or LEFT

" Jump into bash shell
map <leader>sh :shell<CR>

" Prevent the cursor from moving when exiting INSERT mode
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif
