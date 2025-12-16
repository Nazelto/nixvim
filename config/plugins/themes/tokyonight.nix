{
  colorschemes = {
    tokyonight = {
      enable = true;
      settings = {
        # 对应 Catppuccin 的 flavour (可用: "storm", "night", "moon", "day")
        style = "moon";

        # 对应 Catppuccin 的 background.light 设置
        light_style = "day";

        # 对应 transparent_background
        transparent = true;

        # 对应 no_bold, no_italic 等设置
        # Tokyo Night 使用 styles 表来控制
        styles = {
          # 对应 no_italic = false (即开启斜体)
          comments = {
            italic = true;
          };
          keywords = {
            italic = true;
          };
          functions = { };
          variables = { };
          # 对应透明背景下的侧边栏和浮动窗口处理
          sidebars = "transparent";
          floats = "transparent";
        };

        # 对应 custom_highlights
        # 注意：Tokyo Night 传入的是 (hl, c)，c 代表颜色表
        on_highlights = ''
          function(hl, c)
            -- Tokyo Night 的橙色类似 Catppuccin 的 Peach
            hl.CursorLineNr = { fg = c.orange }
            hl.NavicText = { fg = c.fg }
          end
        '';

        # 对应 integrations
        # Tokyo Night 默认开启大多数插件支持，但可以在这里显式配置
        plugins = {
          # 自动开启所有支持的插件 (对应 integrations 中大量的 true)
          auto = true;

          # 显式指定部分插件配置
          treesitter = true;
          telescope = true;
          cmp = true;
          notify = true;
          gitsigns = true;
          neotree = true;
          which_key = true;
          indent_blankline = true;
          mini = true;

          # 对应 integrations.navic
          # Tokyo Night 没有 custom_bg 选项，它通常自动适配
          navic = true;

          # 对应 integrations.illuminate
          illuminate = true;

          # 对应 integrations.native_lsp
          # Tokyo Night 并没有像 Catppuccin 那样详细的 underlines/virtual_text 样式配置块
          # 这些通常需要你在 lspconfig 中配置，或者它已经提供了默认的颜色映射
          lsp_trouble = true;
          lsp_saga = true;
        };

        # 侧边栏列表 (用于透明背景判断)
        sidebars = [
          "qf"
          "help"
          "terminal"
          "packer"
          "neotree"
        ];

        # 调光未激活的窗口
        dim_inactive = false;
      };
    };
  };
}
