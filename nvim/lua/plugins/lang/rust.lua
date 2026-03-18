vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("SetupRust", { clear = true }),
  pattern = "*.rs",
  once = true,
  callback = function()
    vim.pack.add({
      { src = "https://github.com/rust-lang/rust.vim" },
    })
  end,
})
