------------------
---- MONITORS ----
------------------
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "0x0",
    scale    = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------
local terminal    = "kitty"
local fileManager = "nautilus"
local vscode      = "code"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    -- Config tools system
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("matugen")
    
    -- Apps
    hl.exec_cmd("firefox")
    
    -- Config system
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'")
    
    -- Brain Shell Autostarts
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hypridle -c $HOME/.local/src/Brain_Shell/src/config/hypridle.conf")
    hl.exec_cmd("quickshell -c $HOME/.local/src/Brain_Shell/.")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XDG_DATA_DIRS", "$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Adwaita:dark")

-----------------------
----- PERMISSIONS -----
-----------------------
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 8,
        border_size = 1,
        
        col = {
            active_border   = { colors = {"rgba(00000000)"}},
            inactive_border = "rgb(1e1e2e)",
        },
        
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    
    decoration = {
        rounding       = 8,
        rounding_power = 2,
        
        active_opacity   = 1.0,
        inactive_opacity = 0.85,
        
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
        
        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },
    
    animations = {
        enabled = true,
    },
    
    dwindle = {
        preserve_split = true,
    },
    
    master = {
        new_status = "master",
    },
    
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
    
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        
        follow_mouse = 1,
        sensitivity = 0,
        
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Curves e Animations
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

---------------------
---- GESTURES -------
---------------------
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Device-specific config
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

-- Comandos básicos
hl.bind(mainMod .. " + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Apps
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(vscode))

-- Hypr control
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))

-- Navegação com setas
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

--! Special workspace (scratchpad)
local dsp = hl.dsp

--* Magic workspace
hl.bind(mainMod .. " + Tab", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.window.move({ workspace = "special:magic" }))

--* Music workspace
hl.bind("SUPER + TAB + 1", dsp.workspace.toggle_special("music"))
hl.windowrule("workspace special:music", "^(Spotify)$")
hl.window_rule({
    name = "cava-to-music",
    match = { title = "^Cava Visualizer$" },
    workspace = "special:music"
})

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

--! =============================================================================
--! BRAIN SHELL KEYBINDS
--! =============================================================================

--* Dashboards
hl.bind("SUPER + Q", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call dashboard-home toggle"))
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call dashboard-stats toggle"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call dashboard-kanban toggle"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call dashboard-launcher toggle"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call dashboard-config toggle"))

--* Popups
hl.bind("SUPER + H", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call PowerMenu-toggle toggle"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call notification-toggle toggle"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call wallpaper-toggle toggle"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call clipboard-toggle toggle"))

--* Rede e Conexões
hl.bind("SUPER + ALT + W", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call wifi-toggle toggle"))
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call bluetooth-toggle toggle"))
hl.bind("SUPER + ALT + G", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call vpn-toggle toggle"))
hl.bind("SUPER + ALT + H", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call hotspot-toggle toggle"))

--* Áudio
hl.bind("SUPER + A", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call audioOut-toggle toggle"))
hl.bind("SUPER + ALT + I", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call audioIn-toggle toggle"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call audioMix-toggle toggle"))

--* Quick Settings
hl.bind("SUPER + F11", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call focus-toggle toggle"))
hl.bind("ALT + F9", hl.dsp.exec_cmd("qs ipc -c /home/dvcdaniel/.local/src/Brain_Shell call screenrec-on toggle"))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- Brain_ShellKeybinds
-- dofile("/home/dvcdaniel/.config/Brain_Shell/Brain_ShellKeybinds.lua")