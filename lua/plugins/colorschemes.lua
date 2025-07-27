return {
  {
    'rebelot/kanagawa.nvim',
    branch = 'master',
    priority = 1000,
    lazy = false,
    build = ':KanagawaCompile',
    config = function()
      vim.cmd('colorscheme kanagawa')
    end,
  },
}
