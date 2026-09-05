local mod = "SUPER"

-- Eski çakışan varsayılanlar
hl.unbind(mod .. " + Q")
hl.unbind(mod .. " + C")
hl.unbind(mod .. " + M")
hl.unbind(mod .. " + E")
hl.unbind(mod .. " + R")
hl.unbind(mod .. " + J")

-- Uygulamalar
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("alacritty"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("fuzzel"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("thunar"))

-- Pencere
hl.bind(mod .. " + Q", hl.dsp.window.close())

hl.bind(
    mod .. " + SHIFT + Q",
    hl.dsp.exec_cmd(
        "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
    )
)

hl.bind(
    mod .. " + F",
    hl.dsp.window.fullscreen({
        mode = "fullscreen",
        action = "toggle",
    })
)

hl.bind(
    mod .. " + SHIFT + F",
    hl.dsp.window.float({ action = "toggle" })
)

-- Helix / Vim yönleri: focus
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }))

-- Shift = pencereyi taşı
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- =========================================================
-- HELIX TARZI RESIZE MODE
-- SUPER + R ile gir
-- H/J/K/L ile resize
-- ESC veya Q ile çık
-- =========================================================

hl.bind(
    "SUPER + R",
    hl.dsp.submap("resize")
)

hl.define_submap("resize", function()

    -- yatay
    hl.bind(
        "H",
        hl.dsp.window.resize({
            x = -30,
            y = 0,
            relative = true
        }),
        { repeating = true }
    )

    hl.bind(
        "L",
        hl.dsp.window.resize({
            x = 30,
            y = 0,
            relative = true
        }),
        { repeating = true }
    )

    -- dikey
    hl.bind(
        "J",
        hl.dsp.window.resize({
            x = 0,
            y = 30,
            relative = true
        }),
        { repeating = true }
    )

    hl.bind(
        "K",
        hl.dsp.window.resize({
            x = 0,
            y = -30,
            relative = true
        }),
        { repeating = true }
    )

    -- normal moda dön
    hl.bind(
        "escape",
        hl.dsp.submap("reset")
    )

    hl.bind(
        "Q",
        hl.dsp.submap("reset")
    )
end)

-- =========================================================
-- SCREENSHOT
-- Print -> alan seç -> clipboard'a PNG
-- =========================================================

hl.bind(
    "Print",
    hl.dsp.exec_cmd(
        'grim -g "$(slurp -d)" - | wl-copy --type image/png'
    )
)
