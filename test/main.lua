player = nil
stars = {}
enemies = {}

function _draw()
    cls()

    -- Draw the stars
    for _, star in ipairs(stars) do
        star:draw()
    end
    
    -- Draw the player
    player:draw()
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

    -- Generate new stars
    if #stars < 5  then
        add(stars, Star.new(rnd(SCREEN.WIDTH), 0, rnd(4), rnd(4), COLOR.WHT))
    end

    SCREEN:advanceFrame()
end

function _init()
    player = Player.new(SCREEN.WIDTH / 2, SCREEN.HEIGHT - Player.HEIGHT, COLOR.GRN)

end