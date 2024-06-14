return { -- ############### Autocompletar ##############################
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Motor de Snippet & sua fonte associada ao nvim-cmp
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Etapa de compilação necessária para suporte a regex em snippets.
          -- Esta etapa não é suportada em muitos ambientes Windows.
          -- Remova a condição abaixo para reativar no Windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contém uma variedade de snippets prontos.
          -- Veja o README sobre snippets individuais de linguagem/framework/plugin:
          -- https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adiciona outras capacidades de autocompletar.
      --  nvim-cmp não vem com todas as fontes por padrão. Elas são divididas
      --  em múltiplos repositórios para fins de manutenção.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- Veja `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- Para entender porque esses mapeamentos foram
        -- escolhidos, você precisará ler `:help ins-completion`
        --
        -- Não, mas falando sério. Por favor, leia `:help ins-completion`, é realmente bom!
        mapping = cmp.mapping.preset.insert {
          -- Selecionar o próximo item [n]
          --['<C-n>'] = cmp.mapping.select_next_item(),
          -- Selecionar o item anterior [p]
          --['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Rolar a janela de documentação para trás [b] / para frente [f]
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Aceitar ([y]es) o autocompletar.
          -- Isso fará auto-import se seu LSP suportar.
          -- Isso expandirá snippets se o LSP enviar um snippet.
          --['<C-y>'] = cmp.mapping.confirm { select = true },

          -- Aperta enter para escolher o autocomplete, antes era ['<C-y>'], acima.
          ['<CR>'] = cmp.mapping.confirm { select = true },
          -- Com tab você navega para o próximo autocomplete, antes era ['<C-n>'], acima.
          ['<Tab>'] = cmp.mapping.select_next_item(),
          -- Seleciona o anterior usando shift tab, antes era ['<C-p>'], acima.
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Acionar manualmente um autocompletar do nvim-cmp.
          -- Geralmente você não precisa disso, porque o nvim-cmp exibirá
          -- opções de autocompletar sempre que tiver opções disponíveis.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Pense em <c-l> como mover para a direita da sua expansão de snippet.
          -- Então, se você tiver um snippet assim:
          -- function $name($args)
          -- $body
          -- end
          --
          -- <c-l> moverá você para a direita de cada um dos locais de expansão.
          -- <c-h> é semelhante, exceto que move você para trás.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- Para mapeamentos de teclas mais avançados do Luasnip (por exemplo, selecionando nós de escolha, expansão) veja:
          -- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
}

