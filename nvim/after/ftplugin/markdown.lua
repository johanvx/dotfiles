if vim.b.custom_ftplugin_setup then
  return
end
vim.b.custom_ftplugin_setup = true

vim.lsp.enable("marksman")

require("render-markdown").setup({
  file_types = { "markdown" },
})

vim.keymap.set(
  "n",
  "<LocalLeader>m",
  "<Cmd>RenderMarkdown toggle<CR>",
  { desc = "Toggle markdown render (render-markdown.nvim)" }
)
