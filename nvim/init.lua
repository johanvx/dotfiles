-- Core configuration
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.lsp")

-- UI specific
require("neovide")

-- Common plugins
require("plugins.colorschemes")
require("plugins.winsep")
require("plugins.oil")
require("plugins.blame")
require("plugins.neogit")
require("plugins.numb")
require("plugins.silicon")
require("plugins.sk")
require("plugins.mini")
require("plugins.completion")
require("plugins.formatter")
require("plugins.linter")
require("plugins.treesitter")
require("plugins.img-clip")
require("plugins.snippets")

-- Language specific
require("plugins.lang.markdown")
require("plugins.lang.rust")
require("plugins.lang.typst")

vim.cmd("colorscheme lettepa")

-- Automatically sync Neovim background with macOS appearance
local globals = require("core.globals")

if globals.is_macos then
  local function get_appearance()
    -- Returns true if macOS is in dark mode, false otherwise
    local cmd =
      "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"
    local handle = io.popen(cmd, "r")
    if handle then
      local result = handle:read("*a"):gsub("[\n\r]", "")
      handle:close()
      return result == "true"
    end
    return false
  end

  local function sync_with_os(enabled)
    enabled = enabled or false
    if enabled then
      if get_appearance() then
        vim.opt.background = "dark"
      else
        vim.opt.background = "light"
      end
    end
  end

  -- A background change reloads the colorscheme and fires ColorScheme.
  -- Syncing there would undo manual toggles and can discard the active theme.
  sync_with_os(true)
end

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
