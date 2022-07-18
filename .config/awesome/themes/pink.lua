-- PINK THEME --

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local icon_path = os.getenv("HOME") .. "/.config/awesome/assets/icons/"

local theme = {}

-- OVERALL IMPORTANT STUFF --
theme.font            = "Simplifica 17"
theme.font_u          = "Simplifica "
theme.primary_color   = "#000000"--"#c93443"
theme.secondary_color = "#000000"
theme.wallpaper_path = "/home/mira/.config/awesome/assets/wallpapers/pink.jpg"

-- BG
theme.bg_normal     = "#222222"
theme.bg_focus      = theme.secondary_color
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

-- FG
theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

-- TASKBAR
theme.taskbar_width = 1840 --500
theme.taskbar_height = 35
theme.taskbar_x = 40 -- 700
theme.taskbar_y = 12

-- TASKLIST
theme.tasklist_disable_icon = true
theme.tasklist_font = theme.font
theme.tasklist_align = "center"
theme.tasklist_fg_focus = theme.fg_normal

-- WINDOWS
theme.useless_gap   = dpi(18)
theme.border_width  = dpi(0)
theme.titlebar_size = dpi(0)
theme.border_normal = theme.primary_color
theme.border_focus  = theme.secondary_color
theme.border_marked = "#91231c"

theme.titlebar_bg = theme.primary_color
theme.titlebar_bg_focus = theme.secondary_color

-- SIDEBAR --
theme.sb_fg = "#f59fab"
theme.sb_bg = "#000000"
theme.sb_opacity = 1



-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
theme.notification_bg = theme.primary_color
--theme.notification_fg = theme.secondary_color

-- Variables set for theming the menu:
theme.menu_bg_normal = theme.primary_color
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width  = dpi(150)

-- TAGS ===================================================================================
theme.tags = { 
    "   MAIN   ",
    "   BROWSER   ",
    "   MUSIC   ", 
    "   I   ", 
    "   I I   ", 
    "   I I I   ",
    "   I V  ",
    "   V   ",
    "   V I   ",
}

theme.workspace_colors = {
     "#db6975",
     "#db6975",
     "#db6975",
     "#db6975",
     "#db6975",
     "#db6975",
     "#db6975",
     "#db6975",
     "#db6975",
} 

-- IMAGES =========================================================================================

-- Define the image to load
theme.titlebar_close_button_normal = icon_path.."close_button.png"
theme.titlebar_close_button_focus  = icon_path.."close_focused.png"

theme.titlebar_minimize_button_normal = icon_path.."minimize_normal.png" -- not active by default
theme.titlebar_minimize_button_focus  = icon_path.."minimize_focus.png" -- not active by default

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = icon_path.."sticky_tilted_focus.png" -- accidentally swapped the file names, fix todo
theme.titlebar_sticky_button_focus_inactive  = icon_path.."sticky_tilted.png"
theme.titlebar_sticky_button_normal_active = icon_path.."sticky_focus.png"
theme.titlebar_sticky_button_focus_active  = icon_path.."sticky_straight.png"

theme.titlebar_floating_button_normal_inactive = icon_path.."tiled_normal.png"
theme.titlebar_floating_button_focus_inactive  = icon_path.."tiled_focus.png"
theme.titlebar_floating_button_normal_active = icon_path.."float_normal.png"
theme.titlebar_floating_button_focus_active  = icon_path.."float_focus.png"

theme.titlebar_maximized_button_normal_inactive = icon_path.."maximize_normal.png"
theme.titlebar_maximized_button_focus_inactive  = icon_path.."maximize_focus.png"
theme.titlebar_maximized_button_normal_active = icon_path.."minimize_normal.png"
theme.titlebar_maximized_button_focus_active  = icon_path.."minimize_focus.png"

theme.wallpaper = themes_path.."/usr/share/backgrounds/pink.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"



-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
