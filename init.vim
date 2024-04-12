
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'williamboman/mason.nvim' "
Plug 'williamboman/mason-lspconfig.nvim' " These three are for language server (LSP)
Plug 'neovim/nvim-lspconfig'  "
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
call plug#end()

"-------------------NerdTree config------------------------
" hotkeys (Nerd Tree is file manager in vim)
nnoremap <leader>n :NERDTreeFocus<CR> "<leader> by default is mapped to \ key: We maked \ + n to Focus 
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>



"This section of code runs lua code until EOF word(not the end of file of this
"file)
"for Mason starting
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
EOF

"configuring language severs
lua << EOF
require("lspconfig").pyright.setup{}
require("lspconfig").clangd.setup{}
EOF

"Auto starting coq (autocompletion plugin)
lua << EOF
vim.g.coq_settings = {
  keymap = { 
    recommended = false,
    jump_to_mark = '',
    pre_select = true,
  },
  auto_start = 'shut-up',
}
require "coq"
EOF

set number
set mouse
