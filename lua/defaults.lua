vim.opt.encoding = "utf-8"
vim.opt.wildmenu = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.more = true

vim.cmd("set guioptions-=m")
vim.cmd("set guioptions-=T")

--vim.opt.cursorline = true
--vim.opt.cursorcolumn = true

-- Performance boosters
vim.opt.lazyredraw = true
vim.opt.re = 1
vim.opt.showcmd = false
vim.opt.synmaxcol = 120
vim.opt.ttyfast = true

vim.cmd([[
  :syntax sync minlines=64
]])

-- Reload file if modified
vim.opt.autoread = true

-- Highlight search as you type
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Indents
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showmatch = true

-- Allow to switch buffers without having to save its changes
vim.opt.hidden = true

-- Do not create backup files
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

-- I like to see hidden spaces, tabs, etc
vim.opt.listchars = "eol:$,tab:>-,trail:-"

-- Hide preview when auto completing
vim.cmd("set completeopt-=preview")

-- Define custom file types
-- https://neovim.io/doc/user/lua.html#vim.filetype
vim.filetype.add({
    extension = {
        http = "http", -- These were being interpreted as .conf files
    },
})

-- Diagnostics
--
-- Disable text object diagnostic next to each line to avoid overbloating UI
vim.diagnostic.config({ virtual_text = false })
-- Setup icons
for severity, icon in pairs({ Error = "✗", Warn = "", Hint = "", Info = " " }) do
    local hl = "DiagnosticSign" .. severity
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
end
