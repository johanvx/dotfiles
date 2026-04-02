vim.pack.add({
  { src = "https://github.com/copilotC-Nvim/CopilotChat.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim", branch = "master" },
})

-- Manually install https://github.com/gptlang/lua-tiktoken for accurate token
-- counting:
--     luarocks install --lua-version 5.1 toktoken_core

require("CopilotChat").setup()

vim.keymap.set(
  "",
  "<Leader>a<Leader>",
  "<Cmd>CopilotChatToggle<CR>",
  { desc = "Toggle chat (CopilotChat)" }
)
vim.keymap.set(
  "",
  "<Leader>ap",
  "<Cmd>CopilotChatPrompts<CR>",
  { desc = "Pick prompt (CopilotChat)" }
)
vim.keymap.set(
  "",
  "<Leader>a?",
  "<Cmd>CopilotChatModels<CR>",
  { desc = "Pick model (CopilotChat)" }
)
-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
