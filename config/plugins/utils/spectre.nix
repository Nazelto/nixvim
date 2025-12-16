{
  plugins.spectre = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>lua require('spectre').toggle()<cr>";
      options = {
        desc = "search&replace";
      };
    }
  ];
}
