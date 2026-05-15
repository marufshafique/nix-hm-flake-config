-- Setup completion
require('blink.cmp').setup({
  keymap = {
    preset = 'default',
    ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
  },
  sources = {
    default = { 'lsp', 'path', 'buffer' },
  },
})

vim.lsp.enable({ 'lua_ls', 'nil', 'nixd', 'gopls', 'rust_analyzer', 'ts_ls', 'eslint', 'tailwindcss' })

vim.lsp.config('lua_ls', {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } }, -- Fix 'undefined global vim' warnings
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities({}, true),
})

-- TypeScript/JavaScript Server (ts_ls)
vim.lsp.config('ts_ls', {
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_dir = vim.fs.root(0, { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' }),
  settings = {
    typescript = {
      preferences = {
        importModuleSpecifierPreference = 'non-relative',
      },
    },
    javascript = {
      preferences = {
        importModuleSpecifierPreference = 'non-relative',
      },
    },
  },
})

-- ESLint Server
vim.lsp.config('eslint', {
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_dir = vim.fs.root(0, {'.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.json', 'eslint.config.js', 'package.json', '.git'}),
  settings = {
    codeActionOnSave = {
      enable = true,
      mode = 'all',
    },
    run = 'onType',
    validate = 'on',
  },
})

-- Tailwind CSS Server
vim.lsp.config('tailwindcss', {
  filetypes = {
    'html',
    'css',
    'scss',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_dir = vim.fs.root(0, {'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'package.json', '.git'}),
  settings = {
    tailwindCSS = {
      classAttributes = { 'class', 'className', 'classList', 'ngClass' },
    },
  },
})
