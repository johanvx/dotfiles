-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
