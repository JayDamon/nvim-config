return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()
      require("dap-go").setup()
      require("nvim-dap-virtual-text").setup()

      dap.adapters.java = function(callback)
        callback({
          type = 'server',
          host = '127.0.0.1',
          port = port,
        })
      end

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
    end
  }
  --  {
  --    "leoluz/nvim-dap-go",
  --    config = function()
  --      require("dap-go").setup()
  --    end,
  --  },
  --  {
  --    "jay-babu/mason-nvim-dap.nvim",
  --    dependencies = "mason.nvim",
  --    cmd = { "DapInstall", "DapUninstall" },
  --    opts = {
  --      automatic_installation = true,
  --      handlers = {},
  --      ensure_installed = {
  --        "delve"
  --      }
  --    }
  --  }
}
