vim.pack.add({
  { src = "https://github.com/skim-rs/skim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

vim.env.SKIM_DEFAULT_COMMAND = table.concat({
  "fd --type f --type l --color=never --hidden --exclude .git",
  "git ls-tree -r --name-only HEAD",
  "rg --files --hidden --glob '!.git/*'",
  "find . -path ./.git -prune -o \\( -type f -o -type l \\) -print",
}, " || ")

-- enable `sk` support instead of the default `fzf`
require("fzf-lua").setup({
  { "skim" },
  fzf_colors = true,
  winopts = {
    split = "belowright 10new",
    preview = {
      hidden = true,
    },
  },
})

vim.keymap.set(
  "n",
  "<Leader><LocalLeader>",
  "<Cmd>FzfLua resume<CR>",
  { desc = "Resume last fzf picker (fzf sk)" }
)
vim.keymap.set(
  "n",
  "<Leader>f",
  "<Cmd>FzfLua files<CR>",
  { desc = "Pick Files (fzf sk)" }
)
vim.keymap.set(
  "n",
  "<Leader>F",
  "<Cmd>FzfLua files winopts.split=false winopts.preview.hidden=false<CR>",
  { desc = "Pick Files with preview (fzf sk)" }
)
vim.keymap.set(
  "n",
  "<Leader>b",
  "<Cmd>FzfLua buffers<CR>",
  { desc = "Pick Buffers (fzf sk)" }
)
vim.keymap.set(
  "n",
  "<Leader>B",
  "<Cmd>FzfLua buffers winopts.split=false winopts.preview.hidden=false<CR>",
  { desc = "Pick Buffers with preview (fzf sk)" }
)
vim.keymap.set(
  "n",
  "<Leader>o",
  "<Cmd>FzfLua oldfiles<CR>",
  { desc = "Pick Oldfiles (fzf sk)" }
)
vim.keymap.set(
  "n",
  "<Leader>O",
  "<Cmd>FzfLua oldfiles winopts.split=false winopts.preview.hidden=false<CR>",
  { desc = "Pick Oldfiles with preview (fzf sk)" }
)
vim.keymap.set(
  "n",
  "<Leader>/",
  "<Cmd>FzfLua live_grep<CR>",
  { desc = "Live grep (fzf sk)" }
)
vim.keymap.set(
  "n",
  "<Leader>?",
  "<Cmd>FzfLua live_grep winopts.split=false winopts.preview.hidden=false<CR>",
  { desc = "Live grep with preview (fzf sk)" }
)
vim.keymap.set(
  "n",
  "g/",
  "<Cmd>FzfLua grep<CR>",
  { desc = "Global grep (fzf sk)" }
)
vim.keymap.set(
  "n",
  "g?",
  "<Cmd>FzfLua grep winopts.split=false winopts.preview.hidden=false<CR>",
  { desc = "Global grep with preview (fzf sk)" }
)

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
