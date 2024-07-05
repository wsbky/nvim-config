local fterm = require("FTerm")

fterm.setup({
    ft = "FTerm",
    cmd = os.getenv("SHELL"),
    border = "rounded",
    auto_close = true,
    hl = "Normal",
    blend = 0,
    dimensions = {
        height = 0.7,
        width = 0.6,
        x = 0.5,
        y = 0.5,
    },
    on_exit = nil,
    on_stdout = nil,
    on_stderr = nil,
})

local fterm_git = fterm:new({
    ft = "fterm_git",
    cmd = "lazygit",
    dimensions = {
        height = 0.8,
        width = 0.8,
    },
    hl = "Normal",
    blend = 0,
})

function _G.__fterm_git()
    fterm_git:toggle()
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<c-p>", '<cmd>lua require("FTerm").toggle()<cr>', opts)
map("t", "<c-p>", '<cmd>lua require("FTerm").toggle()<cr>', opts)
map("t", "<esc>", "<c-\\><c-n>", opts)

map("n", ",", "<cmd>lua _G.__fterm_git()<cr>", opts)

vim.cmd([[
  augroup MapFtermGit
    autocmd FileType fterm_git tnoremap <esc> <esc>
  augroup END
]])
