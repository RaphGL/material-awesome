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
    'picom --config' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
    'lxpolkit',
    'setxkbmap -option caps:swapescape',
    'flameshot',
    'dunst',
    'sh -c ~/dotfiles/.scripts/cmus_daemon.sh',
    'feh --bg-fill ~/dotfiles/wallpapers/Pictures/Wallpapers/wallpaper5.jpg',
    "xautolock -time 10 -locker 'i3lock -i ~/Pictures/Wallpapers/lockscreen.png' -killer 'systemctl suspend' -killtime 10",
  }
}
