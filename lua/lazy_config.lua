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

local pluginLists = {
    require("plugins.plugins"),
    require("plugins.editor-support"),
    require("plugins.coding-support"),
    require("plugins.lsp"),
    require("plugins.completion"),
    require("plugins.tls"),
}

local plugins = {}
for _, pluginList in pairs(pluginLists) do
    for _, plugin in pairs(pluginList) do
        table.insert(plugins, plugin)
    end
end

require("lazy").setup(plugins)
