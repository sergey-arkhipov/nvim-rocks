require("luasnip").setup({
  version = "v2.*",
  build = "make install_jsregexp",
    require("luasnip.loaders.from_vscode").lazy_load(),
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { '/home/sergey/.local/share/nvim/site/pack/luarocks/opt/friendly-snippets/snippets' }
    })
})
