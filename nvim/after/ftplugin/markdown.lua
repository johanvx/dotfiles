if vim.b.custom_ftplugin_setup then
  return
end
vim.b.custom_ftplugin_setup = true

vim.lsp.enable("marksman")

require("render-markdown").setup({
  file_types = { "markdown" },
  completions = { lsp = { enabled = true } },
})

vim.keymap.set(
  "n",
  "<LocalLeader>m",
  "<Cmd>RenderMarkdown toggle<CR>",
  { desc = "Toggle markdown render (render-markdown.nvim)", buffer = true }
)

require("mdkite").setup({
  -- all optional; sane defaults shown
  instance_mode = "takeover", -- "takeover" (one tab) or "multi" (tab per instance)
  port = 0, -- 0 = auto (8421 for takeover, OS-assigned for multi)
  open_browser = true,
  default_theme = "dark", -- "dark" or "light"; initial preview theme
  debounce_ms = 300,
})

vim.keymap.set(
  "n",
  "<LocalLeader>p",
  "<Cmd>MdKite<CR>",
  { desc = "Preview markdown in browser (mdkite.nvim)", buffer = true }
)
