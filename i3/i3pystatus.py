# -*- coding: utf-8 -*-
#
import subprocess
import os
import os.path

from i3pystatus import Status
# from i3pystatus.updates import pacman, cower

status = Status()

###################################
# color
###################################

# Base16 Eighties
base00 = "#2d2d2d"
base01 = "#393939"
base02 = "#515151"
base03 = "#747369"
base04 = "#a09f93"
base05 = "#d3d0c8"
base06 = "#e8e6df"
base07 = "#f2f0ec"
base08 = "#f2777a"
base09 = "#f99157"
base0A = "#ffcc66"
base0B = "#99cc99"
base0C = "#66cccc"
base0D = "#6699cc"
base0E = "#cc99cc"
base0F = "#d27b53"

###################################
# modules
###################################

# clocks
status.register("clock",
                format=" %H:%M:%S",
                color=base0B,
                interval=1,
                on_leftclick="/usr/bin/gsimplecal",)

status.register("clock",
                format=" %a %y%m%d",
                color=base0B,
                interval=1,)

# weather
from i3pystatus.weather import weathercom
status.register(
    'weather',
    format='{condition} {current_temp}{temp_unit}[ {icon}] [ Hi: {high_temp}][ Lo: {low_temp}][  {uv_index}]',
    interval=300,
    color=base0D,
    # colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='60637:4:US',
        units='metric',
    ),
)

# weather undergound but no UV
# if ("WUNDERGROUND_API" in os.environ):
#     from i3pystatus.weather import wunderground
#     status.register(
#         'weather',
#         format='{condition} {current_temp}{temp_unit}[ {icon}] [ Hi: {high_temp}][ Lo: {low_temp}][ : {uv_index}]',
#         interval=1800,
#         color=base0D,
#         # colorize=True,
#         hints={'markup': 'pango'},
#         backend=wunderground.Wunderground(
#             api_key=os.environ["WUNDERGROUND_API"],
#             location_code='pws:KILCHICA291',
#             units='metric',
#             forecast=True,
#         ),
#     )
# else:
#     from i3pystatus.weather import weathercom
#     status.register(
#         'weather',
#         format='{condition} {current_temp}{temp_unit}[ {icon}] [ Hi: {high_temp}][ Lo: {low_temp}][ : {uv_index}]',
#         interval=300,
#         color=base0D,
#         # colorize=True,
#         hints={'markup': 'pango'},
#         backend=weathercom.Weathercom(
#             location_code='60637:4:US',
#             units='metric',
#         ),
#     )

# status.register("updates",
#                 format="Updates: {count}",
#                 format_no_updates="",
#                 on_leftclick="urxvt --hold -e 'pacaur --needed --noconfirm --noedit -Syu'",
#                 backends=[pacman.Pacman(), cower.Cower()])

# audio
status.register("pulseaudio",
                color_unmuted=base04,
                color_muted=base08,
                format_muted=' [muted]',
                format=" {volume}%")

# network
status.register("network",
                interface="enp0s3",
                color_up=base04,
                color_down=base08,
                format_up=" {v4cidr}",
                format_down="",)

# status.register("network",
#                 interface="wlo1",
#                 color_up="#8AE234",
#                 color_down="#EF2929",
#                 format_up="  {essid}  {kbs} kbs",
#                 format_down="",)

# status.register("backlight",
#                 interval=5,
#                 format=" {percentage:.0f}%",
#                 backlight="intel_backlight",)

# status.register("battery",
#                 battery_ident="BAT0",
#                 interval=5,
#                 format="{status} {percentage:.0f}%",
#                 alert=True,
#                 alert_percentage=15,
#                 color="#FFFFFF",
#                 critical_color="#FF1919",
#                 charging_color="#E5E500",
#                 full_color="#D19A66",
#                 status={
#                     "DIS": " ",
#                     "CHR": "  ",
#                     "FULL": "   ",
#                 },)

# status.register("temp",
#                 color='#78EAF2',
#                 )

status.register("cpu_usage",
                on_leftclick="urxvt -e 'htop'",
                color=base04,
                format=" {usage}%",)

status.register("mem",
                color=base04,
                warn_color=base0A,
                alert_color=base08,
                format=" {avail_mem}/{total_mem} GB",
                divisor=1073741824,)

status.register("disk",
                color=base04,
                path="/home",
                on_leftclick="thunar",
                format=" {avail} GB",)

# status.register("text",
#                 text="|",
#                 color="#222222")

# status.register("disk",
#                 hints={"separator": False, "separator_block_width": 3},
#                 color=base04,
#                 path="/home",
#                 format=" {avail} GB",)

# status.register('ping',
#    format_disabled='',
#    color='#61AEEE')

status.register("mpd",
                host='localhost',
                port='6600',
                format="{status}",
                on_leftclick="switch_playpause",
                on_rightclick=["mpd_command", "stop"],
                on_middleclick=["mpd_command", "shuffle"],
                on_upscroll=["mpd_command", "next_song"],
                on_downscroll=["mpd_command", "previous_song"],
                status={
                    "pause": " ",
                    "play": " ",
                    "stop": " ",
                },)

status.register("keyboard_locks",
                format='{caps} {num}',
                caps_on='Caps Lock',
                caps_off='',
                num_on='Num On',
                num_off='',
                color=base08,
                )

status.run()
