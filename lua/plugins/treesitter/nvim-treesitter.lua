return  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
    config = function()
      local parsers = {
      'bash', 'c', 'diff',
      'html', 'lua', 'luadoc',
      'markdown', 'markdown_inline', 'make', 'css',
      'query', 'vim', 'vimdoc', 'dockerfile',
      'go', 'python', 'javascript', 'typescript', 'tsx'
    }
    -- No repo do kickstart estava como require('nvim-treesitter').install(parsers), mas o quando eu
    -- iniciava o neovim, gerava o erro: attempt to call field 'install' (a nil value)
    -- Então troquei pela forma abaixo e funcinou. Foi o chatgpt quem indicou
      require('nvim-treesitter').install(parsers)
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then return end

          -- check if parser exists and load it
          if not vim.treesitter.language.add(language) then return end
          -- enables syntax highlighting and other treesitter features
          vim.treesitter.start(buf, language)

          -- enables treesitter based folds
          -- for more info on folds see `:help folds`
          -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- vim.wo.foldmethod = 'expr'

          -- enables treesitter based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  }
