return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        init = function()
            vim.api.nvim_set_keymap("n", ";", "[tls]", {})

            local builtin = require("telescope.builtin")
            local extensions = require("telescope").extensions

            vim.keymap.set("n", "[tls]f", builtin.find_files, { noremap = true })
            vim.keymap.set("n", "[tls]h", builtin.help_tags, { noremap = true })
            vim.keymap.set("n", "[tls]b", builtin.buffers, { noremap = true })
            vim.keymap.set("n", "[tls]q", builtin.help_tags, { noremap = true })

            vim.keymap.set("n", "[tls]x", builtin.quickfix, { noremap = true })
            vim.keymap.set("n", "[tls]cd", builtin.diagnostics, { noremap = true })
            vim.keymap.set("n", "[tls]cr", builtin.lsp_references, { noremap = true })
            vim.keymap.set("n", "[tls]cs", builtin.lsp_workspace_symbols, { noremap = true })

            vim.keymap.set("n", "[tls]gc", builtin.git_bcommits, { noremap = true })
            vim.keymap.set("n", "[tls]gb", builtin.git_branches, { noremap = true })
            vim.keymap.set("n", "[tls]gs", builtin.git_status, { noremap = true })
            vim.keymap.set("n", "[tls]gS", builtin.git_stash, { noremap = true })

            vim.keymap.set("n", "[tls]hs", builtin.search_history, { noremap = true })
            vim.keymap.set("n", "[tls]hf", builtin.oldfiles, { noremap = true })

            vim.keymap.set("n", "[tls]y", extensions.neoclip.default, { noremap = true })
            vim.keymap.set("n", "[tls]t", extensions.asynctasks.all, { noremap = true })

            vim.keymap.set("n", "[tls]s", builtin.live_grep, { noremap = true })
        end,
        config = function()
            require("plug-configs.tls")
        end,
        dependencies = {
            "AckslD/nvim-neoclip.lua",
            "GustavoKatel/telescope-asynctasks.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
    },
    {
        "tami5/sqlite.lua",
        lazy = true,
    },
    {
        "AckslD/nvim-neoclip.lua",
        lazy = true,
        dependencies = {
            "AckslD/nvim-neoclip.lua",
        },
    },
    { "GustavoKatel/telescope-asynctasks.nvim", lazy = true },
    { "nvim-telescope/telescope-ui-select.nvim", lazy = true },
}
