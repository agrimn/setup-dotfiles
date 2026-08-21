-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

---@diagnostic disable: undefined-global

-- space is your leader
vim.g.mapleader = " "

local map = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}

-- Window navigation is owned by vim-tmux-navigator (<C-h/j/k/l>).
-- Do NOT map them here: lazy.nvim's `keys` stub wins anyway, so these were dead
-- code, and having two sources for the same key made the conflict invisible.

-- Quick jump to windows
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>l", "<C-w>l", opts)

-- Clear search highlight
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts)

-- LSP symbol search
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols (current file)" })
map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Symbols (workspace)" })

-- Auto-reveal current file in snacks explorer on buffer change
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      Snacks.explorer.reveal()
    end
  end,
})

-- JSON prettify / minimize/ stringify/ unstringify
map("n", "<leader>jp", "<cmd>%!jq .<CR>", { desc = "JSON Prettify" })
map("n", "<leader>jm", "<cmd>%!jq -c .<CR>", { desc = "JSON Minimize" })
map("n", "<leader>js", "<cmd>%!jq -c . | jq -Rs .<CR>", { desc = "JSON Stringify" })
map("n", "<leader>ju", "<cmd>%!jq -r .<CR>", { desc = "JSON Unstringify" })

-- Terminal
map("n", "<leader>tt", "<cmd>split | terminal<CR>", { desc = "Open terminal" })

-- Disable nvim 0.11 built-in LSP defaults that conflict with LazyVim/Telescope
-- grr = references, gra = code action, gri = implementation, grn = rename
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")

-- buffer Navigation ("Vim Tabs")
map("n", "<leader>bn", "<cmd>bnext<CR>", opts)
map("n", "<leader>bp", "<cmd>bprevious<CR>", opts)
map("n", "<leader>bd", function()
  require("snacks.bufdelete").delete()
end, opts)
