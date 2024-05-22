player = nil
stars = {}
enemies = {}

function _draw()
    cls()
    print(ASCII.BIRDS, 84, 84, COLOR.YLW)

    -- Draw the player
    player:draw()
end

function _update()
    player:update()
end

function _init()
    player = Player.new(SCREEN.WIDTH / 2, SCREEN.HEIGHT - Player.HEIGHT, COLOR.GRN)
end