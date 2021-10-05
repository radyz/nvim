"=============================================================================
" LUALINE
"=============================================================================

lua << EOF
require('lualine').setup {
  options = {
    theme = 'material'
  },
  extensions = { 'nvim-tree', 'quickfix', 'fugitive' }
}
EOF

"=============================================================================
" DIMINACTIVE
"=============================================================================

let g:diminactive_enable_focus = 1

"=============================================================================
" ILLUMINATE
"=============================================================================

hi illuminatedWord cterm=underline gui=underline 
