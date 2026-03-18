vim.pack.add({
  { src = "https://github.com/michaelrommel/nvim-silicon" },
})

require("nvim-silicon").setup({
  disable_defaults = true,

  -- -- turn on debug messages
  -- debug = false,

  -- with which number the line numbering shall start
  -- line_offset = 1,
  --
  -- here a function is used to return the actual source code line number
  line_offset = function(args)
    return args.line1
  end,

  -- with which language the syntax highlighting shall be done, should be
  -- a function that returns either a language name or an extension like "js"
  -- it is set to nil, so you can override it, if you do not set it, we try the
  -- filetype first, and if that fails, the extension
  -- language = nil,
  language = function()
    return vim.bo.filetype
  end,
  -- language = function()
  --   return vim.fn.fnamemodify(
  --     vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
  --     ":e"
  --   )
  -- end,

  -- the rendering of tab characters as so many space characters
  tab_width = 8,

  -- whether to strip of superfluous leading whitespace
  gobble = true,

  -- a string to pad each line with after gobbling removed larger indents,
  num_separator = "  ",
  -- here a bar glyph is used to draw a vertical line and some space
  -- num_separator = "\u{258f} ",

  -- a string or function returning a string that defines the title
  -- showing in the image, only works in silicon versions greater than v0.5.1
  -- window_title = nil,
  -- here a function is used to get the name of the current buffer
  window_title = function()
    return vim.fn.fnamemodify(
      vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
      ":t"
    )
  end,

  -- how to deal with the clipboard on WSL2
  -- possible values are: never, always, auto
  wslclipboard = nil,
  -- what to do with the temporary screenshot image file when using the Windows
  -- clipboard from WSL2, possible values are: keep, delete
  wslclipboardcopy = nil,

  -- the silicon command, put an absolute location here, if the
  -- command is not in your ${PATH}
  command = "silicon",

  -- a string or function that defines the path to the output image
  -- output = nil,
  -- here a function is used to create a file in the current directory
  output = function()
    return "./" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_code.png"
  end,
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
