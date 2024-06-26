function LEVEL_ONE()
    return Level.new(
        {
            Action.new(2, function()
                music(-1, 0, 3)
                music(1, 0, 3)
                add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "LEVEL ONE", COLOR.RED, SCREEN.FPS * 3))
            end),
            
            Action.new(5, function()
                add(ENEMIES, Diver.new(64, -8, 2, 30))
                add(ENEMIES, Diver.new(32, -8, 2, 30))
                add(ENEMIES, Diver.new(96, -8, 2, 30))
            end),

            Action.new(10, function()
                add(ENEMIES, Diver.new(64, -8, 2, 30, true))
            end),

            Action.new(15, function()
                add(ENEMIES, Diver.new(48, -8, 2, 60))
                add(ENEMIES, Diver.new(80, -8, 2, 60))
            end),

            Action.new(17, function()
                add(ENEMIES, Diver.new(32, -8, 2, 30))
                add(ENEMIES, Diver.new(96, -8, 2, 30))
            end),

            Action.new(20, function()
                add(ENEMIES, Follower.new(64, -16, 5, 8, true))
            end),

            Action.new(25, function()
                sfx(7)
                music(-1, 0, 3)
                music(2, 0, 3)
                add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "FINAL WAVE", COLOR.RED, SCREEN.FPS * 3))
            end),

            Action.new(30, function()
                add(ENEMIES, Follower.new(64, -16, 20, 8))
                add(ENEMIES, Diver.new(8, -8, 2, 30))
                add(ENEMIES, Diver.new(16, -8, 2, 30))
                add(ENEMIES, Diver.new(80, -8, 2, 30))
                add(ENEMIES, Diver.new(96, -8, 2, 30))
            end),
            Action.new(33, function()
                add(ENEMIES, Diver.new(32, -8, 2, 30))
                add(ENEMIES, Diver.new(48, -8, 2, 30))
                add(ENEMIES, Diver.new(64, -8, 2, 30))
            end),
        },

        40,
        function()
            add(MENUS, MenuText.new(SCREEN.WIDTH / 4, SCREEN.HEIGHT / 3, "LEVEL ONE COMPLETE", COLOR.RED, SCREEN.FPS * 3))
            CHANGE_LVL(2)
            sfx(11)
        end,
        1
    )
end