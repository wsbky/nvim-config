local keymap = vim.api.nvim_set_keymap

-- register <space> as a leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: tabnext

keymap("n", "d<c-a>", "ggVGd<cr>", { noremap = true }) -- delete all

keymap("n", "<esc>", "<esc><cmd>nohlsearch<cr>", { noremap = true })
keymap("n", "<F4>", "<cmd>nohlsearch<cr>", { noremap = true })

keymap("n", "<leader>r", "<cmd>luafile %<cr>", { noremap = true })

keymap("n", "<leader>w", "<cmd>noautocmd w<cr>", { noremap = true })

--- map for coding

keymap("i", "jk", "<esc>", { noremap = true })
keymap("n", "<c-d>", "<c-e>", { noremap = true })
keymap("n", "<c-u>", "<c-y>", { noremap = true })
keymap("n", "\\", "$", { noremap = true })
keymap("v", "\\", "$", { noremap = true })

keymap("n", "<c-j>", "<c-w>j", { noremap = true })
keymap("n", "<c-k>", "<c-w>k", { noremap = true })
keymap("n", "<c-l>", "<c-w>l", { noremap = true })
keymap("n", "<c-h>", "<c-w>h", { noremap = true })

keymap("i", "<c-h>", "<Left>", { noremap = true })
keymap("i", "<c-k>", "<Up>", { noremap = true })
keymap("i", "<c-l>", "<Right>", { noremap = true })
keymap("i", "<c-^>", "<c-o>^", { noremap = true })
keymap("i", "<c-\\>", "<c-o>$", { noremap = true })
keymap("i", "<c-[>", "<c-o>$", { noremap = true })
keymap("i", "<c-o>", "<c-o>o", { noremap = true })

keymap("i", "<c-j>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<c-j>'", { expr = true, noremap = true })
keymap("s", "<c-j>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<c-j>'", { expr = true, noremap = true })
keymap("i", "<c-b>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<c-b>'", { expr = true, noremap = true })
keymap("s", "<c-b>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<c-b>'", { expr = true, noremap = true })

keymap("n", "<c-c>", '<cmd>let b:__pos = getpos(".")<cr>ggVG"+y<cmd>call setpos(".", b:__pos)<cr>', { noremap = true })
keymap("v", "<c-c>", '"+y', { noremap = true })
