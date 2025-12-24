_: {
  plugins = {
    # Aerial - 符号大纲插件
    aerial = {
      enable = true;
      settings = {
        # 显示选项
        show_guides = true;
        # 布局配置
        layout = {
          max_width = [
            40
            0.2
          ];
          width = null;
          min_width = 10;

          # 默认方向
          default_direction = "prefer_right";
          placement = "window";
        };

        # 显示类型图标
        icons = {
          # 使用 nvim-web-devicons
        };

        # 自动关闭行为
        close_automatic_events = [ ];

        # 高亮配置
        highlight_on_hover = true;
        highlight_on_jump = 300;

        # 显示哪些符号类型
        filter_kind = false; # false 表示显示所有类型

        # 或者指定显示的类型（包括 Function）
        # filter_kind = {
        #   "Class";
        #   "Constructor";
        #   "Enum";
        #   "Function";
        #   "Interface";
        #   "Module";
        #   "Method";
        #   "Struct";
        # };

        # 忽略的符号类型（留空表示不忽略）
        ignore = {
          unlisted_buffers = true;
          filetypes = null;
          buftypes = "special";
          wintypes = "special";
        };

        # 自动打开 aerial
        open_automatic = false;

        # 在 aerial 窗口中的行为
        keymaps = {
          "?" = "actions.show_help";
          "g?" = "actions.show_help";
          "<CR>" = "actions.jump";
          "<2-LeftMouse>" = "actions.jump";
          "<C-v>" = "actions.jump_vsplit";
          "<C-s>" = "actions.jump_split";
          "p" = "actions.scroll";
          "<C-j>" = "actions.down_and_scroll";
          "<C-k>" = "actions.up_and_scroll";
          "{" = "actions.prev";
          "}" = "actions.next";
          "[[" = "actions.prev_up";
          "]]" = "actions.next_up";
          "q" = "actions.close";
          "o" = "actions.tree_toggle";
          "za" = "actions.tree_toggle";
          "O" = "actions.tree_toggle_recursive";
          "zA" = "actions.tree_toggle_recursive";
          "l" = "actions.tree_open";
          "zo" = "actions.tree_open";
          "L" = "actions.tree_open_recursive";
          "zO" = "actions.tree_open_recursive";
          "h" = "actions.tree_close";
          "zc" = "actions.tree_close";
          "H" = "actions.tree_close_recursive";
          "zC" = "actions.tree_close_recursive";
          "zr" = "actions.tree_increase_fold_level";
          "zR" = "actions.tree_open_all";
          "zm" = "actions.tree_decrease_fold_level";
          "zM" = "actions.tree_close_all";
          "zx" = "actions.tree_sync_folds";
          "zX" = "actions.tree_sync_folds";
        };

        # 导航配置
        nav = {
          border = "rounded";
          max_height = 0.9;
          max_width = 0.5;
          win_opts = {
            cursorline = true;
            winblend = 10;
          };
        };

        # LSP 优先级
        lsp = {
          diagnostics_trigger_update = true;
          update_when_errors = true;
          update_delay = 300;
        };

        # Treesitter 集成
        treesitter = {
          update_delay = 300;
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>AerialToggle<cr>";
      options.desc = "AerialToggle";
    }
  ];
}
