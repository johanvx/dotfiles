-- UI {{{
vim.opt.background = "dark"
vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 5
vim.opt.colorcolumn = "+1"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  foldclose = "",
  foldopen = "",
  foldsep = "│",
  horiz = "─",
  horizdown = "┬",
  horizup = "┴",
  vert = "│",
  verthoriz = "┼",
  vertleft = "┤",
  vertright = "├",
}
vim.opt.foldcolumn = "auto"
vim.opt.foldenable = true
vim.opt.foldlevel = 4
vim.opt.foldlevelstart = 4
vim.opt.laststatus = 3 -- global statusline
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = {
  extends = "#",
  nbsp = ".",
  tab = "› ",
  trail = "•",
}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 2
vim.opt.showmode = false
vim.opt.sidescrolloff = 1
vim.opt.signcolumn = "auto"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.switchbuf = "usetab"
vim.opt.synmaxcol = 2000 -- 3000 by default
vim.opt.termguicolors = true
vim.opt.visualbell = true
vim.opt.wrap = false
-- }}}

-- Edit {{{
vim.opt.autowrite = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.breakindent = true
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.confirm = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.fileencodings = { "utf-8", "default", "latin1" }
vim.opt.fileformats = { "unix", "mac", "dos" }
vim.opt.formatoptions = "nlmB1jq"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.infercase = true
vim.opt.matchtime = 1 -- ds
vim.opt.maxmempattern = 1024 * 1024 -- KB
vim.opt.mouse = "a"
vim.opt.path:append({ "**" })
vim.opt.shiftwidth = 4
vim.opt.shortmess:append(vim.fn.has("nvim-0.9") == 1 and "WcC" or "Wc")
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.timeoutlen = 500 -- ms
vim.opt.ttimeoutlen = 0
vim.opt.virtualedit = { "onemore", "block" }
vim.opt.whichwrap = "h,l,<,>,[,],~"
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.wildoptions = "pum"
vim.opt.wildmode = "list:longest"
-- }}}

-- Misc. {{{
local globals = require("core.globals")
-- Backup
vim.opt.backup = true
vim.opt.backupdir = globals.backup_dir
-- Swap
vim.opt.swapfile = false
vim.opt.directory = globals.swap_dir
-- Undo
vim.opt.undofile = true
vim.opt.undodir = globals.undo_dir
-- View
vim.opt.viewdir = globals.view_dir
vim.opt.viewoptions = { "folds", "options", "cursor", "unix", "slash" }
-- Grep
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
