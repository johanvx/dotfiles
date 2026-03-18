vim.pack.add({
  { src = "https://github.com/nvim-zh/colorful-winsep.nvim" }
})

vim.api.nvim_create_autocmd("WinLeave", {
  group = vim.api.nvim_create_augroup("SetupWinsep", { clear = true }),
  once = true,
  callback = function()
    require("colorful-winsep").setup()
  end
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
