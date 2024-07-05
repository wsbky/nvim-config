-- local eslint_fts = { "javascript", "typescript" }
local noformat_fts = { "sql" }

local contains = function(table, value)
    for _, e in pairs(table) do
        if e == value then
            return true
        end
    end
    return false
end

local contains_key = function(table, key)
    if table == nil then
        return false
    end
    for k, _ in pairs(table) do
        if k == key then
            return true
        end
    end
    return false
end

_G.__format = function(custom_table)
    local ft = vim.bo.filetype
    local fp = vim.fn.expand("%")

    local pos = vim.fn.getpos(".")

    local eslint_available = false

    local working_lsps = vim.lsp.get_active_clients()
    for _, value in pairs(working_lsps) do
        if value["name"] == "eslint" then
            eslint_available = true
            break
        end
    end

    if contains_key(custom_table, ft) then
        vim.cmd(custom_table[ft])
    elseif ft == "lua" then
        vim.cmd("%!stylua -")
    elseif contains({ "json", "css", "scss", "sass" }, ft) then
        vim.cmd("%!prettier --stdin-filepath " .. fp)
    elseif ft == "python" then
        if vim.fn.system("python3 -m black --version > /dev/null 2> /dev/null") and vim.v.shell_error == 0 then
            vim.cmd("%!python3 -m black -q -")
        elseif vim.fn.system("python3 -m autopep8 --version > /dev/null 2> /dev/null") and vim.v.shell_error == 0 then
            vim.cmd("%!autopep8 -")
        else
            print("[formatter.lua] no formatter for python")
        end
    elseif not contains(noformat_fts, ft) then
        vim.lsp.buf.format()
    end

    if eslint_available then
        vim.cmd("EslintFixAll")
    end

    vim.fn.setpos(".", pos)
end

vim.cmd([[
augroup fmt
    autocmd!
    autocmd BufWritePre * lua _G.__format(vim.g.custom_formatters)
augroup END
]])
