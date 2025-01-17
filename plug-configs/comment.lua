require("nvim_comment").setup({
    -- Linters prefer comment and line to have a space in between markers
    marker_padding = true,
    -- should comment out empty or whitespace only lines
    comment_empty = true,
    -- Should key mappings be created
    create_mappings = true,
    -- Normal mode mapping left hand side
    line_mapping = "<leader>c<space>",
    -- Visual/Operator mapping left hand side
    operator_mapping = "<leader>c",
    -- Hook function to call before commenting takes place
    hook = function()
        if vim.api.nvim_buf_get_option(0, "filetype") == "c" then
            vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
        end
        if vim.api.nvim_buf_get_option(0, "filetype") == "json" then
            vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
        end
    end,
})
