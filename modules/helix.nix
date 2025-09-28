{ ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_transparent";
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
