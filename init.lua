package.path = package.path .. ";" .. os.getenv("XDG_CONFIG_HOME") .. "/nvim/?.lua"

require("base")
require("keymaps")
require("options")
require("lazy_config")
