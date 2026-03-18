vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup({
  columns = { "permissions", "size", "mtime" },
})

vim.keymap.set("n", "-", "<Cmd>Oil<CR>")

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
