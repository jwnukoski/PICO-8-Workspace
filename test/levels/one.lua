LEVEL_ONE = Level.new(
    {
        Action.new(2, function()
            add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "LEVEL ONE", COLOR.ORG, SCREEN.FPS * 3))
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
            Follower.new(64, -16, 5, 8, true)
        end),

        Action.new(25, function()
            add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "FINAL WAVE", COLOR.ORG, SCREEN.FPS * 3))
        end),

        Action.new(30, function()
            Follower.new(64, -16, 20, 8)
            Diver.new(8, -8, 2, 30)
            Diver.new(16, -8, 2, 30)
            Diver.new(80, -8, 2, 30)
            Diver.new(96, -8, 2, 30)
        end),

        Action.new(33, function()
            Diver.new(32, -8, 2, 30)
            Diver.new(48, -8, 2, 30)
            Diver.new(64, -8, 2, 30)
        end),
    },

    40,
    function()
        add(MENUS, MenuText.new(SCREEN.WIDTH / 4, SCREEN.HEIGHT / 3, "LEVEL ONE COMPLETE", COLOR.ORG, SCREEN.FPS * 3))
        CHANGE_LVL(2)
    end,
    1
)