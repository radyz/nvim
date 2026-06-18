-- Required by nvim-tree
-- https://github.com/nvim-tree/nvim-tree.lua#setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup termguicolors for themes.
vim.o.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("defaults")
require("mappings")
require("lazy").setup("plugins")

-- Must be set after themes/easymotion plugins have finalized.
-- EasyMotion overrides.
vim.api.nvim_set_hl(0, "EasyMotionIncSearch", { fg = "green", bg = "#dafbe1", bold = true })
