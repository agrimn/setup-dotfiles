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

-- better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Clear search highlight
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts)

-- buffer Navigation ("Vim Tabs")
map("n", "<leader>bn", "<cmd>bnext<CR>", opts)
map("n", "<leader>bp", "<cmd>bprevious<CR>", opts)
map("n", "<leader>bd", function()
  require("snacks.bufdelete").delete()
end, opts)
