{ pkgs, ... }:
{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      go = [ "golangcilint" ];
    };
    autoCmd = {
      event = [
        "BufWritePost"
        "BufReadPost"
        "InsertLeave"
      ];
      callback.__raw = ''
        function()
          require("lint").try_lint()
        end
      '';
    };
  };
}
