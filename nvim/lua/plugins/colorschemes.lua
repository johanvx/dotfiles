vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  -- { src = "https://github.com/wincent/base16-nvim" },
})

-- base16-nvim
local enable_base16_nvim = false
if enable_base16_nvim then
  local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
  vim.api.nvim_set_hl(0, "Comment", bools)
end

-- Catppuccin
require("catppuccin").setup({
  flavour = "mocha",
  integrations = {
    blink_cmp = {},
    colorful_winsep = {
      enabled = true,
      color = "sky",
    },
    cmp = true,
    fzf = true,
    gitsigns = true,
    mini = {
      enabled = true,
      indentscope_color = "overlay2",
    },
    vimwiki = true,
  },
  color_overrides = {
    -- Use colors from Lettepa
    mocha = {
      -- Main colors
      text = "#bdc0ba", -- Zhenzhuhui
      subtext1 = "#C4CBCF", -- Dalishihui
      subtext0 = "#C4CBCF", -- Dalishihui
      overlay2 = "#5E616D", -- Yuweihui
      overlay1 = "#5E616D", -- Yuweihui
      overlay0 = "#5E616D", -- Yuweihui
      surface2 = "#2B333E", -- Qinghui
      surface1 = "#2B333E", -- Qinghui
      surface0 = "#2B333E", -- Qinghui
      base = "#101F30", -- Anlan
      mantle = "#101F30", -- Anlan
      crust = "#101F30", -- Anlan
      -- Accent colors
      -- Red
      red = "#F03752", -- Haitanghong
      rosewater = "#F03752", -- Haitanghong
      -- Green
      green = "#57C3C2", -- Shilü
      teal = "#57C3C2", -- Shilü
      -- Blue
      blue = "#66A9C9", -- Jianshilan
      mauve = "#66A9C9", -- Jianshilan
      lavender = "#66A9C9", -- Jianshilan
      -- Cyan
      sky = "#51C4D3", -- Pubulan
      sapphire = "#51C4D3", -- Pubulan
      -- Magenta (Pink)
      pink = "#EA7293", -- Mono
      flamingo = "#EA7293", -- Mono
      -- Yellow
      yellow = "#FBB957", -- Mihuang
      maroon = "#FBB957", -- Mihuang
      peach = "#FBB957", -- Mihuang
    },
    latte = {
      -- Main colors
      text = "#2B333E", -- Qinghui
      subtext1 = "#47484C", -- Waguanhui
      subtext0 = "#47484C", -- Waguanhui
      overlay2 = "#B2BBBE", -- Xinghui
      overlay1 = "#B2BBBE", -- Xinghui
      overlay0 = "#B2BBBE", -- Xinghui
      surface2 = "#E4DFD7", -- Zhenzhuhui
      surface1 = "#E4DFD7", -- Zhenzhuhui
      surface0 = "#E4DFD7", -- Zhenzhuhui
      base = "#F8F4ED", -- Hanbaiyu
      mantle = "#F8F4ED", -- Hanbaiyu
      crust = "#F8F4ED", -- Hanbaiyu
      -- Accent colors
      -- Red
      red = "#C21F30", -- Fengyehong
      rosewater = "#C21F30", -- Fengyehong
      -- Green
      green = "#12AA9C", -- Meidielü
      teal = "#12AA9C", -- Meidielü
      -- Blue
      blue = "#1661AB", -- Dianqing
      mauve = "#1661AB", -- Dianqing
      lavender = "#1661AB", -- Dianqing
      -- Cyan
      sky = "#1E9EB3", -- Cuilan
      sapphire = "#1E9EB3", -- Cuilan
      -- Magenta (Pink)
      pink = "#EE2C79", -- Zijinghong
      flamingo = "#EE2C79", -- Zijinghong
      -- Yellow
      yellow = "#806332", -- Canghuang
      maroon = "#806332", -- Canghuang
      peach = "#806332", -- Canghuang
    },
  },
  highlight_overrides = {
    all = function(p)
      return {
        -- Builtins
        NormalFloat = { fg = p.text, bg = p.surface0 },
        -- If you prefer grey-scale comment, consider p.overlay0
        Comment = { fg = p.yellow },
        Character = { fg = p.red },
        String = { fg = p.blue },
        Constant = { link = "String" },
        Boolean = { link = "Constant" },
        Number = { link = "Constant" },
        Float = { link = "Constant" },
        Identifier = { fg = p.green },
        Function = { link = "Identifier" },
        Statement = { fg = p.pink },
        Conditional = { link = "Statement" },
        Repeat = { link = "Statement" },
        Label = { link = "Statement" },
        Operator = { link = "Statement" },
        Keyword = { link = "Statement" },
        Exception = { link = "Statement" },
        PreProc = { fg = p.pink },
        Include = { link = "PreProc" },
        Define = { link = "PreProc" },
        Macro = { link = "PreProc" },
        PreCondit = { link = "PreProc" },
        Type = { fg = p.sky },
        StorageClass = { link = "Type" },
        Structure = { link = "Type" },
        Typedef = { link = "Type" },
        Special = { fg = p.pink },
        SpecialChar = { link = "Special" },
        Tag = { link = "Special" },
        SpecialComment = { link = "Special" },
        Debug = { link = "Special" },
        Underlined = { fg = p.sky, style = { "underline" } },
        Ignore = { fg = p.overlay0 },
        Conceal = { fg = p.overlay0 }, -- Same as Ignore
        NonText = { fg = p.overlay0 }, -- Same as Ignore
        EndOfBuffer = { fg = p.overlay0 }, -- Same as Ignore
        Whitespace = { fg = p.overlay0 }, -- Same as Ignore
        VertSplit = { fg = p.overlay0 }, -- Same as Ignore
        WinSeparator = { fg = p.overlay0 }, -- Same as Ignore
        LineNr = { fg = p.overlay0 }, -- Same as Ignore
        CursorLineNr = { fg = p.subtext0 }, -- The most contrast
        Error = { fg = p.red },
        Todo = { fg = p.sky },
        CursorLine = { bg = p.surface0 },
        ColorColumn = { link = "CursorLine" },
        FloatBorder = { fg = p.overlay0, bg = p.surface0 },
        MsgArea = { bg = p.base },
        StatusLine = { fg = p.text, bg = p.surface0 },
        StatusLineNC = { fg = p.subtext0, bg = p.surface0 },
        CurSearch = { link = "IncSearch" },
        Pmenu = { fg = p.text, bg = p.surface0 },
        PmenuKind = { fg = p.text, bg = p.surface0 },
        PmenuExtra = { fg = p.text, bg = p.surface0 },
        PmenuSel = { fg = p.surface0, bg = p.text, style = {} },
        PmenuKindSel = { fg = p.surface0, bg = p.text },
        PmenuExtraSel = { fg = p.surface0, bg = p.text },

        -- blink.cmp
        BlinkCmpMenuSelection = { link = "PmenuSel" },

        -- LSP
        LspInlayHint = { fg = p.overlay0 }, -- Same as Ignore
        ["@lsp.mod.documentation"] = { fg = p.red },
        ["@lsp.typemod.comment.documentation"] = { fg = p.red },

        -- Mini
        MiniFilesCursorLine = { style = { "reverse" } },
        MiniHipatternsFixme = { fg = p.red, bg = p.surface0 },
        MiniHipatternsHack = { fg = p.pink, bg = p.surface0 },
        MiniHipatternsTodo = { fg = p.sky, bg = p.surface0 },
        MiniHipatternsNote = { fg = p.sky, bg = p.surface0 },
        MiniPickPrompt = { fg = p.sky, bg = p.surface0 },
        MiniPickBorderText = { fg = p.overlay0, bg = p.surface0 },
        MiniPickMatchCurrent = { style = { "reverse" } },
        MiniStatuslineInactive = { fg = p.overlay0, bg = p.surface0 },
        MiniTablineCurrent = { fg = p.text, bg = p.base, style = {} },
        MiniTablineFill = { bg = p.surface0 },
        MiniTablineHidden = { fg = p.overlay0, bg = p.surface0 },
        MiniTablineVisible = { fg = p.overlay0, bg = p.base },

        -- Treesitter
        ["@comment.documentation"] = { fg = p.red },
        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { link = "Constant" },
        ["@constructor"] = { link = "Type" },
        ["@field"] = { fg = p.text },
        ["@function.builtin"] = { link = "Function" },
        ["@function.macro"] = { link = "Macro" },
        ["@keyword"] = { link = "Keyword" },
        ["@keyword.function"] = { link = "Keyword" },
        ["@keyword.operator"] = { link = "Operator" },
        ["@keyword.return"] = { link = "Operator" },
        ["@keyword.import.c"] = { link = "Include" },
        ["@keyword.import.cpp"] = { link = "Include" },
        ["@label"] = { link = "Label" },
        ["@label.json"] = { link = "Label" },
        ["@markup.link.url"] = { link = "Underlined" },
        ["@namespace"] = { link = "Identifier" },
        ["@number"] = { link = "Number" },
        ["@number.css"] = { link = "Number" },
        ["@parameter"] = { fg = p.text },
        ["@parameter.reference"] = { fg = p.text },
        ["@property"] = { fg = p.text },
        ["@property.class.css"] = { link = "Type" },
        ["@property.css"] = { fg = p.text },
        ["@property.id.css"] = { fg = p.text },
        ["@property.toml"] = { fg = p.text },
        ["@punctuation.bracket"] = { link = "Ignore" },
        ["@punctuation.delimiter"] = { link = "Ignore" },
        ["@punctuation.special"] = { link = "SpecialChar" },
        ["@string"] = { link = "String" },
        ["@string.escape"] = { link = "Identifier" },
        ["@string.plain.css"] = { link = "String" },
        ["@string.regex"] = { link = "SpecialChar" },
        ["@string.special"] = { link = "SpecialChar" },
        ["@string.special.url"] = { link = "Underlined" },
        ["@symbol"] = { link = "Type" },
        ["@tag"] = { link = "Tag" },
        ["@tag.attribute"] = { link = "@property" },
        ["@tag.delimiter"] = { link = "@punctuation.delimiter" },
        ["@text"] = { fg = p.text },
        ["@text.emphasis"] = { fg = p.yellow, style = { "italic" } },
        ["@text.literal"] = { fg = p.green },
        ["@text.note"] = { link = "MiniHipatternsNote" },
        ["@text.reference"] = { fg = p.pink },
        ["@text.strong"] = { fg = p.sky, style = { "bold" } },
        ["@text.title"] = { fg = p.sky },
        ["@text.todo"] = { link = "MiniHipatternsTodo" },
        ["@text.underline"] = { link = "Underlined" },
        ["@text.uri"] = { link = "Underlined" },
        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { link = "Type" },
        ["@type.builtin.c"] = { link = "Type" },
        ["@type.builtin.cpp"] = { link = "Type" },
        ["@type.css"] = { link = "Type" },
        ["@type.qualifier"] = { link = "Type" },
        ["@type.tag.css"] = { link = "Tag" },
        ["@variable"] = { fg = p.text },
        ["@variable.builtin"] = { link = "Type" },
        ["@variable.member"] = { fg = p.text },
        ["@variable.parameter"] = { fg = p.text },
        ["@variable.parameter.builtin"] = { link = "Type" },
      }
    end,
  },
  styles = {
    comments = {},
    conditionals = {},
  },
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
