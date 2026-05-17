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

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities({}, true),
})

vim.lsp.enable({
  'lua_ls',
  'nil',
  'nixd',
  'gopls',
  'ts_ls',
  'vue',
})

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

vim.lsp.config("ts_ls", {
  cmd = { 'typescript-language-server', '--stdio' },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/Users/marufs/.nvm/versions/node/v20.18.3/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

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

-- ESLint Server
vim.lsp.config('eslint', {
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_dir = vim.fs.root(0,
    { '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.json', 'eslint.config.js', 'package.json', '.git' }),
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
  root_dir = vim.fs.root(0, { 'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'package.json', '.git' }),
  settings = {
    tailwindCSS = {
      classAttributes = { 'class', 'className', 'classList', 'ngClass' },
    },
  },
})
