local cfg = {
    bind = true,
    handler_opts = {
        border = "rounded",
    },
    hint_enable = false,
    transparency = 35,
}
require("lsp_signature").setup(cfg)
