return {
    "editorconfig/editorconfig-vim",
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plug-configs.lualine")
            vim.g.custom_editor_title = ""
        end,
    },
    {
        "kyazdani42/nvim-tree.lua",
        lazy = true,
        cmd = { "NvimTreeToggle", "NvimTreeOpen" },
        init = function()
            vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>NvimTreeToggle<cr>", { silent = true })
        end,
        config = function()
            require("plug-configs.nvim-tree")
        end,
    },
    "unblevable/quick-scope",
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plug-configs.treesitter")
        end,
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/playground",
        lazy = true,
        cmd = "TSPlaygroundToggle",
    },
    "simeji/winresizer",
    {
        "luochen1990/rainbow",
        config = function()
            vim.g.rainbow_active = 1
            vim.g.rainbow_conf = {
                guifgs = { "#5f87ff", "#ff875f", "#ffff00", "#ff005f" },
                ctermfgs = { "lightblue", "lightyellow", "lightred", "lightmagenta" },
                guis = { "" },
                cterms = { "" },
                operators = "_,_",
                parentheses = { "start=/(/ end=/)/ fold", "start=/\\[/ end=/\\]/ fold", "start=/{/ end=/}/ fold" },
                separately = {
                    ["*"] = {},
                    cmake = 0,
                },
            }
        end,
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
    },
}
