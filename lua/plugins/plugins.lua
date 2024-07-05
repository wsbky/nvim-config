return {
    "nvim-lua/plenary.nvim",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plug-configs.gitsigns")
        end,
    },
    -- {
    --     "arcticicestudio/nord-vim",
    --     config = function()
    --         vim.cmd([[
    --             colorscheme nord
    --             hi Normal guibg=000000
    --             hi NormalNC guibg=000000
    --             hi SignColumn guibg=000000
    --             hi NvimTreeNormal guibg=000000
    --             hi NvimTreeNormalNC guibg=000000
    --             hi FloatBorder guibg=000000
    --             hi StatusLine guibg=000000
    --             hi StatusLineNC guibg=000000
    --             hi DarkenedPanel guibg=000000
    --             hi DarkenedStatusline guibg=000000
    --             hi DarkenedStatuslineNC guibg=000000
    --         ]])
    --     end,
    -- },
    {
        "rmehri01/onenord.nvim",
        config = function()
            require("onenord").setup()
        end,
    },
    {
        "mhinz/vim-startify",
        config = function()
            vim.g.startify_lists = {
                { type = "files", header = { "   MRU" } },
            }
            vim.g.startify_change_to_dir = 0
        end,
    },
    "kyazdani42/nvim-web-devicons",
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("plug-configs.tterm")
        end,
    },
}
