return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>ar", "<cmd>lua require('kulala').run()<cr>", desc = "Run request" },
    { "<leader>ai", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect request" },
    { "<leader>av", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle view" },
    { "<leader>ac", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as curl" },
    {
      "<leader>ad",
      function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == "text.kulala_ui" then
            vim.api.nvim_win_close(win, true)
            return
          end
        end
      end,
      desc = "Close kulala window",
    },
  },
  config = function()
    require("kulala").setup({
      default_view = "body",
      formatters = {
        json = "jq .",
        html = "tidy -i -q -",
        xml = "xmllint --format -",
        yaml = "yq eval -P -",
      },
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "text.kulala_ui",
      callback = function()
        vim.wo.wrap = true
        vim.wo.linebreak = true
      end,
    })
  end,
}
