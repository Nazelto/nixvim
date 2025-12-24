_: {
  imports = [
    # General Configuration
    ./settings.nix
    ./keymaps.nix
    ./auto_cmds.nix
    ./file_types.nix

    # Themes
    ./plugins/themes

    # Completion
    ./plugins/cmp/cmp.nix
    ./plugins/cmp/cmp-copilot.nix
    ./plugins/cmp/lspkind.nix
    ./plugins/cmp/autopairs.nix
    ./plugins/cmp/schemastore.nix

    # Snippets
    ./plugins/snippets/luasnip.nix

    # Editor plugins and configurations
    ./plugins/editor/neo-tree.nix
    ./plugins/editor/treesitter.nix
    ./plugins/editor/undotree.nix
    ./plugins/editor/illuminate.nix
    ./plugins/editor/indent-blankline.nix
    ./plugins/editor/todo-comments.nix
    ./plugins/editor/copilot-chat.nix
    ./plugins/editor/navic.nix
    ./plugins/editor/claude-code.nix

    # UI plugins
    ./plugins/ui/bufferline.nix
    ./plugins/ui/lualine.nix
    ./plugins/ui/startup.nix

    # LSP and formatting
    ./plugins/lsp/lsp.nix
    ./plugins/lsp/conform.nix
    ./plugins/lsp/fidget.nix

    # Git
    ./plugins/git/lazygit.nix
    ./plugins/git/gitsigns.nix

    # Utils
    ./plugins/utils/telescope.nix
    ./plugins/utils/whichkey.nix
    ./plugins/utils/extra_plugins.nix
    ./plugins/utils/mini.nix
    ./plugins/utils/markdown-preview.nix
    ./plugins/utils/obsidian.nix
    ./plugins/utils/toggleterm.nix
    ./plugins/utils/web-devicons.nix
    ./plugins/utils/spectre.nix
    ./plugins/utils/lz-n.nix
    ./plugins/utils/action-preview.nix
    ./plugins/utils/dressing.nix
    ./plugins/utils/aerial.nix
  ];
  extraConfigLua = ''
    if vim.g.neovide then
        -- 透明度
        vim.g.neovide_opacity = 0.7
        vim.g.neovide_normal_opacity = 0.75
        -- vim.g.neovide_transparency = 0.7
        
        -- 字体
        vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h13"
      
        vim.g.neovide_floating_shadow = true
        vim.g.neovide_floating_z_height = 10
        vim.g.neovide_light_angle_degrees = 45
        vim.g.neovide_light_radius = 5
        vim.g.neovide_floating_blur_amount_x = 2.0
        vim.g.neovide_floating_blur_amount_y = 2.0
        --
        -- -- 光标特效
        -- vim.g.neovide_cursor_vfx_mode = "railgun"
        -- vim.g.neovide_cursor_animation_length = 0.1
        --
        -- -- 缩放快捷键
        -- vim.g.neovide_scale_factor = 1.0
        -- vim.keymap.set("n", "<C-=>", function()
        --     vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
        -- end)
        -- vim.keymap.set("n", "<C-->", function()
        --     vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.1
        -- end)
    end
  '';
}
