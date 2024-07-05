return {
    -- "machakann/vim-sandwich",
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
    },
    "lukas-reineke/indent-blankline.nvim",
    "itchyny/vim-parenmatch",
    "itchyny/vim-cursorword",
    "bronson/vim-trailing-whitespace",
    {
        "windwp/nvim-autopairs",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("plug-configs.autopairs")
        end,
    },
    -- {
    --     "alvan/vim-closetag",
    --     config = function()
    --         vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml"
    --         vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx"
    --         vim.g.closetag_emptyTags_caseSensitive = 1
    --         vim.g.closetag_regions = {
    --             ["typescript.tsx"] = "jsxRegion,tsxRegion",
    --             ["javascript.jsx"] = "jsxRegion",
    --             ["typescriptreact"] = "jsxRegion,tsxRegion",
    --             ["javascriptreact"] = "jsxRegion",
    --         }
    --         vim.g.closetag_shortcut = ">"
    --     end,
    -- },
    "windwp/nvim-ts-autotag",
    "norcalli/nvim-colorizer.lua",
}
