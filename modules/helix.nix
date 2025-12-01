{ ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
      editor = {
        true-color = true;
        line-number = "relative";
        mouse = true;
        lsp.display-messages = true;
      };
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
    languages = {
      language = [
        {
          name = "vue";
          auto-format = false;
        }
        {
          name = "rust";
          auto-format = false;
        }
        {
          name = "zig";
          auto-format = true;
        }
      ];
    };
  };
}
