-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Helper functions
local function set(modes, lhs, rhs, desc, remap, silent)
  vim.keymap.set(
    modes,
    lhs,
    rhs,
    { desc = desc, remap = not not remap, silent = not not silent }
  )
end

local function set_lead(modes, keys, rhs, desc, remap, silent)
  set(modes, "<Leader>" .. keys, rhs, desc, remap, silent)
end

local function set_locallead(modes, keys, rhs, desc, remap, silent)
  set(modes, "<LocalLeader>" .. keys, rhs, desc, remap, silent)
end

-- Cursor movements
set("", "j", "gj")
set("", "k", "gk")
set("", "gH", "H")
set("", "gL", "L")
set("", "H", "^", "", true)
set("", "L", "$", "", true)
-- Some Emacs stuff (or similar)
set("!", "<C-n>", "<Down>")
set("!", "<C-p>", "<Up>")
set("!", "<C-b>", "<Left>")
set("!", "<C-f>", "<Right>")
set("!", "<C-a>", "<Home>")
set("!", "<C-e>", "<End>")
set("!", "<C-h>", "<BS>")
set("!", "<C-d>", "<Del>")
-- Delete shift width at the start of the line (paired with <C-t>)
set("i", "<C-g>", "<C-d>")

-- Place search results at the center
set("n", "n", "nzz", "", false, true)
set("n", "N", "Nzz", "", false, true)
set("n", "*", "*zz", "", false, true)
set("n", "#", "#zz", "", false, true)
set("n", "g*", "g*zz", "", false, true)
set("n", "g#", "g#zz", "", false, true)

-- Shifts
set("x", "<", "<gv")
set("x", ">", ">gv")

-- System clipboard
set_lead({ "n", "x" }, "y", '"+y', "Copy to system clipboard")
set_lead({ "n", "x" }, "p", '"+p', "Paste from system clipboard")
set_lead({ "n", "x" }, "P", '"+P', "Paste from system clipboard")

-- Toggle
set_locallead("n", "b", function()
  if vim.o.background == "dark" then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end, "Toggle Background")

-- Inspect highlight
set_locallead("n", "<LocalLeader>", "<Cmd>Inspect<CR>", "Inspect highlight")

-- Type commands quicker
set({ "n", "v" }, ";", ":")

-- Window actions
set({ "", "!" }, "<Up>", "<Cmd>resize +1<CR>", "Increase height")
set({ "", "!" }, "<Down>", "<Cmd>resize -1<CR>", "Decrease height")
set({ "", "!" }, "<Left>", "<Cmd>vertical resize -1<CR>", "Decrease width")
set({ "", "!" }, "<Right>", "<Cmd>vertical resize +1<CR>", "Increase width")

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
