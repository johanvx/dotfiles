vim.pack.add({
  { src = "https://github.com/FabijanZulj/blame.nvim" },
})

require("blame").setup()

vim.keymap.set(
  "n",
  "<LocalLeader>-",
  "<Cmd>BlameToggle virtual<CR>",
  { desc = "Toggle blame virtual" }
)
vim.keymap.set(
  "n",
  "<LocalLeader>=",
  "<Cmd>BlameToggle window<CR>",
  { desc = "Toggle blame window" }
)

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
