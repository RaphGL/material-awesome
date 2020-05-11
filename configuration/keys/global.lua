local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')
-- Key bindings
local globalKeys =
  awful.util.table.join(
  -- Hotkeys
  awful.key({modkey}, 'F10', hotkeys_popup.show_help, {description = 'show help', group = 'awesome'}),
  -- Tag browsing
  awful.key({modkey}, 'k', awful.tag.viewprev, {description = 'view previous workspace', group = 'workspaces'}),
  awful.key({modkey}, 'j', awful.tag.viewnext, {description = 'view next workspace', group = 'workspaces'}),
  awful.key({modkey}, 'Escape', awful.tag.history.restore, {description = 'go back', group = 'workspaces'}),
  -- Default client focus
  awful.key(
    {modkey},
    'l',
    function()
      awful.client.focus.byidx(1)
    end,
    {description = 'focus next by index', group = 'client'}
  ),
  awful.key(
    {modkey},
    'h',
    function()
      awful.client.focus.byidx(-1)
    end,
    {description = 'focus previous by index', group = 'client'}
  ),
  awful.key(
    {modkey},
    'r',
    function()
      _G.screen.primary.left_panel:toggle(true)
    end,
    {description = 'show main menu', group = 'awesome'}
  ),
  awful.key({modkey}, 'u', awful.client.urgent.jumpto, {description = 'jump to urgent client', group = 'client'}),
  -- Programs
  awful.key(
    {},
    'Print',
    function()
      awful.util.spawn_with_shell('maim -s | xclip -selection clipboard -t image/png')
    end
  ),
  awful.key(
    {modkey},
    'F1',
    function()
      awful.spawn('nemo')
    end,
    {description = 'open a file manager', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'F2',
    function()
      awful.spawn('firefox')
    end,
    {description = 'open a browser', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'F3',
    function()
      awful.spawn('code')
    end,
    {description = 'open code editor', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'F4',
    function()
      awful.spawn('kitty htop')
    end,
    {description = 'open system monitor', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'F5',
    function()
      awful.spawn('thunderbird')
    end,
    {description = 'open email client', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'c',
    function()
      awful.spawn('kitty calcurse')
    end,
    {description = 'open terminal calendar', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'v',
    function()
      awful.spawn('kitty ranger')
    end,
    {description = 'open terminal file manager', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'n',
    function()
      awful.spawn('kitty nmtui')
    end,
    {description = 'open network manager', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'm',
    function()
      awful.spawn('kitty cmus')
    end,
    {description = 'open music player', group = 'launcher'}
  ),
  awful.key(
    {},
    'Print',
    function()
      awful.spawn('flameshot full -c')
    end,
    {description = 'Take screenshot and copy to clipboard', group = 'awesome'}
  ),
  awful.key(
    {'Shift'},
    'Print',
    function()
      awful.spawn('flameshot gui')
    end,
    {description = 'Take screenshot selecting area', group = 'awesome'}
  ),
  awful.key(
    {modkey, 'Control'},
    'x',
    function()
      awful.spawn('xdotool getwindowfocus windowkill')
    end,
    {description = 'Kill active window process', group = 'awesome'}
  ),
  awful.key(
    {modkey},
    'p',
    function()
      awful.spawn('cmus-remote -u')
    end,
    {description = 'Kill active window process', group = 'hotkeys'}
  ),
  awful.key(
    {modkey},
    ',',
    function()
      awful.spawn('cmus-remote --prev')
    end,
    {description = 'Play previous song', group = 'hotkeys'}
  ),
  awful.key(
    {modkey},
    '.',
    function()
      awful.spawn('cmus-remote --next')
    end,
    {description = 'Play next song', group = 'hotkeys'}
  ),
  awful.key(
    {modkey, 'Control'},
    ',',
    function()
      awful.spawn('cmus-remote -C "seek -2"')
    end,
    {description = 'Rewind song', group = 'hotkeys'}
  ),
  awful.key(
    {modkey, 'Control'},
    '.',
    function()
      awful.spawn('cmus-remote -C "seek +2"')
    end,
    {description = 'Forward song', group = 'hotkeys'}
  ),
  -- Standard program
  awful.key(
    {modkey},
    'Return',
    function()
      awful.spawn(apps.default.terminal)
    end,
    {description = 'open a terminal', group = 'launcher'}
  ),
  awful.key({modkey, 'Control'}, 'r', _G.awesome.restart, {description = 'reload awesome', group = 'awesome'}),
  awful.key({modkey, 'Control'}, '?', _G.awesome.quit, {description = 'quit awesome', group = 'awesome'}),
  awful.key(
    {modkey},
    'o',
    function()
      awful.tag.incmwfact(0.05)
    end,
    {description = 'increase master width factor', group = 'layout'}
  ),
  awful.key(
    {modkey},
    'y',
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = 'decrease master width factor', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'l',
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    {description = 'increase the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'h',
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = 'decrease the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'l',
    function()
      awful.tag.incncol(1, nil, true)
    end,
    {description = 'increase the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'h',
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = 'decrease the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey},
    'Tab',
    function()
      awful.layout.inc(1)
    end,
    {description = 'select next', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'space',
    function()
      awful.layout.inc(-1)
    end,
    {description = 'select previous', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'n',
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        _G.client.focus = c
        c:raise()
      end
    end,
    {description = 'restore minimized', group = 'client'}
  ),
  -- Dropdown application
  awful.key(
    {modkey},
    '`',
    function()
      _G.toggle_quake()
    end,
    {description = 'dropdown terminal', group = 'launcher'}
  ),
  -- Widgets popups
  awful.key(
    {altkey},
    'h',
    function()
      if beautiful.fs then
        beautiful.fs.show(7)
      end
    end,
    {description = 'show filesystem', group = 'widgets'}
  ),
  awful.key(
    {altkey},
    'w',
    function()
      if beautiful.weather then
        beautiful.weather.show(7)
      end
    end,
    {description = 'show weather', group = 'widgets'}
  ),
  -- Brightness
  awful.key(
    {},
    'XF86MonBrightnessUp',
    function()
      awful.spawn('xbacklight -inc 10')
    end,
    {description = '+10%', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86MonBrightnessDown',
    function()
      awful.spawn('xbacklight -dec 10')
    end,
    {description = '-10%', group = 'hotkeys'}
  ),
  -- ALSA volume control
  awful.key(
    {modkey},
    'Up',
    function()
      awful.spawn('amixer -D pulse sset Master 5%+')
    end,
    {description = 'volume up', group = 'hotkeys'}
  ),
  awful.key(
    {modkey},
    'Down',
    function()
      awful.spawn('amixer -D pulse sset Master 5%-')
    end,
    {description = 'volume down', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioMute',
    function()
      awful.spawn('amixer -D pulse set Master 1+ toggle')
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioNext',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerDown',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {modkey, 'Control'},
    '0',
    function()
      _G.exit_screen_show()
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description = 'view tag #', group = 'workspaces'}
    descr_toggle = {description = 'toggle tag #', group = 'workspaces'}
    descr_move = {description = 'move focused client to tag #', group = 'workspaces'}
    descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'workspaces'}
  end
  globalKeys =
    awful.util.table.join(
    globalKeys,
    -- View tag only.
    awful.key(
      {modkey},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      descr_view
    ),
    -- Toggle tag display.
    awful.key(
      {modkey, 'Control'},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      descr_toggle
    ),
    -- Move client to tag.
    awful.key(
      {modkey, 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:move_to_tag(tag)
          end
        end
      end,
      descr_move
    ),
    -- Toggle tag on focused client.
    awful.key(
      {modkey, 'Control', 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:toggle_tag(tag)
          end
        end
      end,
      descr_toggle_focus
    )
  )
end

return globalKeys
