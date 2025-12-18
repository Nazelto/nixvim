_: {
  plugins.actions-preview = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings = {
        keys = [
          {
            __unkeyed-1 = "<leader>ca";
            __unkeyed-2.__raw = ''
              function()
                require("actions-preview").code_actions()
              end
            '';
          }
        ];
      };
    };
    settings = {
      # 浮动窗口样式
      backend = [ "telescope" ];
      # 窗口配置
      telescope = {
        sorting_strategy = "ascending";
        layout_strategy = "vertical";
        layout_config = {
          width = 0.8;
          height = 0.9;
          prompt_position = "top";
          preview_cutoff = 20;
          preview_height = 0.6;
        };
        # 高亮预览差异
        diff = {
          algorithm = "patience";
          ignore_whitespace = true;
        };

      };
    };
  };
  # 高亮预览差异
  # keymaps = [
  #   {
  #     mode = "n";
  #     key = "<leader>ca";
  #     action.__raw = ''
  #       function()
  #         require("actions-preview").code_actions()
  #       end
  #     '';
  #     options = {
  #       desc = "codeAction(Preview)";
  #     };
  #   }
  # ];
}
