player = nil
stars = {}
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

    -- Draw the enemies
    for _, enemy in ipairs(enemies) do
        enemy:draw()
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
        star:update()
    end

    -- Generate new stars
    if #stars < 5  then
        add(stars, Star.new(rnd(SCREEN.WIDTH), 0, rnd(4), rnd(4), COLOR.WHT))
    end

    -- Generate new enemies for test
    if #enemies < 5  then
        Meteor.new(rnd(SCREEN.WIDTH), -16, 1)
        SmallShip.new(rnd(SCREEN.WIDTH), -16, 5, SCREEN.HEIGHT / rnd(4))
    end

    -- Update the enemies
    for _, enemy in ipairs(enemies) do
        enemy:update()
    end

    -- Update bullets
    for _, bullet in ipairs(bullets) do
        bullet:update()
    end

    -- Update explosions
    for _, explosion in ipairs(explosions) do
        explosion:update()
    end

    -- Update upgrades
    for _, upgrade in ipairs(upgrades) do
        upgrade:update()
    end

    -- Update the menu
    for _, menu in ipairs(menu) do
        menu:update()
    end

    garbarge()

    SCREEN:advanceFrame()
end

function _init()
    player = Player.new(SCREEN.WIDTH / 2, SCREEN.HEIGHT - 8)
    add(menu, MenuHealth.new())
    add(menu, MenuWeapon.new())
    add(menu, MenuTime.new())
end

function garbarge()
    -- Infrequent garbarge collection
    if (SCREEN.frameInFPS ~= 15) and (SCREEN.frameInFPS ~= 30) then
        return
    end

    -- Stars
    for _, star in ipairs(stars) do
        if not star.alive then
            del(stars, star)
        end
    end

    -- enemies
    for _, enemy in ipairs(enemies) do
        if not enemy.alive then
            del(enemies, enemy)
        end
    end

    -- Collisions
    for _, collidable in ipairs(collidables) do
        if not collidable.alive then
            del(collidables, collidable)
        end
    end

    -- Bullets
    for _, bullet in ipairs(bullets) do
        if not bullet.alive then
            del(bullets, bullet)
        end
    end

    -- Explosions
    for _, explosion in ipairs(explosions) do
        if not explosion.alive then
            del(explosions, explosion)
        end
    end

    -- Upgrades
    for _, upgrade in ipairs(upgrades) do
        if not upgrade.alive then
            del(upgrades, upgrade)
        end
    end
end