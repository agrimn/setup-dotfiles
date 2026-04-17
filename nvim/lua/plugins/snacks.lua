return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      -- Fixed, predictable width
      width = 30,
      -- Focus explorer when opening
      focus = true,
      -- Keep window layout stable
      auto_close = false,
      -- Show hidden/dot files
      hidden = true,
    },
    picker = {
      enabled = true,
      ui_select = true,
      focus = "input",
    },
  },
}
