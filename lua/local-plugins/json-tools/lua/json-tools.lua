-- main module file
--
-- @module JSON tools
local M = {}

local function get_visual_selection_text()
    -- 1. Sync marks (Force exit visual mode)
    local mode = vim.api.nvim_get_mode().mode
    if mode:find("[vV\22]") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
    end

    -- 2. Get coordinates (1-indexed lines, 0-indexed columns)
    local res_start = vim.api.nvim_buf_get_mark(0, "<")
    local res_end = vim.api.nvim_buf_get_mark(0, ">")

    local line_start, col_start = res_start[1], res_start[2]
    local line_end, col_end = res_end[1], res_end[2]

    -- 3. Grab the lines involved
    local lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)
    if #lines == 0 then
        return nil
    end

    -- 4. Precise Slicing
    -- Slice the end first so we don't mess up the start index
    -- Use col_end + 1 because Lua's string.sub is inclusive and 1-indexed
    lines[#lines] = string.sub(lines[#lines], 1, col_end + 1)
    lines[1] = string.sub(lines[1], col_start + 1)

    return table.concat(lines, "\n")
end

M.setup = function() end

M.inspect = function()
    local raw_json = get_visual_selection_text()
    if not raw_json or raw_json == "" then
        return
    end

    -- Use jq to prettify
    -- --raw-input (-R) isn't needed here if we echo the string safely
    local formatted = vim.fn.systemlist("echo " .. vim.fn.shellescape(raw_json) .. " | jq .")

    if vim.v.shell_error ~= 0 then
        vim.notify("Invalid JSON", vim.log.levels.ERROR)
        return
    end

    -- Create and open floating window...
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, "filetype", "json")
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, formatted)
    vim.api.nvim_buf_set_option(buf, "readonly", true)

    -- Open the window once formatted
    local width = math.ceil(vim.o.columns * 0.7)
    local height = math.ceil(vim.o.lines * 0.7)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = (vim.o.lines - height) / 2,
        col = (vim.o.columns - width) / 2,
        border = "rounded",
        title = " JSON",
        title_pos = "center",
        style = "minimal",
    })

    -- Buffer-local mapping to close the preview
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })

    -- Set an autocommand to close the window when you leave it
    vim.api.nvim_create_autocmd("WinLeave", {
        buffer = buf, -- Only trigger for this specific buffer
        once = true, -- Only run once (the window will be gone anyway)
        callback = function()
            if vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_close(win, true)
            end
        end,
    })
end

return M
