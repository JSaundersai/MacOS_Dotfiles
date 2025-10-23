return {
  "milanglacier/minuet-ai.nvim",
  config = function()
    require('minuet').setup({
      provider = 'openai',
      api_key = 'OPENAI_API_KEY',
      n_completions = 1,
      context_window = 512,
      provider_options = {},
    })
  end,
}
