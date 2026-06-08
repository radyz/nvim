-- Track currently enabled features
local enabled_features = {}

local update = function()
    -- Find the active rust-analyzer client
    local clients = vim.lsp.get_clients({ name = "rust_analyzer" })
    if #clients == 0 then
        vim.notify("rust-analyzer is not running", vim.log.levels.WARN)
        return
    end

    -- Convert our tracking table into a list of active features
    local features_list = {}
    for feature, active in pairs(enabled_features) do
        if active then
            table.insert(features_list, feature)
        end
    end

    for _, client in ipairs(clients) do
        -- 1. Update internal configuration for future buffer attachments
        if client.config.settings and client.config.settings["rust-analyzer"] then
            client.config.settings["rust-analyzer"].cargo = client.config.settings["rust-analyzer"].cargo or {}
            client.config.settings["rust-analyzer"].cargo.features = features_list
            client.config.settings["rust-analyzer"].cargo.allFeatures = false
        end

        -- 2. Notify the running LSP server about the setting changes
        client.notify("workspace/didChangeConfiguration", {
            settings = client.config.settings,
        })
    end

    vim.notify("Rust features updated: [" .. table.concat(features_list, ", ") .. "]", vim.log.levels.INFO)
end

-- Create a user command to toggle features on the fly
vim.api.nvim_create_user_command("RustToggleFeature", function(opts)
    local feature = opts.args
    if feature == "" then
        vim.notify("Please specify a feature name", vim.log.levels.ERROR)
        return
    end

    -- Toggle the state
    enabled_features[feature] = not enabled_features[feature]

    -- Push settings updates to rust-analyzer
    update()
end, {
    nargs = 1,
    desc = "Toggle a specific Cargo feature for rust-analyzer",
})
