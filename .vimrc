"
" Simple .vimrc config
"

" Four spaces in place of tabs
set expandtab
set tabstop=4
set shiftwidth=4

" misc settings
set cmdheight=2
syntax enable
set encoding=utf8

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2
