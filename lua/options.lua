local options = {
    number = true, -- show line number
    title = true, -- show title
    ruler = true, -- show ruler
    showcmd = true, -- show inputting command
    scrolloff = 20, -- scroll
    backspace = "indent,eol,start", -- backspace
    wrap = true, -- warpping
    hlsearch = true, -- highlight search result
    wildmenu = true, -- extend completion
    incsearch = true, -- incremental search
    list = true, -- show invisible characters
    confirm = true, -- confirm save when quit
    splitright = true, -- new vsplit window to right
    cursorline = true,
    signcolumn = "yes",
    completeopt = "menuone,noinsert",

    listchars = "tab:»\\ ,space:·",

    -- allow loading local rc files.
    -- exrc = true,

    -- indent setting
    tabstop = 4,
    shiftwidth = 4,
    -- autoindent = true,
    -- smartindent = true,
    cindent = true,
    -- indentexpr = true,
    expandtab = true,

    -- match setting
    showmatch = true,
    matchtime = 3,

    -- while completion
    infercase = true,
    ignorecase = true,
    smartcase = true,

    conceallevel = 0,
    mouse = "",

    termguicolors = true,
    pumblend = 10,
    winblend = 10,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
