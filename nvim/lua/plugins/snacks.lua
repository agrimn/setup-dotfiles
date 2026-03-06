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
    },
    picker = {
      enabled = true,
      ui_select = true,
      focus = "input",
    },
  },
}
