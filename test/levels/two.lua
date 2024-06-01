LEVEL_TWO = Level.new(
    {
        Action.new(2, function()
            add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "LEVEL TWO", COLOR.RED, SCREEN.FPS * 3))
        end),

        Action.new(5, function()
            Follower.new(64, -16, 50, 8, true)
        end),
    },

    10,
    function()
        add(MENUS, MenuText.new(SCREEN.WIDTH / 4, SCREEN.HEIGHT / 3, "LEVEL TWO COMPLETE", COLOR.RED, SCREEN.FPS * 3))
        -- CHANGE_LVL(1)
    end,
    2
)