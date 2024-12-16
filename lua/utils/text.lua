--- Text utility functions
-- @module text
local M = {}

--- It removes leading and trailing white space from the input string.
--- @param input string
--- @return string output string without leading and trailing white space.
M.trim = function(input)
    return (input:gsub("^%s*(.-)%s*$", "%1"))
end

--- Asserts whether the input string starts with prefix.
--- @param input string
--- @param prefix string
--- @return boolean
M.startswith = function(input, prefix)
    return input:find(prefix, 1, true) == 1
end

return M
