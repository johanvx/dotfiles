-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:

vim.pack.add({
  { src = "https://github.com/NeogitOrg/neogit" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

vim.keymap.set("n", "<Leader>g", "<Cmd>Neogit<CR>", { desc = "Neogit" })
