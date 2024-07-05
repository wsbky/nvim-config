local keymap = vim.api.nvim_set_keymap

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })
            keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true })
            keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })
            keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { noremap = true, silent = true })
            keymap("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })
            keymap("n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true })
            keymap("n", "]", "<cmd>lua vim.diagnostic.open_float(0,{})<cr>", { noremap = true, silent = true })

            vim.api.nvim_create_augroup("LspCmds", { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold" }, {
                pattern = "*",
                group = "LspCmds",
                callback = function()
                    vim.diagnostic.open_float(0, { scope = "cursor" })
                end,
            })

            vim.cmd([[highlight LspDiagnosticsSignError ctermbg=9 ctermfg=9]])

            vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
            vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
            vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
            vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })

            require("plug-configs.lspconfig")
            -- require("plug-configs.formatter")
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            keymap("n", "<leader>l", "<cmd>Mason<cr>", { noremap = true, silent = true })
        end,
    },
    "williamboman/mason-lspconfig.nvim",
    {
        "mhartington/formatter.nvim",
        config = function()
            require("plug-configs.format")
        end,
    },
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     config = function()
    --         require("plug-configs.lsp_signature")
    --     end,
    -- },
    -- {
    --     "matsui54/denops-popup-preview.vim",
    --     config = function()
    --         vim.call("popup_preview#enable")
    --     end,
    -- },
}
