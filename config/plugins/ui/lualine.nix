{ config, ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
        extensions = [
          "fzf"
          "neo-tree"
        ];
        disabledFiletypes = {
          statusline = [
            "startup"
            "alpha"
          ];
        };
        theme = "catppuccin";
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            icon = "";
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          {
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "diagnostics";
            sources = [ "nvim_lsp" ];
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
          }
          {
            __unkeyed-1 = "navic";
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = "filetype";
            icon_only = true;
            separator = "";
            padding = {
              left = 1;
              right = 0;
            };
          }
          {
            __unkeyed-1 = "filename";
            path = 1;
          }
          {
            # __unkeyed-1.__raw = ''
            #   function()
            #     local icon = " "
            #     local status = require("copilot.api").status.data
            #     return icon .. (status.message or " ")
            #   end,
            #
            #   cond = function()
            #    local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
            #    return ok and #clients > 0
            #   end,
            # '';
            __unkeyed-1.__raw = ''
              function()
                local icon = " "
                
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  local buf = vim.api.nvim_win_get_buf(win)
                  local bufname = vim.api.nvim_buf_get_name(buf)
                  
                  if string.match(bufname:lower(), "claude") then
                    -- 使用高亮组
                    return string.format(
                      "%%#DiagnosticInfo#%s%%#String#ClaudeCode using...%%#Normal#",
                      icon
                    )
                  end
                end
                
                return ""
              end,

              cond = function()
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                  if vim.api.nvim_buf_is_valid(buf) then
                    local bufname = vim.api.nvim_buf_get_name(buf)
                    if string.match(bufname:lower(), "claude") then
                      return true
                    end
                  end
                end
                return false
              end,
            '';
          }
          # 第二个自定义函数 - 显示 LSP 客户端（带图标和颜色）
          {
            __unkeyed-1.__raw = ''
              function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                
                -- 如果没有 LSP 客户端，不显示 图标
                if next(clients) == nil then
                  return ""
                end
                
                -- LSP 图标映射表（仅图标）
                local lsp_icons = {
                  ["rust-analyzer"] = {
                    icon = "🦀",
                    hl = "%#DiagnosticOk#"
                  },
                  ["lua_ls"] = {
                    icon = "🌙",
                    hl = "%#DiagnosticInfo#"
                  },
                  ["pyright"] = {
                    icon = "🐍",
                    hl = "%#DiagnosticWarn#"
                  },
                  ["tsserver"] = {
                    icon = "📜",
                    hl = "%#DiagnosticHint#"
                  },
                  ["nil_ls"] = {
                    icon = "❄️",
                    hl = "%#DiagnosticInfo#"
                  },
                  ["nixd"] = {
                    icon = "❄️",
                    hl = "%#DiagnosticInfo#"
                  },
                }
                
                local parts = {}
                for _, client in pairs(clients) do
                    if client.name == "copilot" then
                      goto continue
                    end
                  local config = lsp_icons[client.name]
                  if config then
                    table.insert(parts, config.hl .. config.icon .. "%#Normal#")
                  else
                    -- 未知 LSP 使用默认图标
                    table.insert(parts, "%#Comment#⚙️%#Normal#")
                  end
                  ::continue::
                end
                
                return table.concat(parts, " ")
              end
            '';
          }
        ];
        lualine_y = [
          {
            __unkeyed-1 = "progress";
          }
        ];
        lualine_z = [
          {
            __unkeyed-1 = "location";
          }
          {
            __unkeyed-1.__raw = ''
              function()
                local lzn = require("lz.n")
                
                -- 尝试使用 lookup 方法
                if type(lzn.lookup) == "function" then
                  -- 查找一个已知的插件（替换为你实际使用的插件名）
                  local plugin = lzn.lookup("telescope.nvim")
                  if plugin then
                    return "󰒲 Found: telescope"
                  else
                    return "󰒲 lookup works but no plugin"
                  end
                end
                
                return "󰒲 No lookup"
              end
            '';
          }
        ];
      };
    };
  };
}
