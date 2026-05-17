------------------------------------------------
-- 1. Fix TSX filetype detection (Neovim 0.12)
-------------------------------------------------
vim.filetype.add({
  extension = {
    tsx = "typescriptreact",
  },
})

-------------------------------------------------
-- 2. TS CONTEXT COMMENTSTRING
-------------------------------------------------
require("ts_context_commentstring").setup({
  enable_autocmd = false,
})

-------------------------------------------------
-- 3. Load Treesitter for vue
-------------------------------------------------
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'vue',
  callback = function(ev)
    vim.treesitter.start(ev.buf, 'vue')
    vim.bo[ev.buf].syntax = 'ON'             -- only if additional legacy syntax is needed
  end
})
