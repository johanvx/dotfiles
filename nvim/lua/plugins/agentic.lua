vim.pack.add({
  { src = "https://github.com/carlos-algms/agentic.nvim" },
})

require("agentic").setup({
  provider = "pi-acp",
})

vim.keymap.set("", "<Leader>a<Leader>", function()
  require("agentic").toggle()
end, { desc = "Toggle agent (agentic.nvim)" })

vim.keymap.set("", "<Leader>a'", function()
  require("agentic").add_selection_or_file_to_context()
end, { desc = "Add file or selection to Context (agentic.nvim)" })

vim.keymap.set("", "<Leader>an", function()
  require("agentic").new_session()
end, { desc = "Add file or selection to Context (agentic.nvim)" })

vim.keymap.set("", "<Leader>ar", function()
  require("agentic").restore_session()
end, { desc = "Restore session (agentic.nvim)" })

vim.keymap.set("n", "<Leader>ad", function()
  require("agentic").add_current_line_diagnostics()
end, { desc = "Add current line diagnostics (agentic.nvim)" })

vim.keymap.set("n", "<Leader>aD", function()
  require("agentic").add_buffer_diagnostics()
end, { desc = "Add current buffer diagnostics (agentic.nvim)" })

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
