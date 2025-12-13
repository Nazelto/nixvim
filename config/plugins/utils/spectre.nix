{
  plugins.spectre = {
    enable = true;
    keymaps = {
      "<leader>sr" = {
        action = "<cmd>lua require('spectre').toggle()<cr>";
        dese = "search&repalce gui";
      };
    };
  };
}
