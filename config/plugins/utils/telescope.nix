{
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
      };
      fzf-native = {
        enable = true;
      };
    };
    lazyLoad = {
      enable = true;
      settings = {
        cmd = [
          "Telescope"
        ];
        keys = [
          {
            __unkeyed-1 = "<leader>fb";
            __unkeyed-2 = "<CMD>Telescope buffers<CR>";
            desc = "Telescope buffers";
          }
          {
            __unkeyed-1 = "<leader>ff";
            __unkeyed-2.__raw = ''
              function()
                require("telescope.builtin").find_files()
              end
            '';
          }
          {
            __unkeyed-1 = "<leader>fr";
            __unkeyed-2.__raw = ''
              function()
                require("telescope.builtin").live_grep()
              end
            '';
            desc = "Telescope live_grep";
          }
          {
            __unkeyed-1 = "<leader>/";
            __unkeyed-2.__raw = ''
              function()
                require("telescope.builtin").live_grep()
              end
            '';
            desc = "Telescope live_grep";
          }
        ];
      };
    };
    settings = {
      pickers = {
        # Live Grep - 无预览，只显示结果
        live_grep = {
          previewer = false; # 关键：禁用预览

          theme = null; # 不使用主题，自定义布局

          # 使用垂直布局，最大化结果显示区域
          layout_strategy = "vertical";
          layout_config = {
            vertical = {
              width = 0.8;
              height = 0.9;
              preview_cutoff = 0; # 永不显示预览
              mirror = false;
            };
          };

          # 图标和格式
          prompt_prefix = " ";
          selection_caret = " ";

          # 路径显示方式
          path_display = [ "smart" ]; # 或 "smart", "absolute", "tail"

          # 排序
          sorting_strategy = "ascending";

          # 只搜索文件内容，不搜索文件名
          only_sort_text = true;
        };

        # Grep String - 同样配置
        grep_string = {
          previewer = false;
          layout_strategy = "vertical";
          layout_config = {
            vertical = {
              width = 0.8;
              height = 0.9;
            };
          };
          prompt_prefix = " ";
        };
      };
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
    };
    keymaps = {
      # "<leader>ss" = {
      #   action = "aerial";
      #   options.desc = "Goto Symbol(Aerial)";
      # };
      "<leader>ds" = {
        action = "lsp_dynamic_workspace_symbols";
        options.desc = "Dynamic Workspace Symbols";
      };
      "<leader><space>" = {
        action = "find_files";
        options = {
          desc = "Find project files";
        };
      };
      "<leader>:" = {
        action = "command_history";
        options = {
          desc = "Command History";
        };
      };
      "<leader>b" = {
        action = "buffers";
        options = {
          desc = "+buffer";
        };
      };
      "<leader>ff" = {
        action = "find_files";
        options = {
          desc = "Find project files";
        };
      };
      "<leader>fR" = {
        action = "resume";
        options = {
          desc = "Resume";
        };
      };
      "<leader>fg" = {
        action = "oldfiles";
        options = {
          desc = "Recent";
        };
      };
      "<leader>fb" = {
        action = "buffers";
        options = {
          desc = "Buffers";
        };
      };
      "<C-p>" = {
        action = "git_files";
        options = {
          desc = "Search git files";
        };
      };
      "<leader>gc" = {
        action = "git_commits";
        options = {
          desc = "Commits";
        };
      };
      "<leader>gs" = {
        action = "git_status";
        options = {
          desc = "Status";
        };
      };
      "<leader>sa" = {
        action = "autocommands";
        options = {
          desc = "Auto Commands";
        };
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find";
        options = {
          desc = "Buffer";
        };
      };
      "<leader>sc" = {
        action = "command_history";
        options = {
          desc = "Command History";
        };
      };
      "<leader>sC" = {
        action = "commands";
        options = {
          desc = "Commands";
        };
      };
      "<leader>sD" = {
        action = "diagnostics";
        options = {
          desc = "Workspace diagnostics";
        };
      };
      "<leader>sh" = {
        action = "help_tags";
        options = {
          desc = "Help pages";
        };
      };
      "<leader>sH" = {
        action = "highlights";
        options = {
          desc = "Search Highlight Groups";
        };
      };
      "<leader>sk" = {
        action = "keymaps";
        options = {
          desc = "Keymaps";
        };
      };
      "<leader>sM" = {
        action = "man_pages";
        options = {
          desc = "Man pages";
        };
      };
      "<leader>sm" = {
        action = "marks";
        options = {
          desc = "Jump to Mark";
        };
      };
      "<leader>so" = {
        action = "vim_options";
        options = {
          desc = "Options";
        };
      };
      "<leader>sR" = {
        action = "resume";
        options = {
          desc = "Resume";
        };
      };
      "<leader>uC" = {
        action = "colorscheme";
        options = {
          desc = "Colorscheme preview";
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options = {
        desc = "Document diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>Telescope file_browser<cr>";
      options = {
        desc = "File browser";
      };
    }
    {
      mode = "n";
      key = "<leader>fE";
      action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>";
      options = {
        desc = "File browser";
      };
    }
  ];
  extraConfigLua = ''
    require("telescope").setup{
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
    }
  '';
}
