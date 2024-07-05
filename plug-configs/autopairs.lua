local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

-- setup

local opts = {}

opts.disable_filetype = { "TelescopePrompt" }
opts.disable_in_macro = false -- disable when recording or executing a macro opts.disable_in_visualblock = false -- disable when insert after visual block mode
opts.ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", "")
opts.enable_moveright = true
opts.enable_afterquote = true -- add bracket pairs after quote
opts.enable_check_bracket_line = true --- check bracket in same line
opts.check_ts = false
opts.map_bs = true -- map the <BS> key
opts.map_c_h = false -- Map the <C-h> key to delete a pair
opts.map_c_w = false -- map <c-w> to delete a pair if possible

npairs.setup(opts)

-- cr mapping

_G.MUtils = {}

MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        return npairs.esc("<c-y>")
    else
        return npairs.autopairs_cr()
    end
end

remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })

-- custom rules
-- stylua: ignore start

npairs.add_rules({
    Rule(" ", " "):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
    end),
    Rule("( ", " )")
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match(".%)") ~= nil
        end)
        :use_key(")"),
    Rule("{ ", " }")
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match(".%}") ~= nil
        end)
        :use_key("}"),
    Rule("[ ", " ]")
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match(".%]") ~= nil
        end)
        :use_key("]"),
})

npairs.add_rules({
    -- lua
    -- Rule("then", "end", "vim")
    --     :before_regex("if.*")
    --     :end_wise(cond.done()),
    Rule("function.*%(.*%)%s*", "end", "lua")
        :use_regex(true)
        :end_wise(cond.done()),

    -- vim
    Rule("if.*", "endif", "vim")
        :use_regex(true)
        :end_wise(cond.done()),
    Rule("function.*%(.*%)%s*", "endfunction", "vim")
        :use_regex(true)
        :end_wise(cond.done()),
    Rule("augroup.*", "augroup END", "vim")
        :use_regex(true)
        :end_wise(cond.done()),

    -- tex
    Rule('"', '"', { "-latex", "-tex" }),
})
-- stylua: ignore end
-- custom rules end
