player = nil
stars = {}
meteors = {}
enemies = {}
collidables = {}
explosions = {}

function _draw()
    cls()

    -- Draw the stars
    for _, star in ipairs(stars) do
        star:draw()
    end
    
    -- Draw the meteors
    for _, meteor in ipairs(meteors) do
        meteor:draw()
    end
    
    -- Draw explosions
    for _, explosion in ipairs(explosions) do
        explosion:draw()
    end

    -- Draw the player
    player:draw()

    -- Debug only
    for _, collidable in ipairs(collidables) do
        collidable:draw()
    end
end

function _update()
    player:update()

    -- Update the stars
    for _, star in ipairs(stars) do
        if not star.alive then
            del(stars, star) -- costly?
            goto continue
        end

        star:update()

        ::continue::
    end

    -- Update the meteors
    for _, meteor in ipairs(meteors) do
        if not meteor.alive then
            del(meteors, meteor)
            goto continue
        end

        meteor:update()

        ::continue::
    end

    -- Generate new stars
    if #stars < 5  then
        add(stars, Star.new(rnd(SCREEN.WIDTH), 0, rnd(4), rnd(4), COLOR.WHT))
    end

    -- Generate new meteors
    if #meteors < 1  then
        add(meteors, Meteor.new(rnd(SCREEN.WIDTH), 0))
    end

    -- Check collisions
    for _, collidable in ipairs(collidables) do
        if not collidable.alive then
            del(collidables, collidable)
            -- continue loop
            goto continue
        end

        ::continue::
    end

    -- Update explosions
    for _, explosion in ipairs(explosions) do
        if not explosion.alive then
            del(explosions, explosion)
            goto continue
        end

        explosion:update()

        ::continue::
    end

    if (SCREEN.frameInFPS == 0) then
        add(explosions, Explosion.new(rnd(SCREEN.WIDTH), rnd(SCREEN.HEIGHT), 1, 1))
    end

    SCREEN:advanceFrame()
end

function _init()
    player = Player.new(SCREEN.WIDTH / 2, SCREEN.HEIGHT - Player.HEIGHT, COLOR.GRN)
end