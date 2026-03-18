if vim.b.custom_ftplugin_setup then
  return
end
vim.b.custom_ftplugin_setup = true

vim.lsp.enable("rust_analyzer")
