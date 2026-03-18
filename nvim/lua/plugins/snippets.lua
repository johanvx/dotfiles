vim.pack.add({
  { src = "https://github.com/chrisgrieser/nvim-scissors" },
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("SetupNvimScissors", { clear = true }),
  once = true,
  pattern = "*",
  callback = function()
    local scissors = require("scissors")
    scissors.setup()

    vim.keymap.set({ "n", "x" }, "<Leader>sa", function()
      scissors.addNewSnippet()
    end, { desc = "Add snippet (nvim-scissors)" })
    vim.keymap.set({ "n", "x" }, "<Leader>se", function()
      scissors.editSnippet()
    end, { desc = "Edit snippet (nvim-scissors)" })
  end,
})
