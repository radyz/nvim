-- REMAPS
-- Leader
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jj", "<Esc>")

-- Disable arrows
vim.keymap.set("i", "<Up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<Down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<Left>", "<nop>", { noremap = true })
vim.keymap.set("i", "<Right>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Up>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Down>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Left>", "<nop>", { noremap = true })
vim.keymap.set("n", "<Right>", "<nop>", { noremap = true })

-- Edit common files
vim.keymap.set("n", "<leader>ez", ":sp $HOME/.zshrc<cr>", { noremap = true })
-- TODO: do this for package.json, pyproject.toml by finding parent

--" toggle case
vim.keymap.set("n", "<Leader>tl", "<esc>viwu", { noremap = true })
vim.keymap.set("n", "<Leader>tu", "<esc>viwU", { noremap = true })

--" move up|down in wrapped lines
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

vim.keymap.set("n", "<C-X>", ":bd!<CR>", { noremap = true })
-- Make current buffer only buffer in split modes
vim.keymap.set("n", "<Leader>o", "<C-w><C-o>", { noremap = true })
-- Undo buffer
vim.keymap.set("n", "<Leader>q", "<C-w>q", { noremap = true })
-- Close buffer without losing splits
vim.keymap.set("n", "<C-c>", ":bp\\|bd #<CR>", { noremap = true })

-- Break line
vim.keymap.set("n", "<Leader><CR>", "i<CR><Esc>", { noremap = true })

-- Splits current buffer
vim.keymap.set("n", "<Leader><Bar>", ":vert sp<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>-", ":sp<CR>", { noremap = true })

-- : => ;
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })

-- Sudo into file to make changes
vim.keymap.set("c", "w!!", "w !sudo tee % >/dev/null", { noremap = true })

-- Copy current file path to clipboard using xclip
vim.opt.clipboard = "unnamedplus"
vim.cmd("nmap cp :let @+ = expand('%').':'.line('.')<CR>")

-- Move to start of line
vim.keymap.set("n", "H", "^", { noremap = true })
-- Move to end of line
vim.keymap.set("n", "L", "g_", { noremap = true })
-- Remove highlights
vim.keymap.set("n", "<Leader><Space>", ":nohl<CR>", { noremap = true })