player = nil
stars = {}
enemies = {}

function _draw()
    cls()
    print(ASCII.BIRDS, 84, 84, COLOR.YLW)

    -- Draw the player
    player:draw()

    -- Draw the stars
    for _, star in ipairs(stars) do
        star:draw()
    end
end

function _update()
    player:update()

    -- Update the stars
    for _, star in ipairs(stars) do
        if not star.alive then
            del(stars, star) -- costly?
        end
        star:update()
    end
end

function _init()
    player = Player.new(SCREEN.WIDTH / 2, SCREEN.HEIGHT - Player.HEIGHT, COLOR.GRN)

    -- add a stars
    local star1 = Star.new(10, 10, 1, 1, COLOR.WHT)
    local star2 = Star.new(20, 20, 1, 1, COLOR.YLW)
    stars = {star1, star2}
    log('stars: ' .. #stars)
end