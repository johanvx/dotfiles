vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("SetupMarkdown", { clear = true }),
  pattern = { "*.md", "*.mdx" },
  once = true,
  callback = function()
    vim.pack.add({
      { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    })
  end,
})
