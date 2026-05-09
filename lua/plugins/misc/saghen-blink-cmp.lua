require('luasnip').setup {}

require("blink.cmp").setup({
  keymap = {
    -- Confirm completion with enter
    preset = "enter",

    -- Next suggestion
    ["<Tab>"] = { "select_next", "fallback" },

    -- Previous suggestion
    ["<S-Tab>"] = { "select_prev", "fallback" },
  },

  appearance = {
    -- Adjust spacing for Nerd Font Mono
    nerd_font_variant = "mono",
  },

  completion = {
    documentation = {
      auto_show = false,
      auto_show_delay_ms = 500,
    },
  },

  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
    },
  },

  snippets = {
    preset = "luasnip",
  },

  -- Use Lua fuzzy matcher implementation
  fuzzy = {
    implementation = "lua",
  },

  -- Shows signature help while typing function arguments
  signature = {
    enabled = true,
  },
})
