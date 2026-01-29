{ pkgs, ... }:
{
  plugins = {
    lsp-lines = {
      enable = true;
    };
    lsp-format = {
      enable = true;
    };
    helm = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      lazyLoad = {
        enable = true;
        settings = {
          ft = [
            "rust"
            "lua"
            "nix"
            "python"
            "haskell"
            "c++"
            "c"
          ];
        };
      };
      servers = {
        # c/cpp
        clangd = {
          enable = true;
          cmd = [
            "clangd"
            "--background-index"
            "--clang-tidy"
            "--header-insertion=iwyu"
            "--compile-commands-dir=build"
            "--completion-style=detailed"
            "--query-driver=/nix/store/**/bin/*"
          ];
        };
        hls = {
          enable = true;
          package = null;
          installGhc = false;
          cmd = [
            "haskell-language-server-wrapper"
            "--lsp"
          ];
        };
        html = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        nil_ls = {
          enable = true;
        };
        # nixd = {
        #   enable = true;
        #   settings = {
        #     nixpkgs = {
        #       expr = "import (builtins.getFlake (toString ./.)).inputs.nixpkgs {}";
        #     };
        #     eval = {
        #       target = {
        #         # installable = "(builtins.getFlake (toString ./.)).inputs";
        #         installable = "import ./.nixd-env.nix";
        #       };
        #     };
        #   };
        # };
        ts_ls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
        gopls = {
          enable = true;
          settings = {
            analyses = {
              unusedparams = true; # 检查未使用的函数参数
              shadow = true; # 检查变量遮蔽
              unusedwrite = true; # 检查无效写入
              useany = true; # 建议用any代替interface {}
            };
            staticcheck = true; # 额外静态检查
            gofumpt = true; # 格式化风格
            usePlaceholders = true; # 不全占位符
            completeUnimported = true; # 未导入包补全
            experimentalPostfixCompletions = true; # 后缀补全
            hints = {
              assignVariableTypes = true;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariableTypes = true;
            }; # inlay-hint

          };
        };
        terraformls = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          settings = {
            inlayHints = {
              enable = true;
            };
            check = {
              command = "clippy";
            };
          };
        };
        helm_ls = {
          enable = true;
          extraOptions = {
            settings = {
              "helm_ls" = {
                yamlls = {
                  path = "${pkgs.yaml-language-server}/bin/yaml-language-server";
                };
              };
            };
          };
        };
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
                  kubernetes = "'*.yaml";
                  "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                  "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                  "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
                  "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
                  "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
                  "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
                  "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                  "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                    "*docker-compose*.{yml,yaml}";
                  "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" =
                    "*flow*.{yml,yaml}";
                };
              };
            };
          };
        };
      };

      keymaps = {
        silent = true;
        lspBuf = {
          # "<leader>ca" = {
          #   action = "code_action";
          #   desc = "codeAction";
          # };
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    ansible-vim
  ];

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
  # keymaps = [
  #   #Code Actions
  #   {
  #     mode = "n";
  #     key = "<leader>ca";
  #     action = "<CMD>lua vim.lsp.buf.code_action()<CR>";
  #   }
  # ];
}
