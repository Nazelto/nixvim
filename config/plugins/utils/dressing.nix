{
  plugins = {
    telescope.enable = true; # 最可靠的选择器

    dressing = {
      enable = true;
      settings = {
        select.backend = [
          "telescope"
          "builtin"
        ];
        input.border = "rounded";
      };
    };

    lsp.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ws";
      action.__raw = ''
        function()
          require('telescope.builtin').lsp_dynamic_workspace_symbols()
        end
      '';
      options.desc = "Workspace Symbols";
    }
  ];
}
