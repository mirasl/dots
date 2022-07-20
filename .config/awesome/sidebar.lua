-- --pcall(require, "luarocks.loader")

-- SIDEBAR --

-- standard imports:
local gears = require("gears") -- Standard awesome library
local awful = require("awful")
require("awful.autofocus") 
local wibox = require("wibox") -- Widget and layout library
local beautiful = require("beautiful") -- Theme handling library
local naughty = require("naughty") -- Notification library
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup") -- Enable hotkeys help widget for VIM and other apps
local current_theme = require("current_theme") -- see "current_theme.lua"

local SCREEN_WIDTH = 1920

local themes = {
    "fruit",
    "fantasy",
    "pico8",
    "whisper",
    "pink",
    "catppuccin",
}

-- set theme based on contents of current_theme.lua (can 
-- "echo __ >> current_theme.lua" via bash script for easy theme control)
local theme = current_theme 
beautiful.init("/home/mira/.config/awesome/themes/"..themes[theme]..".lua")

-- Other imports:
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
--local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

-- themed variables --
local sb_bg = beautiful.sb_bg or beautiful.primary_color or "#000000"
local sb_fg = beautiful.sb_fg or beautiful.fg_normal or "#f59fab"

local sb_width = beautiful.sb_width or 200
local sb_height = beautiful.sb_height or 978
local sb_x = beautiful.sb_x or 20
local sb_y = beautiful.sb_y or 65
local align_position = beautiful.sb_align_position or "left" -- "left" or "right". If right, beautiful.sb_x should be changed to reflect this (defaults are made with left in mind)
local MORTAR = beautiful.sb_mortar or 10
local interval = (sb_height - 9*MORTAR) / 10
local font_u = beautiful.font_u or "CHICKEN Pie " -- universally resizable font, without number

local volume_color_main = beautiful.volume_color_main or "#8334eb"
local volume_color_bg = beautiful.volume_color_bg or "#ba8ff2"
local brightness_color_main = beautiful.brightness_color_main or "#8334eb"
local brightness_color_bg = beautiful.brightness_color_bg or "#ba8ff2"

local background_enabled = beautiful.sb_background_enabled or false
local background_margin = beautiful.sb_background_margin or 10
local background_color = beautiful.sb_background_color or "#333333"
local background_opacity = beautiful.sb_background_opacity or 1

local clock_fg = beautiful.sb_clock_fg or sb_fg
local greeting_fg = beautiful.sb_greeting_fg or sb_fg
local calendar_fg = beautiful.sb_calendar_fg or sb_fg
local quote_fg = beautiful.sb_quote_fg or sb_fg

-- link foregrounds:
local gmail_normal = beautiful.sb_gmail_normal or sb_fg
local onenote_normal = beautiful.sb_onenote_normal or sb_fg
local schoology_normal = beautiful.sb_schoology_normal or sb_fg
local source_normal = beautiful.sb_source_normal or sb_fg
local github_normal = beautiful.sb_github_normal or sb_fg

local gmail_hover = beautiful.sb_gmail_hover or "#389633"
local onenote_hover = beautiful.sb_onenote_hover or "#672b8a"
local schoology_hover = beautiful.sb_schoology_hover or "#005be3"
local source_hover = beautiful.sb_source_hover or "#34deeb"
local github_hover = beautiful.sb_github_hover or "#c2c2c2"

local SB = {}

local name = "Mira"

-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- rounded corners shape (picom does this for me anyways, but
-- just cause why not):
function custom_shape(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, RADIUS)
end

-- helper function to create default horizontal box:
function hbox(y_position)
    local box = wibox({
        visible = true,
        ontop = true,
        screen = screen.primary,
        y = y_position,
        x = sb_x,
        width = sb_width,
        height = interval,
        shape = custom_shape,
        opacity = beautiful.sb_opacity or 1,
        bg = sb_bg,
    })
    return box
end

sidebar = {}

-- WIDGETS -----------------------------------------------

-- {{{ SOLID BACKGROUND IF ENABLED:
if background_enabled then
    background = wibox({
        visible = true,
        ontop = false,
        screen = scrcalendar_widgeteen.primary,
        y = sb_y - background_margin,--calendar_widget
        x = sb_x - background_margin,--calendar_widget
        width = sb_width + 2*background_margin,
        height = sb_height + 2*background_margin,
        shape = custom_shape,
        opacity = background_opacity,
        bg = background_color,
    })
    table.insert(sidebar, background)
end
-- }}}

-- {{{ CLOCK:
clock = wibox.widget.textclock("<span foreground='"..clock_fg.."'>%H:%M:%S</span>", 1)
clock.font = font_u.."35"

clock_box = hbox(sb_y)

clock_box:setup {
    layout = wibox.layout.stack,
    {
        clock,
        align = "center",
        layout = wibox.container.place,
    },
}

table.insert(sidebar, clock_box)
-- }}}

-- {{{ GREETING:
greeting = wibox.widget.textbox("<span foreground='"..greeting_fg.."'>Hello, "..name.."</span>")
greeting.font = font_u.."28"

greeting_box = hbox(sb_y + interval + MORTAR)

greeting_box:setup {
    layout = wibox.layout.stack,
    {
        greeting,
        align = "center",
        layout = wibox.container.place,
    }
}

table.insert(sidebar, greeting_box)
--}}}

-- {{{ CALENDAR:
calendar = wibox.widget.calendar.month(os.date('*t'))
calendar.font = "Ubuntu 10"--font_u.."10"
calendar.start_sunday = true

calendar_box = wibox({
    visible = true,
    ontop = true,
    screen = screen.primary,
    y = sb_y + 2*(MORTAR + interval),
    x = sb_x,
    width = sb_width,
    height = 2*interval + MORTAR,
    shape = custom_shape,
    opacity = beautiful.sb_opacity or 1,
    bg = sb_bg,
    fg = calendar_fg,
})

calendar_box:setup {
    layout = wibox.layout.stack,
    {
        calendar,
        align = "center",
        layout = wibox.container.place,
    }
}

table.insert(sidebar, calendar_box)
-- }}}

-- {{{ BATTERY:
battery_box = wibox({
    visible = true,
    ontop = true,
    screen = screen.primary,
    y = sb_y + 4*(MORTAR + interval),
    x = sb_x + (sb_width + MORTAR) / 2,
    width = (sb_width - MORTAR) / 2,
    height = interval,
    shape = custom_shape,
    opacity = beautiful.sb_opacity or 1,
    bg = sb_bg,
    fg = sb_fg,
})

battery_box:setup {
    layout = wibox.layout.stack,
    {
        batteryarc_widget({
            size = 60,
            show_current_level = true,
            font = font_u.."17",
            arc_thickness = 5,
        }),
        align = "center",
        layout = wibox.container.place,
    }
}

table.insert(sidebar, battery_box)
-- }}}

-- {{{ MINI ASCII: (kinda just needed to fill the box lol)
ascii_box = wibox({
    visible = true,
    ontop = true,
    screen = screen.primary,
    y = sb_y + 5*(MORTAR + interval),
    x = sb_x + (sb_width + MORTAR) / 2,
    width = (sb_width - MORTAR) / 2,
    height = interval,
    shape = custom_shape,
    opacity = beautiful.sb_opacity or 1,
    bg = sb_bg,
    fg = sb_fg,
})

arch_ascii = [[
  /\
 /  \
/_/\_\]]
arch_ascii_textbox = wibox.widget.textbox(arch_ascii)
arch_ascii_textbox.font = "Courier 12"

ascii_box:setup{
    layout = wibox.layout.stack,
    {
        arch_ascii_textbox,
        align = "center",
        layout = wibox.container.place,
    }
}

table.insert(sidebar, ascii_box)
-- }}}

-- {{{ SLIDERS: (volume and brightness)
slider_box = wibox({
    visible = true,
    ontop = true,
    screen = screen.primary,
    y = sb_y + 4*(MORTAR + interval),
    x = sb_x,
    width = (sb_width - MORTAR) / 2,
    height = 2*interval + MORTAR,
    shape = custom_shape,
    opacity = beautiful.sb_opacity or 1,
    bg = sb_bg,
    fg = sb_fg,
})

local h_interval = ((sb_width - MORTAR) / 2) / 5
local v_interval = interval / 5

volume_container = wibox({
    visible = true,
    ontop = true,
    screen = screen.primary,
    y = sb_y + 4*(MORTAR + interval) + v_interval,
    x = sb_x + h_interval,
    width = h_interval,--((sb_width - MORTAR) / 2) / 2,
    height = 7*v_interval, --2*interval + MORTAR,
    shape = custom_shape,
    --opacity = 0
    bg = volume_color_main,
    -- fg = sb_fg,
})

volume_container:setup {
    layout = wibox.layout.rotate,
    direction = "east",
    {
        layout = wibox.container.place, 
        volume_widget{
            widget_type = 'horizontal_bar',
            width = 7*v_interval,
            margins = 0,
            main_color = volume_color_main,
            bg_color = volume_color_bg,
        },
    },
}

brightness_container = wibox({
    visible = true,
    ontop = true,
    screen = screen.primary,
    y = sb_y + 4*(MORTAR + interval) + v_interval,
    x = sb_x + 3*h_interval,
    width = h_interval,--((sb_width - MORTAR) / 2) / 2,
    height = 7*v_interval, --2*interval + MORTAR,
    shape = custom_shape,
    --opacity = 0
    bg = brightness_color_main,
    -- fg = sb_fg,
})

horizontal_bar = require("awesome-wm-widgets.volume-widget.widgets.horizontal-bar-widget")

horizontal_bar_widget = horizontal_bar.get_widget{
    width = 7*v_interval,
    margins = 0,
    main_color = brightness_color_main,
    bg_color = brightness_color_bg,
}

brightness_container:setup {
    layout = wibox.layout.rotate,
    direction = "east",
    {
        layout = wibox.container.place, 
        horizontal_bar_widget,
    },
}

local v = wibox.widget.textbox("V")--"<span foreground='"..fg_normal.."'>V</span>")
v.font = font_u.." 18"

v_container = wibox{
    x=sb_x + h_interval,
    y=sb_y + 4*(interval + MORTAR) + 8.5*v_interval, -- gotta stop those magic numbers
    width=h_interval,
    height=25,
    ontop=true,
    visible=true,
    bg = "#00000000"
}

v_container:setup{
	v,
	layout = wibox.container.place,
}

local b = wibox.widget.textbox("B")--"<span foreground='"..fg_normal.."'>V</span>")
b.font = font_u.." 18"

b_container = wibox{
    x=sb_x + 3*h_interval,
    y=sb_y + 4*(interval + MORTAR) + 8.5*v_interval, -- gotta stop those magic numbers
    width=h_interval,
    height=25,
    ontop=true,
    visible=true,
    bg = "#00000000"
}

b_container:setup{
	b,
	layout = wibox.container.place,
}

table.insert(sidebar, slider_box)
table.insert(sidebar, volume_container)
table.insert(sidebar, brightness_container)
table.insert(sidebar, b_container)
table.insert(sidebar, v_container)
-- }}}

-- {{{ LINKS:
button_box = wibox({
    visible = true,
    ontop = true,
    screen = screen.primary,
    y = sb_y + 6*(MORTAR + interval),
    x = sb_x,
    width = sb_width,
    height = 2*interval + MORTAR,
    shape = custom_shape,
    opacity = beautiful.sb_opacity or 1,
    bg = sb_bg,
    fg = sb_fg,
   -- container.margin = 20,
    margin = 20,
})

local gmail_link = function()
    awful.spawn("xdg-open https://mail.google.com/mail/u/0/#inbox")
end

local schoology_link = function()
    awful.spawn("xdg-open https://districtlms.seattleschools.org/home")
end

local source_link = function()
    awful.spawn("xdg-open https://ps.seattleschools.org/")
end

local onenote_link = function()
    awful.spawn("xdg-open https://seattleschools-my.sharepoint.com/personal/1misantalucia_seattleschools_org/_layouts/15/Doc.aspx?sourcedoc={c7bbd435-9621-44f1-bb07-45841dda3a92}&action=edit&wd=target%28Quick%20Notes.one%7C1af1ef3f-9e4f-46a8-bd86-ebfcbbcad471%2FUntitled%20Page%7C88f833b4-6e84-4d75-a31a-23030fe12fe3%2F%29&wdorigin=NavigationUrl")
end

local github_link = function()
    awful.spawn("xdg-open https://github.com/")
end

function create_button(text, command, fg_normal, fg_hover)
    local button = wibox.widget.textbox("<span foreground='"..fg_normal.."'>"..text.."</span>")--awful.widget.button()
    button.align = "center"
    button.font = font_u.." 17"
    button:buttons(gears.table.join(
        button:buttons(),
        awful.button({}, 1, nil, function ()
            command()
        end)
    ))
    -- Change color on hover
    button:connect_signal("mouse::enter", function ()
        button.markup = "<span foreground='"..fg_hover.."'>"..text.."</span>"
    end)
    button:connect_signal("mouse::leave", function ()
        button.markup = "<span foreground='"..fg_normal.."'>"..text.."</span>"
    end)
    return button
end

onenote = create_button("onenote", onenote_link, onenote_normal, onenote_hover)
gmail = create_button("gmail", gmail_link, gmail_normal, gmail_hover)
schoology = create_button("schoology", schoology_link, schoology_normal, schoology_hover)
source = create_button("source", source_link, source_normal, source_hover)
github = create_button("github", github_link, github_normal, github_hover)

button_box:setup {
    layout = wibox.layout.flex.horizontal,
    {
        nil,
        layout = wibox.layout.fixed.vertical,
    },
    {
        wibox.widget.textbox(" "),
        gmail,
        onenote,
        schoology,
        source,
        github,
        wibox.widget.textbox(" "),
        halign = "center",
        layout = wibox.layout.flex.vertical,
    },
    {
        nil,
        layout = wibox.layout.fixed.vertical,
    },
}

table.insert(sidebar, button_box)
-- }}}

-- {{{ QUOTE:
quote_box = wibox({
    visible = true,
    ontop = true,
    screen = screen.primary,
    y = sb_y + 8*(MORTAR + interval),
    x = sb_x,
    width = sb_width,
    height = 2*interval + MORTAR,
    shape = custom_shape,
    opacity = beautiful.sb_opacity or 1,
    bg = sb_bg,
    fg = quote_fg,
})

-- quote from Omori
quote_text = [[
Y  N  C  I  O  P  B  I
O  O  R  F  N  E  E  N
U  T  A     E  R  L
'     Z  E     S  I  Y
R     Y  V     O  E  O
E        E     N  V  U
         N        E  .
                  S  .
]]
quote = wibox.widget.textbox("<span foreground='"..quote_fg.."'>"..quote_text.."</span>")
quote.font = "Courier 9"

quote_box:setup {
    layout = wibox.layout.stack,
    {
        quote,
        align = "center",
        layout = wibox.container.place,
    }
}

table.insert(sidebar, quote_box)
-- }}}

-- {{{ STRUTS (makes sidebar push other clients):
local strut_width = 0
if align_position == "left" then
    strut_width = sb_width + sb_x - 10
elseif align_position == "right" then
    strut_width = SCREEN_WIDTH - sb_x
end

if background_enabled then
    strut_width = background_margin + strut_width
end

if align_position == "left" then
    clock_box:struts {left = strut_width,} -- change to right to make bar appear at right
else
    clock_box:struts {right = strut_width,}
end
-- }}}

-- {{{ OTHER FUNCTIONS (to be used by rc.lua):

-- Show/hide sidebar (called by rc.lua when hotkey pressed):
function SB.toggle_sidebar()
    for i=1, #sidebar do
        sidebar[i].visible = not sidebar[i].visible
    end
end

-- Increase brightness (called by rc.lua when brightness key pressed):
function SB.brightness_dec(value)
    awful.spawn.easy_async_with_shell("brillo -u 150000 -q -U "..value.." ; brillo -q",
        function(stdout) 
            horizontal_bar_widget:set_volume_level(" "..100 - (100 - tonumber(stdout))*2) 
        end)
end

-- Decrease brightness (called by rc.lua when brightness key pressed):
function SB.brightness_inc(value)
    awful.spawn.easy_async_with_shell("brillo -u 150000 -q -A "..value.." ; brillo -q", 
        function(stdout) 
            horizontal_bar_widget:set_volume_level(" "..100 - (100 - tonumber(stdout))*2) 
        end)
end
-- }}}

-- set brightness bar to current brightness:
awful.spawn.easy_async_with_shell("brillo -q", 
    function(stdout) 
        horizontal_bar_widget:set_volume_level(" "..100 - (100 - tonumber(stdout))*2) 
    end)

return SB
