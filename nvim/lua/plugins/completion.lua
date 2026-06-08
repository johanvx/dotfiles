vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*"),
  },
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  group = vim.api.nvim_create_augroup("SetupCompletion", { clear = true }),
  once = true,
  callback = function()
    require("blink.cmp").setup({
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = { auto_show = true },
        menu = {
          draw = {
            columns = { { "label", "label_description" }, { "kind" } },
          },
        },
      },
      cmdline = { completion = { menu = { auto_show = true } } },
      signature = { enabled = true },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },
    })
  end,
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
