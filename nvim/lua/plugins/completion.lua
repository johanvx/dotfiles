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
    local minuet_request_timeout = 15
    local minuet_timeout_ms = minuet_request_timeout * 1000

    local minuet = require("minuet")
    minuet.setup({
      request_timeout = minuet_request_timeout,
      context_window = 512,
      n_completions = 1,
      provider = "openai_fim_compatible",
      provider_options = {
        openai_fim_compatible = {
          stream = true,
          api_key = "TERM",
          name = "Llama.cpp",
          model = "PLACEHOLDER",
          end_point = "http://127.0.0.1:9931/v1/completions",
          optional = {
            max_tokens = 56,
            top_p = 0.9,
          },
          template = {
            prompt = function(context_before_cursor, context_after_cursor, _)
              return "<|fim_prefix|>"
                .. context_before_cursor
                .. "<|fim_suffix|>"
                .. context_after_cursor
                .. "<|fim_middle|>"
            end,
            suffix = false,
          },
        },
      },
    })

    require("blink.cmp").setup({
      keymap = {
        preset = "default",
        ["<C-space>"] = false,
        ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-m>"] = minuet.make_blink_map(),
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
