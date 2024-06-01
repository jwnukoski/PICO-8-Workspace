Player = {}
Player.__index = Player
Player.MAX_HEALTH = 4
Player.SPRITE_IDS = {1, 2, 3}

-- Constructor
function Player.new(x, y)
    local self = setmetatable({}, Player)

    self.x = x
    self.y = y
    self.w = 8
    self.h = 8
    
    self.MOVE_SPEED = 2
    self.BOUNDS_RIGHT = SCREEN.WIDTH - self.w
    self.BOUNDS_BOTTOM = SCREEN.HEIGHT - self.h
    
    self.health = Player.MAX_HEALTH
    self.alive = true
    
    self.col = Collidable.new(self.x, self.y , 5, 4, 1, 2)
    
    self.weapon = 1
    self.shootDelay = 10
    self.shootTimer = 0
    self.spriteIndex = 1

    return self
end

function Player:upgrade()
    self:upgradeWeapon()
    self:heal()
    sfx(3)
end

function Player:heal()
    self.health = Player.MAX_HEALTH
end

function Player:update()
    if not self.alive then
        return
    end

    self:movement()

    self:shooting()

    self:hurtByBullets()
end

function Player:hurtByBullets()
    -- Collision with enemy bullet
    if not self.alive then
        return
    end

    -- collision with enemy bullets
    for i, bullet in pairs(BULLETS) do
        if not bullet.isPlayer then
            self.col:collidesWith(bullet.col, function()
                bullet:kill()
                self:damage()
            end)
        end
    end
end

function Player:shootDelayCount()
    if self.canShoot then
        return
    end

    if self.shootTimer >= self.shootDelay then
        self.shootTimer = 0
        self.canShoot = true
        return
    end

    self.shootTimer = self.shootTimer + 1
end

function Player:shooting()
    self:shootDelayCount()
    
    -- Test upgradeWeapon
    if btnp(INPUT.O) then
        self:upgradeWeapon()
    end
    
    
    if (not btn(INPUT.X)) or (not self.canShoot) then
        -- if not btn(INPUT.X) and not btn(INPUT.O) then
            return
    end

    -- TODO: weapon types
    self:shootWeaponType()
end

function Player:upgradeWeapon()
    -- Upgrade event. Sets delays.

    if self.weapon < 10 then
        self.weapon = self.weapon + 1
        self.shootTimer = 0
        self.canShoot = true
    else
        -- replenish health?
        return
    end

    -- set shootDelays
    if self.weapon == 2 then
        self.shootDelay = 8
    end

    if self.weapon == 3 then
        self.shootDelay = 4
    end

    if self.weapon == 4 then
        self.shootDelay = 10
    end

    if self.weapon == 5 then
        self.shootDelay = 4
    end

    if self.weapon == 6 then
        self.shootDelay = 10
    end

    if self.weapon == 7 then
        self.shootDelay = 7
    end

    if self.weapon == 8 then
        self.shootDelay = 4
    end

    if self.weapon == 9 then
        self.shootDelay = 8
    end

    if self.weapon == 10 then
        self.shootDelay = 4
    end
end

function Player:shootWeaponType()
    -- Spawn bullet patterns
    if self.weapon == 1 then
        -- 1 centered
        add(BULLETS, Bullet.new(self.x, self.y - 4, 0, -2, true))
    end

    if self.weapon == 2 then
        -- 1 centered
        add(BULLETS, Bullet.new(self.x, self.y - 4, 0, -3, true))
    end

    if self.weapon == 3 then
        -- 1 centered
        add(BULLETS, Bullet.new(self.x, self.y - 4, 0, -4, true))
    end

    if self.weapon == 4 then
        -- 2 centered
        add(BULLETS, Bullet.new(self.x - 3, self.y - 4, 0, -2, true))
        add(BULLETS, Bullet.new(self.x + 3, self.y - 4, 0, -2, true))
    end

    if self.weapon == 5 then
        -- 2 centered
        add(BULLETS, Bullet.new(self.x - 3, self.y - 4, 0, -3, true))
        add(BULLETS, Bullet.new(self.x + 3, self.y - 4, 0, -3, true))
    end

    if self.weapon == 6 then
        -- 3 split
        add(BULLETS, Bullet.new(self.x - 3, self.y - 4, -2, -2, true))
        add(BULLETS, Bullet.new(self.x, self.y - 4, 0, -2, true))
        add(BULLETS, Bullet.new(self.x + 3, self.y - 4, 2, -2, true))
    end

    if self.weapon == 7 then
        -- 3 split
        add(BULLETS, Bullet.new(self.x - 3, self.y - 4, -3, -3, true))
        add(BULLETS, Bullet.new(self.x, self.y - 4, 0, -3, true))
        add(BULLETS, Bullet.new(self.x + 3, self.y - 4, 3, -3, true))
    end

    if self.weapon == 8 then
         -- 3 split
         add(BULLETS, Bullet.new(self.x - 3, self.y - 4, -4, -4, true))
        add(BULLETS, Bullet.new(self.x, self.y - 4, 0, -4, true))
        add(BULLETS, Bullet.new(self.x + 3, self.y - 4, 4, -4, true))
    end

    if self.weapon == 9 then
        -- 3 split, 2 centered
        add(BULLETS, Bullet.new(self.x - 6, self.y - 4, -2, -2, true))

        add(BULLETS, Bullet.new(self.x - 3, self.y - 4, 0, -2, true))
        add(BULLETS, Bullet.new(self.x + 3, self.y - 4, 0, -2, true))

        add(BULLETS, Bullet.new(self.x + 6, self.y - 4, 2, -2, true))
    end

    if self.weapon == 10 then
        -- 3 split, 2 centered
        add(BULLETS, Bullet.new(self.x - 6, self.y - 4, -4, -4, true))

        add(BULLETS, Bullet.new(self.x - 3, self.y - 4, 0, -4, true))
        add(BULLETS, Bullet.new(self.x + 3, self.y - 4, 0, -4, true))

        add(BULLETS, Bullet.new(self.x + 6, self.y - 4, 4, -4, true))
    end
    
    sfx(1)

    self.canShoot = false
end

function Player:damage()
    -- Takes 1 health away
    if not self.alive then
        return
    end

    self.health = self.health - 1
    add(EXPLOSIONS, Explosion.new(self.x, self.y, 1, 1))

    if self.health == 0 then
        self:kill()
    end
end

function Player:kill()
    self.alive = false
    self.col:kill()
    sfx(4)

    reset()
end

function Player:reset()
    self.health = Player.MAX_HEALTH
    self.alive = true
    self.x = 60
    self.y = 100
    self.col:setPos(self.x, self.y)
end

function Player:movement()
    -- Main movement function
    local xAmount = 0
    local yAmount = 0

    -- Left
    if btn(INPUT.LT) then
        if self.x > 0 then
            xAmount = -self.MOVE_SPEED
            self.spriteIndex = 2
        end
    -- Right
    elseif btn(INPUT.RT) then
        if self.x < self.BOUNDS_RIGHT then
            xAmount = self.MOVE_SPEED
            self.spriteIndex = 3
        end
    else
        self.spriteIndex = 1
    end

    -- Up
    if btn(INPUT.UP) then
        if self.y > 0 then
            yAmount = -self.MOVE_SPEED
        end
    -- Down
    elseif btn(INPUT.DN) then
        if self.y < self.BOUNDS_BOTTOM then
            yAmount = self.MOVE_SPEED
        end
    end

    if xAmount ~= 0 or yAmount ~= 0 then
        self:move(xAmount, yAmount)
    end
end

function Player:draw()
    -- Method to draw the player
    if not self.alive then
        return
    end

    spr(Player.SPRITE_IDS[self.spriteIndex], self.x, self.y, 1, 1, false, false)
    
    self.col:draw()
end

function Player:move(x, y)
    if not self.alive then
        return
    end

    self.x = self.x + x
    self.y = self.y + y

    self.col:setPos(self.x, self.y)
end