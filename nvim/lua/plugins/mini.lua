vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("SetupMiniNvim", { clear = true }),
  once = true,
  callback = function()
    require("mini.align").setup()
    require("mini.bracketed").setup({
      comment = { suffix = "e" },
    })
    require("mini.comment").setup()
    require("mini.cursorword").setup()
    require("mini.diff").setup({
      mappings = {
        apply = "<LocalLeader>h",
        reset = "<LocalLeader>H",
        textobject = "gh",
      },
      view = {
        style = "sign",
      },
    })
    require("mini.icons").setup()
    require("mini.jump2d").setup()
    require("mini.splitjoin").setup()
    require("mini.surround").setup()

    local clue = require("mini.clue")
    clue.setup({
      clues = {
        {
          { mode = "n", keys = "<Leader><Leader>", desc = "+Toggle" },
          { mode = "n", keys = "<Leader>s", desc = "+Snippets" },
        },
        clue.gen_clues.builtin_completion(),
        clue.gen_clues.g(),
        clue.gen_clues.marks(),
        clue.gen_clues.registers(),
        clue.gen_clues.windows({ submode_resize = true }),
        clue.gen_clues.z(),
      },
      triggers = {
        { mode = "c", keys = "<C-r>" },
        { mode = "i", keys = "<C-r>" },
        { mode = "i", keys = "<C-x>" },
        { mode = "n", keys = "'" },
        { mode = "n", keys = "<C-w>" },
        { mode = "n", keys = "<Leader>" },
        { mode = "n", keys = "<LocalLeader>" },
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
        { mode = "n", keys = "`" },
        { mode = "n", keys = "g" },
        { mode = "n", keys = "s" },
        { mode = "n", keys = "z" },
        { mode = "n", keys = '"' },
        { mode = "o", keys = "[" },
        { mode = "o", keys = "]" },
        { mode = "o", keys = "`" },
        { mode = "o", keys = "a" },
        { mode = "o", keys = "i" },
        { mode = "t", keys = "<C-w>" },
        { mode = "t", keys = "<Space>" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "<Leader>" },
        { mode = "x", keys = "[" },
        { mode = "x", keys = "]" },
        { mode = "x", keys = "`" },
        { mode = "x", keys = "a" },
        { mode = "x", keys = "g" },
        { mode = "x", keys = "i" },
        { mode = "x", keys = "s" },
        { mode = "x", keys = "z" },
        { mode = "x", keys = '"' },
      },
      window = {
        delay = 0,
        config = {
          width = "auto",
        },
      },
    })

    local extra = require("mini.extra")
    extra.setup()

    local gen_ai_spec = extra.gen_ai_spec
    require("mini.ai").setup({
      mappings = {
        goto_left = "[",
        goto_right = "]",
      },
      custom_textobjects = {
        B = gen_ai_spec.buffer(),
        D = gen_ai_spec.diagnostic(),
        I = gen_ai_spec.indent(),
        L = gen_ai_spec.line(),
        N = gen_ai_spec.number(),
      },
    })

    local hipatterns = require("mini.hipatterns")
    local hi_words = extra.gen_highlighter.words
    hipatterns.setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = hi_words({ "FIXME" }, "MiniHipatternsFixme"),
        hack = hi_words({ "HACK" }, "MiniHipatternsHack"),
        todo = hi_words({ "TODO" }, "MiniHipatternsTodo"),
        note = hi_words({ "NOTE" }, "MiniHipatternsNote"),

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })

    local indentscope = require("mini.indentscope")
    indentscope.setup({
      draw = {
        delay = 0,
        animation = indentscope.gen_animation.none(),
      },
      symbol = "│",
    })

    local misc = require("mini.misc")
    misc.setup()
    misc.setup_auto_root()
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup(
        "SetupMiniNestedComments",
        { clear = true }
      ),
      callback = function()
        misc.use_nested_comments()
      end,
    })
  end,
})

local statusline = require("mini.statusline")
statusline.setup({
  use_icons = false,
  content = {
    active = function()
      local mode, mode_hl = statusline.section_mode({ trunc_width = 50 })
      local git = statusline.section_git({ trunc_width = 75 })
      local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
      local filename = statusline.section_filename({ trunc_width = 80 })
      local fileinfo = statusline.section_fileinfo({ trunc_width = 50 })
      local searchcount = statusline.section_searchcount({ trunc_width = 75 })
      local location = statusline.section_location({ trunc_width = 75 })

      -- Usage of `statusline.combine_groups()` ensures highlighting and
      -- correct padding with spaces between groups (accounts for 'missing'
      -- sections, etc.)
      return statusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "statuslineDevinfo", strings = { git, diagnostics } },
        "%=", -- End left alignment
        "%<", -- Mark general truncate point
        { hl = "statuslineFilename", strings = { filename } },
        "%=", -- End center alignment
        { hl = "statuslineFileinfo", strings = { fileinfo } },
        {
          hl = mode_hl,
          strings = { searchcount, location },
        },
      })
    end,
  },
})
vim.opt.laststatus = 3

require("mini.tabline").setup({ show_icons = false })

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
