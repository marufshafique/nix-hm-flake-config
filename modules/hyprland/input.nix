{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_options = "compose:caps";
      follow_mouse = 1;
      sensitivity = -0.3;
      repeat_delay = 250;
      repeat_rate = 45;

      touchpad = {
        natural_scroll = false;
      };
    };
  };
}
