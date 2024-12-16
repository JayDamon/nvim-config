return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dap.set_log_level('INFO')
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },
      {
        "leoluz/nvim-dap-go",
        config = function()
          require("dap-go").setup()
        end,
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = {
            "delve"
          },
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "leoluz/nvim-dap-go",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-go",
      "rcasia/neotest-java",
    },
    config = function()
      --      local dap = require "dap"
      --      local ui = require "dapui"
      --
      --      require("dapui").setup()
      --      require("dap-go").setup()
      --      require("nvim-dap-virtual-text").setup()
      --
      --      dap.adapters.java = function(callback)
      --        callback({
      --          type = 'server',
      --          host = '127.0.0.1',
      --          port = port,
      --        })
      --      end
      --
      --      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      --      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cdmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rspec",
              })
            end,
          }),
          require("neotest-minitest"),
          require("neotest-go"),
          require("neotest-java"),
        },
        output_panel = {
          enable = true,
          open = "botright split | resize 15",
        },
        quickfix = {
          open = false,
        },
      })
    end,
  }
}
