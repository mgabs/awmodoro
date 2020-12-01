-- A Template setup of Awmodoro
-- this is used to setup the Awmodoro widget.
---[[ -- awmdoro
local awmodoro = require("widgets.awmodoro")
-- pomodoro wibox
pomowibox = awful.wibar({position = "top", screen = 1, height = 4})
pomowibox.visible = true
local pomodoro = awmodoro.new({
    minutes = 25,
    do_notify = true,
    active_bg_color = '#313131',
    paused_bg_color = '#7746D7',
    fg_color = {
        type = "linear",
        from = {0, 0},
        to = {pomowibox.width, 0},
        stops = {{0, "#AECF96"}, {0.5, "#88A175"}, {1, "#FF5656"}}
    },
    width = pomowibox.width,
    height = pomowibox.height,

    begin_callback = function()
        for s in screen do s.mywibox.visible = false end
        pomowibox.visible = true
    end,

    finish_callback = function()
        for s in screen do s.mywibox.visible = true end
        pomowibox.visible = false
    end
})
pomowibox:set_widget(pomodoro)
-- awmdoro keys
globalkeys = gears.table.join(globalkeys, awful.key({modkey}, "i", function()
    pomodoro:toggle()
end), awful.key({modkey, "Shift"}, "i", function() pomodoro:finish() end)) -- ]]

-- ]]

