{
  plugins.spectre = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings = {
        cmd = [ "Spectre" ];
        after = ''
          function()
            require('spectre').setup() 
          end
        '';
        keys = [
          {
            __unkeyed-1 = "<leader>sr";
            __unkeyed-2 = "<CMD>Spectre toogle<CR>";
            desc = "search&replace";
          }
        ];
      };
    };
  };
}
