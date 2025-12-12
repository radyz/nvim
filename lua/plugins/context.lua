return {
    {
        "andersevenrud/nvim_context_vt",
        commit = "fadbd9e57af72f6df3dd33df32ee733aa01cdbc0",
        opts = function()
            local List = require("plenary.collections.py_list")
            local constants = require("constants")

            return {
                enabled = false,
                disable_ft = List({ "markdown" }):concat(constants.ignored_buffer_types),
            }
        end,
        keys = {
            { "<leader><space>", ":NvimContextVtToggle<CR>", desc = "[Code] Show Context", mode = "n" },
        },
    },
}
