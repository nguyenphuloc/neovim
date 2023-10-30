return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")
    local g = vim.g

    -- recommended settings from nvim-tree documentation
    g.loaded_netrw = 1
    g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    vim.cmd([[ hi NvimTreeSpecialFile guifg=#ff7800 ]])

    -- configure nvim-tree
    nvimtree.setup({
      diagnostics = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        group_empty = true,
      },
      update_focused_file = {
        enable = true,
        ignore_list = {},
      },
    })

    -- set keymaps
    local keymap = vim.keymap
    local nt_api = require("nvim-tree.api")

    keymap.set('n', '<C-f>', nt_api.tree.toggle, { noremap = true, silent = true })
    keymap.set('n', '<C-i>', nt_api.tree.change_root_to_node, { noremap = true, silent = true })
    keymap.set("n", "tf", nt_api.tree.focus)
  end,
}
