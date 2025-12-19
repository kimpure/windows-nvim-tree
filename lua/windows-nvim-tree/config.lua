--- @class WindowsNvimTree.Config
--- @field iswindows? boolean
local default = {
    iswindows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1,
}

return {
    default = default,
}

