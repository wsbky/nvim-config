require("nvim-treesitter.configs").setup({
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "all",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing
    ignore_install = { "phpdoc", "tree-sitter-phpdoc" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = { "phpdoc", "tree-sitter-phpdoc" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    },

    indent = {
        enable = true,
    },
})

-- vim.api.nvim_command("set foldmethod=expr")
-- vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
