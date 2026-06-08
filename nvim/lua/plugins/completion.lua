vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*"),
  },
  { src = "https://github.com/milanglacier/minuet-ai.nvim" },
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  group = vim.api.nvim_create_augroup("SetupCompletion", { clear = true }),
  once = true,
  callback = function()
    local minuet_request_timeout = 3
    local minuet_timeout_ms = minuet_request_timeout * 1000

    local minuet = require("minuet")
    minuet.setup({
      request_timeout = minuet_request_timeout,
      provider = "openai_fim_compatible",
      provider_options = {
        openai_fim_compatible = {
          api_key = "DEEPSEEK_API_KEY",
          name = "deepseek",
          optional = {
            max_tokens = 4096,
            top_p = 0.9,
          },
        },
      },
    })

    require("blink.cmp").setup({
      keymap = {
        preset = "default",
        ["<C-space>"] = false,
        ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-;>"] = minuet.make_blink_map(),
      },
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
          "buffer",
          "snippets",
          "minuet",
        },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            async = true,
            timeout_ms = minuet_timeout_ms,
            score_offset = 50, -- Gives minuet higher priority among suggestions
          },
        },
      },
    })
  end,
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
