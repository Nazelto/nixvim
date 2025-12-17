_: {
  plugins.claude-code = {
    enable = true;
    settings = {
      window = {
        position = "float";
        float = {
          width = "80%";
          height = "80%";
          row = "center";
          col = "center";
          relative = "editor";
          border = "rounded";
        };
      };
      keymaps = {
        toogle = {
          normal = "<C-,>";
          terminal = "<C-,>";
          variants = {
            continue = "<leader>cC";
            verbose = "<leader>cV";
          };
          window_navigation = true; # Enable window navigation keymaps (<C-h/j/k/l>)
          scrolling = true; # Enable scrolling keymaps (<C-f/b>) for page up/down
        };
      };
    };
  };
}
