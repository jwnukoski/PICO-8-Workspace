PLAYER = nil
BKG_DTLS = {}
ENEMIES = {}
COLLIDABLES = {}
EXPLOSIONS = {}
BULLETS = {}
MENUS = {}
UPGRADES = {}
SCORE = 0
CUR_LVL = 1
LVLS = {}

function _draw()
    if LVLS[CUR_LVL] ~= nil then
        cls(LVLS[CUR_LVL]:getClsColor())
    else
        cls(COLOR.BLK)
    end

    for _, bkgDtl in ipairs(BKG_DTLS) do
        bkgDtl:draw()
    end

    for _, enemy in ipairs(ENEMIES) do
        enemy:draw()
    end

    PLAYER:draw()

    -- Debug only
    for _, collidable in ipairs(COLLIDABLES) do
        if collidable.visible and collidable.alive then
            collidable:draw()
        end
    end

    for _, bullet in ipairs(BULLETS) do
        bullet:draw()
    end

    for _, explosion in ipairs(EXPLOSIONS) do
        explosion:draw()
    end

    for _, upgrade in ipairs(UPGRADES) do
        upgrade:draw()
    end

    -- Bottom bkg
    rectfill(0, SCREEN.HEIGHT, SCREEN.WIDTH, SCREEN.HEIGHT + 8, COLOR.BLK)
    for _, menu in ipairs(MENUS) do
        menu:draw()
    end
end

function _update()
    if LVLS[CUR_LVL] ~= nil then
        LVLS[CUR_LVL]:update()
    end

    PLAYER:update()
    if not PLAYER.alive then
        goto menus_update
        return
    end

    -- Generate level background
    if #BKG_DTLS < 30 then
        LVLS[CUR_LVL]:bkgDecorFactory()
    end

    for _, bkgDtl in ipairs(BKG_DTLS) do
        bkgDtl:update()
    end

    for _, enemy in ipairs(ENEMIES) do
        enemy:update()
    end

    for _, bullet in ipairs(BULLETS) do
        bullet:update()
    end

    for _, explosion in ipairs(EXPLOSIONS) do
        explosion:update()
    end

    for _, upgrade in ipairs(UPGRADES) do
        upgrade:update()
    end

    ::menus_update::
    for _, menu in ipairs(MENUS) do
        menu:update()
    end

    garbage()

    SCREEN:advanceFrame()
end

function _init()
    RESET()
end

function RESET(completed)
    local completed = completed or false

    LVLS = {
        LEVEL_ONE(),
        LEVEL_TWO()
    }
    MENUS = {}
    UPGRADES = {}
    BKG_DTLS = {}
    COLLIDABLES = {}
    EXPLOSIONS = {}
    ENEMIES = {}
    BULLETS = {}

    if completed then
        MenuGameCompleted.new()
        return
    end

    SCORE = 0
    PLAYER = Player.new(SCREEN.WIDTH / 2, SCREEN.HEIGHT - 8)
    MenuHealth.new()
    MenuWeapon.new()
    MenuScore.new()
    CHANGE_LVL(1)
end

function GAME_OVER()
    PLAYER = nil
    BKG_DTLS = {}
    ENEMIES = {}
    COLLIDABLES = {}
    EXPLOSIONS = {}
    BULLETS = {}
    MENUS = {}
    UPGRADES = {}
end

function END_GAME()
    PLAYER:kill()
    MenuGameCompleted.new()
end

function CHANGE_LVL(lvl)
    CUR_LVL = lvl

    ENEMIES = {}
    COLLIDABLES = {}
    EXPLOSIONS = {}
    BULLETS = {}

    LVLS[CUR_LVL]:setup()
end

function garbage()
    -- Infrequent collection
    if (SCREEN.frameInFPS ~= 15) and (SCREEN.frameInFPS ~= 30) then
        return
    end

    for _, bkgDtl in ipairs(BKG_DTLS) do
        if not bkgDtl.alive then
            del(BKG_DTLS, bkgDtl)
        end
    end

    for _, enemy in ipairs(ENEMIES) do
        if not enemy.alive then
            del(ENEMIES, enemy)
        end
    end

    for _, collidable in ipairs(COLLIDABLES) do
        if not collidable.alive then
            del(COLLIDABLES, collidable)
        end
    end

    for _, bullet in ipairs(BULLETS) do
        if not bullet.alive then
            del(BULLETS, bullet)
        end
    end

    for _, explosion in ipairs(EXPLOSIONS) do
        if not explosion.alive then
            del(EXPLOSIONS, explosion)
        end
    end

    for _, upgrade in ipairs(UPGRADES) do
        if not upgrade.alive then
            del(UPGRADES, upgrade)
        end
    end

    for _, menu in ipairs(MENUS) do
        if not menu.alive then
            del(MENUS, menu)
        end
    end
end