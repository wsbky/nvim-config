local find_command = { "rg", "--files", "-uu" }
local ignore_globs = {
    ".git/",
    ".svn/",
    "node_modules/",
    "*.o",
    "*.a",
    ".cache",
    "CMakeFiles/",
    "*.cmake",
    "googlemock",
    "googletest",
}

for _, ignore_glob in pairs(ignore_globs) do
    table.insert(find_command, "-g")
    table.insert(find_command, "!" .. ignore_glob)
end

require("telescope").setup({
    defaults = {
        prompt_prefix = " \u{f422}  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        path_display = { "smart" },
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        set_env = { COLORTERM = "truecolor" },

        mappings = {
            i = {
                ["<c-h>"] = "which_key",
                ["<cr>"] = { "<esc>", type = "command" },
            },
            n = {
                ["<c-h>"] = "which_key",
                ["q"] = "close",
                ["<space>"] = "toggle_selection",
                ["<cr>"] = "select_default",
                ["o"] = "select_horizontal",
                ["v"] = "select_vertical",
                ["t"] = "select_tab",
            },
        },
        layout_config = {
            horizontal = {
                height = 0.8,
                width = 0.7,
                prompt_position = "top",
            },
            bottom_pane = {
                preview_cutoff = 1000,
            },
            cursor = {
                height = 0.1,
                width = 0.6,
            },
        },

        sorting_strategy = "ascending",
        dynamic_preview_title = true,

        initial_mode = "insert",
    },

    pickers = {
        find_files = {
            find_command = find_command,
        },
        buffers = {
            initial_mode = "normal",
        },
        diagnostics = {
            initial_mode = "normal",
            layout_strategy = "bottom_pane",
        },
        quickfix = {
            initial_mode = "normal",
            layout_strategy = "bottom_pane",
            preview = false,
        },
        lsp_references = {
            initial_mode = "normal",
        },
        lsp_code_actions = {
            initial_mode = "normal",
            layout_strategy = "cursor",
        },
        oldfiles = {
            initial_mode = "normal",
        },
        git_bcommits = {
            initial_mode = "normal",
            layout_config = {
                horizontal = {
                    width = 0.8,
                },
            },
        },
    },

    extensions = {
        neoclip = {
            mappings = {},
            initial_mode = "normal",
        },
        asynctasks = {
            mappings = {},
            initial_mode = "normal",
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({
                -- even more opts
                initial_mode = "normal",
                layout_strategy = "horizontal",
            }),
        },
    },
})

require("neoclip").setup({
    history = 1000,
    enable_persistent_history = true,
    db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
    filter = nil,
    preview = true,
    default_register = { '"', "+", "*" },
    default_register_macros = "q",
    enable_macro_history = true,
    content_spec_column = false,
    on_paste = {
        set_reg = false,
    },
    on_replay = {
        set_reg = false,
    },
    keys = {
        telescope = {
            i = {
                select = "<c-cr>",
                paste = "<c-p>",
                paste_behind = "<c-k>",
                replay = "<c-q>",
                custom = {},
            },
            n = {
                select = "<cr>",
                paste = "p",
                paste_behind = "P",
                replay = "r",
                custom = {},
            },
        },
    },
})

require("telescope").load_extension("neoclip")
require("telescope").load_extension("asynctasks")
require("telescope").load_extension("ui-select")
