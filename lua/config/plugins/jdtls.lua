return {
  {
    'mfussenegger/nvim-jdtls',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
    config = function()
      local jdtls = require('jdtls')
      local mason_registry = require('mason-registry')

      -- Ensure JDTLS is installed via Mason
      if not mason_registry.is_installed('jdtls') then
        mason_registry.get_package('jdtls'):install()
      end

      local jdtls_path = mason_registry.get_package('jdtls'):get_install_path()
      local config = {
        cmd = { jdtls_path .. '/bin/jdtls' },
        root_dir = require('jdtls.setup').find_root({ 'pom.xml', '.git', 'mvnw', 'gradlew' }),
        settings = {
          java = {
            referencesCodeLens = true,
            implementationCodeLens = true,
            format = {
              enabled = true,
            },
          },
        },
      }

      jdtls.start_or_attach(config)

      vim.api.nvim_create_user_command('Decompile', function(opts)
        local file = opts.args
        local output = vim.fn.tempname() .. '.java'
        local cmd = string.format('cfr %s > %s', file, output)
        vim.fn.system(cmd)
        vim.cmd('edit ' .. output)
      end, { nargs = 1, complete = 'file', desc = 'Decompile a Java class file' })

      vim.keymap.set('n', '<leader>gd', require('telescope.builtin').lsp_definitions)
      vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references)
      vim.keymap.set('n', '<leader>gi', require('telescope.builtin').lsp_implementations)
    end,
  },
}
