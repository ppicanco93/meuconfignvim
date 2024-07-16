return {

{ "rose-pine/neovim", name = "rose-pine" },
{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opt = {gruvbox_transparent_bg = 1}},
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
