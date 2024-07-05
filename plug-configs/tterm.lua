local tterm = require("toggleterm")

tterm.setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        else
            return 20
        end
    end,
    open_mapping = [[<c-p>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<c-\\><c-n>", { noremap = true, silent = true })
    end,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "rounded",
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<esc>", { noremap = true, silent = true })
    end,
})

function _G._lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", ",", "<cmd>lua _G._lazygit_toggle()<CR>", { noremap = true, silent = true })
