LEVEL_ONE = Level.new(
    {
        Action.new(5, function()
            log("ACTION!")
            add(ENEMIES, Diver.new(SCREEN.WIDTH / 2, -8, 1, SCREEN.HEIGHT / 2))
        end),
    },
    200,
    1
)