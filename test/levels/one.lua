LEVEL_ONE = Level.new(
    {
        Action.new(2, function()
            add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "LEVEL ONE", COLOR.RED, SCREEN.FPS * 3))
        end),
        
        Action.new(5, function()
            Diver.new(64, -8, 2, 30)
            Diver.new(32, -8, 2, 30)
            Diver.new(96, -8, 2, 30)
        end),

        Action.new(10, function()
            Diver.new(64, -8, 2, 30, true)
        end),

        Action.new(15, function()
            Diver.new(48, -8, 2, 60)
            Diver.new(80, -8, 2, 60)
        end),

        Action.new(17, function()
            Diver.new(32, -8, 2, 30)
            Diver.new(96, -8, 2, 30)
        end),

        Action.new(20, function()
            add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "FINAL WAVE", COLOR.RED, SCREEN.FPS * 3))
        end),

        Action.new(24, function()
            Follower.new(64, -16, 20, 8, true)
            Diver.new(8, -8, 2, 30)
            Diver.new(16, -8, 2, 30)
            Diver.new(80, -8, 2, 30)
            Diver.new(96, -8, 2, 30)
        end),
    },

    37,
    function()
        add(MENUS, MenuText.new(SCREEN.WIDTH / 4, SCREEN.HEIGHT / 3, "LEVEL ONE COMPLETE", COLOR.RED, SCREEN.FPS * 3))
        CHANGE_LVL(2)
    end,
    1
)