package.path = package.path .. ";" .. os.getenv("XDG_CONFIG_HOME") .. "/nvim/plug-configs/data/?.lua"

local lspconfig = require("lspconfig")

local util = require("lspconfig/util")
local root_pattern = util.root_pattern
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

-- lsp config

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

-- config by installer

local function dirname(path)
    local strip_dir_pat = "/([^/]+)$"
    local strip_sep_pat = "/$"
    if not path or #path == 0 then
        return
    end
    local result = path:gsub(strip_sep_pat, ""):gsub(strip_dir_pat, "")
    if #result == 0 then
        return "/"
    end
    return result
end

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "lua_ls", "pyright", "tsserver" },
})

require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
        })
    end,
    ["clangd"] = function()
        lspconfig["clangd"].setup({
            root_dir = root_pattern("build/compile_commands.json", "build/compile_flags.txt", ".git") or dirname,
            init_options = {
                compilationDatabasePath = "build",
            },
        })
    end,
    ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
    end,
    ["eslint"] = function()
        lspconfig["eslint"].setup({
            settings = {
                format = true,
            },
        })
    end,
    ["stylelint_lsp"] = function()
        lspconfig["stylelint_lsp"].setup({
            filetypes = { "css", "less", "scss", "sugarss" },
        })
    end,
})

-- lsp_installer.on_server_ready(function(server)
--     local opts = {
--         capabilities = capabilities,
--     }

--     if add_opts[server.name] then
--         add_opts[server.name](opts)
--     end

--     server:setup(opts)
-- end)
