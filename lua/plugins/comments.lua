return {
    { "JoosepAlviste/nvim-ts-context-commentstring", commit = "1b212c2eee76d787bbea6aa5e92a2b534e7b4f8f", opts = {} },
    {
        "numToStr/Comment.nvim",
        commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb",
        -- Returning a function allows loading ts_context lazily upon requiring it.
        opts = function()
            return {
                padding = false,
                toggler = {
                    line = "<leader>cc",
                    block = "<leader>cb",
                },
                opleader = {
                    line = "<leader>cc",
                    block = "<leader>cb",
                },
                mappings = {
                    extra = false,
                },
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            }
        end,
    },
}
