return {
  (_G.llm == "copilot") and {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {
      question_header = "## Jay",
      answer_header = "## Copilot",
      error_header = "## Error",
      mappings = {
        complete = {
          detail = "Use@<Tab> or /<Tab> for options.",
          insert = "<Tab>",
        },
        close = {
          normal = "q",
          insert = "<C-c>",
        },
        reset = {
          normal = "<C-x>",
          insert = "<C-x>",
        },
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-Space>",
        },
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
        },
        show_help = {
          normal = "g?",
        },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)
      vim.keymap.set("n", "<leader>cp", "<cmd>CopilotChatToggle<cr>", { desc = "Copilot Chat Toggle " })
    end,
  } or nil,
  (_G.llm == "amazon-q") and {
    nil
  } or nil,
}
