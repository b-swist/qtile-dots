from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.backend.wayland import InputConfig

import os
import subprocess

mod = "mod4"

terminal = "alacritty"
browser = "zen-browser"

keys = [
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "space", lazy.layout.next(), desc="move window focus"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="grow window up"),

    Key([mod], "n", lazy.layout.normalize(), desc="reset all window sizes"),
    Key([mod], "q", lazy.window.kill(), desc="kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="toggle fullscreen"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="toggle floating"),

    Key([mod], "r", lazy.spawncmd(), desc="spawn a command using a prompt widget"),
    Key([mod], "Return", lazy.spawn(terminal), desc="launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="launch browser"),
    Key([], "Print", lazy.spawn("hyprshot -m region --clipboard-only"), desc="launch browser"),

    Key([mod], "Tab", lazy.next_layout(), desc="toggle between layouts"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="toggle split and unsplit sides of stack"),

    Key([mod, "control"], "r", lazy.reload_config(), desc="reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="shutdown qtile"),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

for vt in range(1, 8):
    keys.append(
        Key(["control", "mod1"], f"f{vt}", lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"))
    )

groups = [Group(i) for i in "123456789"]

@hook.subscribe.setgroup
def setgroup():
    for i in range(0, 9):
        qtile.groups[i].label = "󰽤"
    qtile.current_group.label = "󰽢"

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
    ])

layouts = [
    layout.Columns(
        margin = 10,
        border_width = 0
    ),

    layout.Plasma(
        margin = 10,
        border_width = 0
    )
]

widget_defaults = dict(
    font="Iosevka Nerd Font",
    fontsize=16,
    background="#1e1e2e",
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper="~/pictures/wallpapers/magenta-cat.png",
        wallpaper_mode="fill",

        bottom=bar.Bar(
            [
                widget.Spacer(length=15),
                widget.GroupBox(
                    spacing=10,
                    highlight_method="text",
                    toggle=False,
                    disable_drag=True,
                    this_current_screen_border="#cba6f7",
                    active="#cdd6f4",
                    inactive="#45475a"
                ),
                widget.Spacer(),
                widget.Prompt(
                    # cursor_color="#cdd6f4",
                    prompt=">> ",
                    record_history=True,
                    ignore_dups_history=True,
                    bell_style=None
                ),
                widget.Spacer(),
                # widget.Volume(),
                widget.Clock(),
                widget.Spacer(length=15),
            ],
            30,
            margin=[10, 20, 10, 20],
        ),
        top=bar.Gap(10),
        right=bar.Gap(10),
        left=bar.Gap(10),
    )
]

# Drag floating layouts.
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = {
        "*": InputConfig(kb_layout="pl", accel_profile="flat", pointer_accel=0)
}

floating_layout = layout.Floating(
    border_width=0,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

@hook.subscribe.startup_once
def autostart():
    script=os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call(script)

wl_xcursor_theme = None
wl_xcursor_size = 24

wmname = "LG3D"
