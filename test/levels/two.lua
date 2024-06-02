function LEVEL_TWO()
    return Level.new(
        {
            Action.new(2, function()
                add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "LEVEL TWO", COLOR.RED, SCREEN.FPS * 3))
            end),

            Action.new(5, function()
                Meteor.new(38, -8, 1, 1)
                Meteor.new(70, -8, 1, 1)
                Meteor.new(102, -8, 1, 1)

                Diver.new(32, -8, 2, 30)
                Diver.new(64, -8, 2, 30, true)
                Diver.new(96, -8, 2, 30)
            end),

            Action.new(7, function()
                Meteor.new(6, -8, 1, 1)
                Meteor.new(70, -40, 1, 1)

                Meteor.new(38, -32, 3, 2, true)
                Meteor.new(102, -16, 3, 1, true)
            end),

            Action.new(10, function()
                Follower.new(64, -16, 20, 8, true)
            end),

            Action.new(15, function()
                add(MENUS, MenuText.new(SCREEN.WIDTH / 4 + 16, SCREEN.HEIGHT / 3, "FINAL WAVE", COLOR.RED, SCREEN.FPS * 3))
            end),

            Action.new(20, function()
                Follower.new(64, -16, 80, 0, true)
                Spinner.new(64, -16, 60, SCREEN.HEIGHT / 3, -1, true)
            end),

            Action.new(30, function()
                Diver.new(32, -8, 2, 30, true)
                Diver.new(96, -8, 2, 30, true)
            end),
        },
        35,
        function()
            END_GAME()
        end,
        2
    )
end