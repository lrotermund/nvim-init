:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/mg979/vim-visual-multi' " Multi Cursor
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin' " NERDTree git support
Plug 'https://github.com/sirver/UltiSnips' " Snippet-Engine
Plug 'https://github.com/honza/vim-snippets' " Snippets

set encoding=UTF-8

call plug#end()

" --- Customize colors ---
:colorscheme sonokai
" --- end Customize ---

" --- airline ---
let g:airline_powerline_fonts = 1
" --- end airline ---

" --- NERDTree ---
nnoremap <silent> <expr> <C-c> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeShowHidden=1

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <silent><expr> <Tab>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"----------------------------
" Xuyuanp/nerdtree-git-plugin
"----------------------------
" Override the default symbols
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  : 'M',
  \ 'Staged'    : 'S',
  \ 'Untracked' : '*',
  \ 'Renamed'   : 'R',
  \ 'Unmerged'  : 'U',
  \ 'Deleted'   : '!',
  \ 'Dirty'     : 'D',
  \ 'Clean'     : 'C',
  \ 'Ignored'   : 'I',
  \ 'Unknown'   : '?'
\ }
" --- end NERDTree ---

" --- Snippets ---

let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" --- end Snippets ---
