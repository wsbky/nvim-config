-- custom component
local function custom_editor_title()
    if vim.g.custom_editor_title then
        return vim.g.custom_editor_title
    else
        return [[neovim]]
    end
end

local function lsp_info()
    local msg = ""
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

local colors = {
    nord1 = "#3B4252",
    nord3 = "#4C566A",
    nord5 = "#E5E9F0",
    nord6 = "#ECEFF4",
    nord7 = "#8FBCBB",
    nord8 = "#88C0D0",
    nord13 = "#EBCB8B",
}

local separators = {
    component = { left = "", right = "" },
    section = { left = "", right = "" },
}

local nord_theme = {
    normal = {
        a = { fg = colors.nord1, bg = colors.nord8, gui = "bold" },
        b = { fg = colors.nord5, bg = colors.nord1 },
        c = { fg = colors.nord5, bg = colors.nord3 },
    },
    insert = { a = { fg = colors.nord1, bg = colors.nord6, gui = "bold" } },
    visual = { a = { fg = colors.nord1, bg = colors.nord7, gui = "bold" } },
    replace = { a = { fg = colors.nord1, bg = colors.nord13, gui = "bold" } },
    inactive = {
        a = { fg = colors.nord1, bg = colors.nord8, gui = "bold" },
        b = { fg = colors.nord5, bg = colors.nord1 },
        c = { fg = colors.nord5, bg = colors.nord1 },
    },
}

-- lualine setup
require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "onenord",
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        component_separators = separators.component,
        section_separators = separators.section,
        disabled_filetypes = {},
        always_divide_middle = false,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            {
                "filename",
                file_status = true,
                path = 1,
                shorting_target = 40,
                symbols = {
                    modified = " +",
                    readonly = " ",
                    unnamed = "[No Name]",
                },
            },
        },
        lualine_c = {
            lsp_info,
            "diagnostics",
            {
                "diff",
                colored = false,
            },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {
            {
                "filename",
                file_status = true,
                path = 1,
                shorting_target = 40,
                symbols = {
                    modified = " +",
                    readonly = " ",
                    unnamed = "[No Name]",
                },
            },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "progress" },
        lualine_z = {},
    },
    -- tabline = {
    --     lualine_a = {
    --         {
    --             custom_editor_title,
    --         },
    --         {
    --             "filetype",
    --             colored = false,
    --             icon_only = true,
    --         },
    --     },
    --     lualine_b = {
    --         {
    --             "tabs",
    --             mode = 1,
    --             tabs_color = {
    --                 active = "lualine_b_normal",
    --                 inactive = "lualine_c_normal",
    --             },
    --         },
    --     },
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = { "branch" },
    -- },
    extensions = {},
})
