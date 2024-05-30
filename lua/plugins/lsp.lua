return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      -- vim.lsp.set_log_level("error")
      vim.lsp.set_log_level("off")
      vim.keymap.set("n", "gl", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
      -- vim.keymap.set('n', '<c-q>', vim.diagnostic.setloclist)
      -- vim.keymap.set("n", "<leader>lf", "vim.lsp.buf.formatting")
      -- vim.keymap.set('v', '<leader>lf', "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>")

      -- diagnostic
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),

        callback = function(ev)
          local buffer = ev.buf
          local opts = { buffer = buffer, silent = true }

          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set({ "n", "v" }, "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, opts)

          -- inlay hints
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client.supports_method("textDocument/inlayHint") or client.server_capabilities.inlayHintProvider then
            if vim.lsp.inlay_hint then
              vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
            end
          end
        end,
      })

      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "lua_ls",
          "clangd",
        },
      })
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local util = require("lspconfig.util")
          local opts = {
            clangd = {},
            pyright = {},
            lua_ls = {},
          }

          if opts[server_name] then
            local server_opt = opts[server_name]
            require("lspconfig")[server_name].setup(
              vim.tbl_deep_extend("force", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
              }, server_opt)
            )
          else
            require("lspconfig")[server_name].setup({
              capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })
          end
        end,
      })
    end,
  },
}
