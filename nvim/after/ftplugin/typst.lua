if vim.b.custom_ftplugin_setup then
  return
end
vim.b.custom_ftplugin_setup = true

vim.lsp.enable("tinymist")
require("typst-preview").setup({
  port = 0, -- (default) 0 for random
  dependencies_bin = {
    ["tinymist"] = "tinymist",
  },
})
