{...}:
{
  programs.waybar = {
    settings = [{
      modules-right = [
        "network"
        "wireplumber"
        "cpu"
        "custom/shutdown"
      ];

      "custom/shutdown" = {
        format = "<span font='Hack Nerd Font' color='#f5e0dc'>⏻</span>";
        on-click = "shutdown now";
        tooltip = false;
      };
    }];
  }
}
