set number
set relativenumber
set smartindent
set scrolloff=8
set tabstop=4 softtabstop=4
set expandtab
set termguicolors
set shiftwidth=4


call plug#begin('~/.config/nvim/plugged')
    Plug 'itchyny/lightline.vim'


    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

colorscheme tokyonight

imap jk <Esc>
