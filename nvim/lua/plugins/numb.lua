vim.pack.add({
  { src = "https://github.com/nacro90/numb.nvim" },
})

require("numb").setup({
  show_numbers = true,
  show_cursorline = true,
  hide_relativenumbers = true,
  number_only = false,
  centered_peeking = true,
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
