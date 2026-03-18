vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("SetupTypst", { clear = true }),
  pattern = "*.typ",
  once = true,
  callback = function()
    vim.pack.add({
      { src = "https://github.com/kaarmu/typst.vim" },
      {
        src = "https://github.com/chomosuke/typst-preview.nvim",
        version = vim.version.range("1.*"),
      },
    })
  end,
})
