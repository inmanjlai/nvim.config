-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.cmd([[
  highlight DiagnosticUnderlineError cterm=underline gui=underline guisp=Red
]])

