vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup({
  ui = {
    icons = {
      package_installed = "o",
      package_pending = "~",
      package_uninstalled = "x",
    },
  },
})

vim.lsp.enable("copilot")
vim.lsp.enable("clangd")

-- LSP-local configuration
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    -- LSP client
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    -- current buffer
    local buffer = event.buf

    -- Diagnostics
    vim.diagnostic.config({
      underline = true,
      virtual_text = { source = true },
      virtual_lines = false,
      severity_sort = true,
    })

    -- Fold
    if client and client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    -- Keymaps

    vim.keymap.set("", "gd", function()
      vim.lsp.buf.definition()
    end, { buffer = buffer, desc = "Go to definition (LSP)" })

    vim.keymap.set("", "gD", function()
      vim.lsp.buf.declaration()
    end, { buffer = buffer, desc = "Go to declaration (LSP)" })

    vim.keymap.set({ "n", "i" }, "<C-K>", function()
      vim.lsp.buf.signature_help()
    end, { buffer = buffer, desc = "Show signature help (LSP)" })

    vim.keymap.set("", "<LocalLeader>d", function()
      vim.diagnostic.open_float({ source = true })
    end, { buffer = buffer, desc = "Show diagnostics (LSP)" })

    vim.keymap.set("", "<LocalLeader>l", function()
      vim.diagnostic.setloclist()
    end, {
      buffer = buffer,
      desc = "Add buffer diagnostics to the location list (LSP)",
    })

    vim.keymap.set("", "<Leader>q", function()
      vim.diagnostic.setqflist()
    end, {
      buffer = buffer,
      desc = "Add all diagnostics to the quickfix list (LSP)",
    })

    vim.keymap.set(
      "",
      "<Leader><Leader>d",
      "<Cmd>DiagnosticsToggle<CR>",
      { buffer = buffer, desc = "Toggle diagnostics (LSP)" }
    )

    vim.keymap.set(
      "",
      "<Leader><Leader>i",
      "<Cmd>InlayHintToggle<CR>",
      { buffer = buffer, desc = "Toggle inlay-hint (LSP)" }
    )
  end,
})

-- Commands

vim.api.nvim_create_user_command("DiagnosticsToggle", function()
  local is_enabled = vim.diagnostic.is_enabled()
  local status = not is_enabled
  vim.diagnostic.enable(status)
  vim.notify("Diagnostics enabled: " .. tostring(status), vim.log.levels.INFO)
end, {
  desc = "Toggle diagnostics",
})

vim.api.nvim_create_user_command("InlayHintToggle", function()
  local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
  local status = not is_enabled
  vim.lsp.inlay_hint.enable(status, { bufnr = 0 })
  vim.notify("Inlay-hint enabled: " .. tostring(status), vim.log.levels.INFO)
end, {
  desc = "Toggle inlay-hint",
})
