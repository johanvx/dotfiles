vim.pack.add({
  { src = "https://github.com/HakonHarnes/img-clip.nvim" },
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("SetupImgClip", { clear = true }),
  once = true,
  pattern = "*",
  callback = function()
    require("img-clip").setup()

    vim.keymap.set(
      "n",
      "<Leader>i",
      "<Cmd>PasteImage<CR>",
      { desc = "Paste image from system clipboard (img-clip)" }
    )
    vim.keymap.set(
      "n",
      "<Leader>I",
      ":lua require('img-clip').paste_image({})",
      { desc = "Paste image from system clipboard (img-clip)" }
    )
  end,
})
