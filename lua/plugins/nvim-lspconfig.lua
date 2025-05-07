return { -- ############### Configuração & Plugins LSP ###############
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Instala automaticamente LSPs e ferramentas relacionadas para o stdpath do Neovim
    { 'williamboman/mason.nvim', config = true }, -- NOTA: Deve ser carregado antes das dependências
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Atualizações de status úteis para LSP.
    -- NOTA: `opts = {}` é o mesmo que chamar `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    -- Breve aparte: **O que é LSP?**
    --
    -- LSP é um acrônimo que você provavelmente já ouviu, mas pode não entender o que é.
    --
    -- LSP significa Language Server Protocol. É um protocolo que ajuda editores
    -- e ferramentas de linguagem a se comunicarem de forma padronizada.
    --
    -- Em geral, você tem um "servidor" que é uma ferramenta criada para entender uma linguagem específica
    -- (como `gopls`, `lua_ls`, `rust_analyzer`, etc.). Esses Servidores de Linguagem
    -- (às vezes chamados de servidores LSP, mas isso é como chamar um caixa eletrônico de "Máquina ATM") são processos autônomos
    -- que se comunicam com algum "cliente" - neste caso, o Neovim!
    --
    -- O LSP fornece ao Neovim recursos como:
    --  - Ir para a definição
    --  - Encontrar referências
    --  - Autocompletar
    --  - Busca de símbolos
    --  - e mais!
    --
    -- Assim, os Servidores de Linguagem são ferramentas externas que devem ser instaladas separadamente do
    -- Neovim. É aqui que `mason` e plugins relacionados entram em jogo.
    --
    -- Se você está se perguntando sobre LSP vs treesitter, você pode verificar a seção de ajuda
    -- maravilhosamente e elegantemente composta, `:help lsp-vs-treesitter`

    -- Esta função é executada quando um LSP é anexado a um buffer específico.
    -- Ou seja, toda vez que um novo arquivo é aberto e está associado a
    -- um LSP (por exemplo, abrir `main.rs` está associado ao `rust_analyzer`) esta
    -- função será executada para configurar o buffer atual
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- NOTA: Lembre-se de que Lua é uma linguagem de programação real e, como tal, é possível
        -- definir funções auxiliares e utilitárias pequenas para que você não precise se repetir.
        --
        -- Neste caso, criamos uma função que nos permite definir mais facilmente mapeamentos específicos
        -- para itens relacionados ao LSP. Ela define o modo, o buffer e a descrição para nós a cada vez.
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Pula para a definição da palavra sob o seu cursor.
        -- Isso é onde uma variável foi primeiro declarada, ou onde uma função é definida, etc.
        -- Para voltar, pressione <C-t>.
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- Encontra referências para a palavra sob o seu cursor.
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Pula para a implementação da palavra sob o seu cursor.
        -- Útil quando sua linguagem tem maneiras de declarar tipos sem uma implementação real.
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Pula para o tipo da palavra sob o seu cursor.
        -- Útil quando você não tem certeza de qual tipo uma variável é e você quer ver
        -- a definição de seu *tipo*, não onde ela foi *definida*.
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- Faz uma busca fuzzy por todos os símbolos no seu documento atual.
        -- Símbolos são coisas como variáveis, funções, tipos, etc.
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Faz uma busca fuzzy por todos os símbolos no seu workspace atual.
        -- Similar a document symbols, exceto que busca em todo o seu projeto.
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Renomeia a variável sob o seu cursor.
        -- A maioria dos Language Servers suporta renomeação entre arquivos, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Executa uma ação de código, geralmente seu cursor precisa estar sobre um erro
        -- ou uma sugestão do seu LSP para isso ativar.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- Abre um popup que exibe documentação sobre a palavra sob o seu cursor.
        -- Veja `:help K` para entender por que essa keymap existe.
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- ATENÇÃO: Isso não é Goto Definition, isso é Goto Declaration.
        -- Por exemplo, em C isso te levaria para o header.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Os dois autocomandos a seguir são usados para destacar referências da
        -- palavra sob seu cursor quando seu cursor descansar ali por um tempo.
        -- Veja `:help CursorHold` para mais informações sobre quando isso é executado
        --
        -- Quando você mover seu cursor, os destaques serão limpos (o segundo autocomando).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- O seguinte autocomando é usado para habilitar dicas embutidas no seu
        -- código, se o servidor de linguagem que você está usando as suportar
        --
        -- Isso pode ser indesejado, pois deslocam parte do seu código
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- Servidores LSP e clientes são capazes de comunicar entre si quais recursos eles suportam.
    -- Por padrão, o Neovim não suporta tudo o que está na especificação LSP.
    -- Quando você adiciona nvim-cmp, luasnip, etc., o Neovim agora tem *mais* capacidades.
    -- Então, criamos novas capacidades com nvim cmp, e então transmitimos isso para os servidores.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Habilite os seguintes servidores de linguagem
    -- Sinta-se à vontade para adicionar/remover quaisquer LSPs que você queira aqui. Eles serão instalados automaticamente.
    --
    -- Adicione qualquer configuração de substituição adicional nas tabelas a seguir. As chaves disponíveis são:
    -- - cmd (tabela): Substitui o comando padrão usado para iniciar o servidor
    -- - filetypes (tabela): Substitui a lista padrão de tipos de arquivos associados ao servidor
    -- - capabilities (tabela): Substitui campos nas capacidades. Pode ser usado para desativar certos recursos do LSP.
    -- - settings (tabela): Substitui as configurações padrão passadas ao inicializar o servidor.
    --        Por exemplo, para ver as opções para `lua_ls`, você pode ir para: https://luals.github.io/wiki/settings/
    local servers = {
      -- clangd = {},
      pyright = {},
      -- ... etc. Veja `:help lspconfig-all` para uma lista de todos os LSPs pré-configurados
      --
      -- Algumas linguagens (como typescript) têm plugins de linguagem completos que podem ser úteis:
      --    https://github.com/pmizio/typescript-tools.nvim
      --
      -- Mas para muitas configurações, o LSP (`tsserver`) funcionará bem
      -- tsserver = {},
      --

      lua_ls = {
        -- cmd = {...},
        -- filetypes = { ...},
        -- capabilities = {},
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- Você pode alternar abaixo para ignorar os avisos barulhentos de `missing-fields` do Lua_LS
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    -- Certifique-se de que os servidores e ferramentas acima estejam instalados
    -- Para verificar o status atual das ferramentas instaladas e/ou instalar manualmente
    -- outras ferramentas, você pode executar
    -- :Mason
    --
    -- Você pode pressionar `g?` para obter ajuda neste menu.
    require('mason').setup()

    -- Você pode adicionar outras ferramentas aqui que deseja que o Mason instale
    -- para você, para que estejam disponíveis dentro do Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Usado para formatar código Lua
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- Isso lida com a substituição apenas dos valores explicitamente passados
          -- pela configuração do servidor acima. Útil ao desativar
          -- certos recursos de um LSP (por exemplo, desativar a formatação para tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
