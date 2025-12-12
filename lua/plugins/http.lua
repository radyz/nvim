return {
    {
        "rest-nvim/rest.nvim",
        tag = "v1.1.0",
        config = function()
            require("rest-nvim").setup({
                result_split_horizontal = true,
                skip_ssl_verification = true,
                result = {
                    show_curl_command = false,
                },
            })
        end,
    },
}
