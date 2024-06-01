LEVEL_THREE = Level.new(
    {
        Action.new(5, function()
            add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "LEVEL THREE", COLOR.RED, SCREEN.FPS * 3))
        end),

        Action.new(5, function()
            Diver.new(32, -8, 2, 30)
            Diver.new(64, -8, 2, 30, true)
            Diver.new(96, -8, 2, 30)
        end),

        Action.new(10, function()
            Follower.new(64, -16, 20, 8, true)
        end),

        Action.new(15, function()
            add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "FINAL WAVE", COLOR.RED, SCREEN.FPS * 3))
        end),

        Action.new(20, function()
            Follower.new(64, -16, 80, 0, true)
            Spinner.new(64, -16, 80, SCREEN.HEIGHT / 2, -1, true)
        end),

        Action.new(30, function()
            Diver.new(32, -8, 2, 30, true)
            Diver.new(96, -8, 2, 30, true)
        end),
    },

    35,
    function()
        add(MENUS, MenuText.new(SCREEN.WIDTH / 4, SCREEN.HEIGHT / 3, "GAME COMPLETE", COLOR.GREEN, SCREEN.FPS * 10))
        
    end,
    2
)