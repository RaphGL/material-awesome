local filesystem = require('gears.filesystem')
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'kitty',
    editor = 'code',
    rofi = 'rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi',
    lock = 'i3lock -f -i ~/Pictures/Wallpapers/lockscreen.png',
    quake = 'kitty'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'feh --bg-fill ~/dotfiles/wallpapers/Pictures/Wallpapers/wallpaper5.jpg', -- Set wallpaper
    'picom --config ~/.config/awesome/configuration/picom.conf',
    'lxpolkit',
    'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
    'setxkbmap -option caps:swapescape', -- Swap Caps Lock and Escape
    'flameshot', -- Screenshot utility
    'sh -c ~/dotfiles/.scripts/cmus_daemon.sh',
    "xautolock -time 10 -locker 'i3lock -i ~/Pictures/Wallpapers/lockscreen.png' -killer 'systemctl suspend' -killtime 10",
  }
}
