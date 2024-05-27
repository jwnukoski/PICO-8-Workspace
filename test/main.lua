player = nil
stars = {}
meteors = {}
enemies = {}
collidables = {}
explosions = {}
bullets = {}
menu = {}
upgrades = {}

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

    -- Draw the player
    player:draw()

    -- Debug only
    for _, collidable in ipairs(collidables) do
        if collidable.visible and collidable.alive then
            collidable:draw()
        end
    end

    -- Draw the bullets
    for _, bullet in ipairs(bullets) do
        bullet:draw()
    end

    -- Draw explosions
    for _, explosion in ipairs(explosions) do
        explosion:draw()
    end

    -- Draw upgrades
    for _, upgrade in ipairs(upgrades) do
        upgrade:draw()
    end

    -- Draw the menu
    rectfill(0, SCREEN.HEIGHT, SCREEN.WIDTH, SCREEN.HEIGHT + 8, COLOR.BLK) -- keep here? just background for menu
    for _, menu in ipairs(menu) do
        menu:draw()
    end
end

function _update()
    player:update()

    if not player.alive then
        return
    end

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
        add(meteors, Meteor.new(rnd(SCREEN.WIDTH), -16))
    end

    -- Generate new upgrades
    if #upgrades < 1  then
        add(upgrades, Upgrade.new(rnd(SCREEN.WIDTH), -16))
    end

    -- Update collisions
    for _, collidable in ipairs(collidables) do
        if not collidable.alive then
            del(collidables, collidable)
            -- continue loop
            goto continue
        end

        collidable:update()

        ::continue::
    end

    -- Update bullets
    for _, bullet in ipairs(bullets) do
        if not bullet.alive then
            del(bullets, bullet)
            goto continue
        end

        bullet:update()

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

    -- Update upgrades
    for _, upgrade in ipairs(upgrades) do
        if not upgrade.alive then
            del(upgrades, upgrade)
            goto continue
        end

        upgrade:update()

        ::continue::
    end

    -- Update the menu
    for _, menu in ipairs(menu) do
        menu:update()
    end

    SCREEN:advanceFrame()
end

function _init()
    player = Player.new(SCREEN.WIDTH / 2, SCREEN.HEIGHT - 8)
    add(menu, MenuHealth.new())
    add(menu, MenuWeapon.new())
    add(menu, MenuTime.new())
end