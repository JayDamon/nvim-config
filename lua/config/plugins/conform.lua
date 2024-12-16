return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        html = { "htmlbeautifier" },
        bash = { "beautysh" },
        yaml = { "yamlfix" },
        css = { { "prettierd", "pretier" } },
        scss = { { "prettierd", "prettier" } },
        sh = { { "shellcheck" } },
        go = { { "gofmt" } },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>l", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end
}
