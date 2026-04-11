vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*"),
  },
  -- Copilot provider
  { src = "https://github.com/fang2hou/blink-copilot" },
  -- Copilot setup
  { src = "https://github.com/zbirenbaum/copilot.lua" },
  -- Copilot NES functionality
  { src = "https://github.com/copilotlsp-nvim/copilot-lsp" },
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  group = vim.api.nvim_create_augroup("SetupCompletion", { clear = true }),
  once = true,
  callback = function()
    -- Set up Copilot, use `:Copilot auth` to authenticate
    vim.g.copilot_nes_debounce = 500
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = { markdown = true, help = true },
      nes = {
        enabled = true,
        keymap = {
          accept_and_goto = "<Tab>",
          accept = false,
          dismiss = "<Esc>",
        },
      },
    })

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
          "copilot",
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    })
  end,
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
