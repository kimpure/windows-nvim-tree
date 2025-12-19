local directory = vim.fn.expand("~/dev/windows-nvim-tree/")

vim.opt.runtimepath:append(directory)
vim.loader.reset()
vim.loader.enable()

local function test()
    local files = vim.fn.glob(directory .. "/**/*.lua", false, true)

    for i = 1, #files do
        local module_path = files[i]:sub(#directory + 2)

        local lua_root = module_path:match("^lua/") or module_path:match("^lua\\")

        if lua_root then
            module_path = module_path:sub(5)

            local filename = module_path:match("([^/\\]+)$")
            local mod

            if filename == "init.lua" then
                mod = module_path:sub(1, -10):gsub("/", "."):gsub("\\", ".")
            else
                mod = module_path:sub(1, -5):gsub("/", "."):gsub("\\", ".")
            end

            package.loaded[mod] = nil
       end
    end

    vim.cmd("packadd windows-nvim-tree")
    require("windows-nvim-tree").setup()
end

vim.api.nvim_create_user_command("Test", test, {})
