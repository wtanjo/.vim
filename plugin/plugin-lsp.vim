vim9script

set completeopt=menuone,noinsert,noselect
set updatetime=500
def SetUpLsp()
  var lspOpts = {
    autoComplete: true,
    omniComplete: true,                   # 自动设置omnifunc
    showSignature: true,                  # 补全时显示函数参数签名
    autoCompleteDelay: 100,               # 延迟100毫秒触发
    menuMaxHeight: 15,                    # 补全菜单高度
    showDiagWithVirtualText: false,
    autoPopulateDiags: true
  }
  g:LspOptionsSet(lspOpts)

  var lspServers = [
    {
        name: 'clangd',
        filetype: ['c', 'cpp'],
        path: 'clangd',
        args: ['--background-index', '--clang-tidy']
    },
    {
      name: 'pyright',
      filetype: 'python',
      path: 'pyright-langserver.cmd',
      args: ['--stdio'],
      # rootSearch: ['.venv/', '.git/', 'pyproject.toml', 'pyrightconfig.json', 'requirements.txt'],
      workspaceConfig: {
        python: {
          pythonPath: exepath('python')
        }
      }
    },
    {
      name: 'gopls',
      filetype: 'go',
      path: 'gopls',
      args: ['serve'],
      workspaceConfig: {
        gopls: {
          hints: {
            assignVariableTypes: true,
            compositeLiteralFields: true,
            compositeLiteralTypes: true,
            constantValues: true,
            functionTypeParameters: true,
            parameterNames: true,
            rangeVariableTypes: true
          }
        }
      }
    }
  ]
  g:LspAddServer(lspServers)
enddef
autocmd User LspSetup SetUpLsp()

nnoremap <leader>lh :LspHover<CR>
nnoremap <leader>lds :LspDiagShow<CR>
nnoremap <leader>ldf :LspDiagFirst<CR>
nnoremap <leader>ldl :LspDiagLast<CR>
nnoremap <leader>ldc :LspDiagCurrent<CR>
nnoremap <leader>ldn :LspDiagNext<CR>
nnoremap <leader>ldp :LspDiagPrev<CR>
nnoremap <leader>lgdf :LspGotoDefinition<CR>
nnoremap <leader>lgdc :LspGotoDeclaration<CR>
nnoremap <leader>lgim :LspGotoImpl<CR>
nnoremap <leader>lgtd :LspGotoTypeDef<CR>
nnoremap <leader>lf :LspFormat<CR>
