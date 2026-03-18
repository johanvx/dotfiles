vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("SetupFormatter", { clear = true }),
  once = true,
  callback = function()
    vim.o.formatexpr = "v:lua.require('conform').formatexpr()"

    -- enable format-on-save by default
    vim.g.conform_format_on_save = true

    -- toggle format
    vim.api.nvim_create_user_command("FormatOnSaveToggle", function()
      vim.g.conform_format_on_save = not vim.g.conform_format_on_save
      vim.notify(
        "Format on save: " .. tostring(vim.g.conform_format_on_save),
        vim.log.levels.INFO
      )
    end, {
      desc = "Toggle format on save",
    })

    require("conform").setup({
      default_format_opts = { stop_after_first = true },
      formatters_by_ft = {
        ["*"] = {
          --[["codespell",]]
          -- "autocorrect",
          -- "typos",
          "trim_newlines",
          "trim_whitespace",
        },
        bash = { "shfmt" },
        bib = { "tex-fmt" },
        c = { "clang_format" },
        cmake = { "gersemi" },
        cpp = { "clang_format" },
        css = { "dprint" },
        fish = { "fish_indent" },
        go = { "gofmt" },
        html = { "deno_fmt" },
        javascript = { "prettier", "deno_fmt" },
        javascriptreact = { "prettier", "deno_fmt" },
        json = { "prettier", "deno_fmt" },
        jsonc = { "prettier", "deno_fmt" },
        lua = { "stylua" },
        markdown = { "rumdl" },
        python = { "ruff_format", "ruff_fix" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        tex = { "tex-fmt" },
        toml = { "taplo" },
        typescript = { "prettier", "deno_fmt" },
        typescriptreact = { "prettier", "deno_fmt" },
        typst = { "typstyle" },
        yaml = { "yamlfmt" },
      },
      format_on_save = function()
        if not vim.g.conform_format_on_save then
          return
        end
        return { lsp_fallback = true, timeout_ms = 500 }
      end,
    })

    vim.keymap.set(
      "n",
      "<Leader><Leader>f",
      "<Cmd>FormatOnSaveToggle<CR>",
      { desc = "Toggle format on save" }
    )
  end,
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
