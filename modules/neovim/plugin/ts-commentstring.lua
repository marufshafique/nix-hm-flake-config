-- Speed up startup by disabling the deprecated legacy treesitter module wrapper
vim.g.skip_ts_context_commentstring_module = true

-- Initialize the plugin
require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

-- Intercept Neovim 0.12's native comment calculation
local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
  if option == "commentstring" then
    return require("ts_context_commentstring.internal").calculate_commentstring()
  end
  return get_option(filetype, option)
end

-- Include 'comment-nvim' in your pkgs.vimPlugins array first
require('Comment').setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
