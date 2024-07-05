return {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plug-configs.completion")
        end,
    },
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "onsails/lspkind.nvim",
}
