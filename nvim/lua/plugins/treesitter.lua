vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("SetupTreesitter", { clear = true }),
  once = true,
  callback = function()
    -- -- Prefer Git
    -- require("nvim-treesitter.install").prefer_git = true
    --
    -- -- Use SSH
    -- for _, config in
    --   pairs(require("nvim-treesitter.parsers").get_parser_configs())
    -- do
    --   config.install_info.url =
    --     config.install_info.url:gsub("https://github.com/", "git@github.com:")
    -- end
    require("nvim-treesitter").setup({
      auto_install = false,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
