Player = {}
Player.__index = Player

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
    
    self.health = 4
    self.alive = true
    
    self.colSize = 1
    self.colPad = 3
    self.col = Collidable.new(self.x + self.colPad, self.y + self.colPad, self.colSize, self.colSize, false)
    
    self.weapon = 1
    self.shootDelay = 10
    self.shootTimer = 0

    return self
end

function Player:update()
    self:movement()
    
    self:shooting()

    self.col:setPos(self.x + self.colPad, self.y + self.colPad)
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
        
    log("shoot delay: " .. self.shootDelay)
    -- TODO: weapon types
    self:shootWeaponType()
end

function Player:upgradeWeapon()
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
        self.shootDelay = 8
    end

    if self.weapon == 6 then
        self.shootDelay = 4
    end

    if self.weapon == 7 then
        self.shootDelay = 15
    end

    if self.weapon == 8 then
        self.shootDelay = 10
    end

    if self.weapon == 9 then
        self.shootDelay = 8
    end

    if self.weapon == 10 then
        self.shootDelay = 4
    end
end

function Player:shootWeaponType()
    -- Bullet patterns... reuse for enemies?
    if self.weapon == 1 then
        add(bullets, Bullet.new(self.x + 3, self.y, 0, -2, true))
    end

    if self.weapon == 2 then
        add(bullets, Bullet.new(self.x + 3, self.y, 0, -3, true))
    end

    if self.weapon == 3 then
        add(bullets, Bullet.new(self.x + 3, self.y, 0, -4, true))
    end

    if self.weapon == 4 then
        add(bullets, Bullet.new(self.x + 6, self.y, 0, -2, true))
        add(bullets, Bullet.new(self.x, self.y, 0, -2, true))
    end

    if self.weapon == 5 then
        add(bullets, Bullet.new(self.x + 6, self.y, 0, -3, true))
        add(bullets, Bullet.new(self.x, self.y, 0, -3, true))
    end

    if self.weapon == 6 then
        add(bullets, Bullet.new(self.x + 6, self.y, 0, -4, true))
        add(bullets, Bullet.new(self.x, self.y, 0, -4, true))
    end

    if self.weapon == 7 then
        add(bullets, Bullet.new(self.x + 3, self.y - 8, 0, -2, true))
        add(bullets, Bullet.new(self.x + 3, self.y - 8, -2, -2, true))
        add(bullets, Bullet.new(self.x + 3, self.y - 8, 2, -2, true))
    end
    
    sfx(1)

    self.canShoot = false
end

function Player:explode()
    add(explosions, Explosion.new(self.x, self.y, 1, 1))
end

function Player:damage()
    if not self.alive then
        return
    end

    self.health = self.health - 1
    self:explode()

    if self.health == 0 then
        self.alive = false
    end
end

function Player:movement()
    local xAmount = 0
    local yAmount = 0

    -- Left
    if btn(INPUT.LT) then
        if self.x > 0 then
            xAmount = -self.MOVE_SPEED
        end
    -- Right
    elseif btn(INPUT.RT) then
        if self.x < self.BOUNDS_RIGHT then
            xAmount = self.MOVE_SPEED
        end
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

-- Method to draw the player
function Player:draw()
    if not self.alive then
        return
    end

    spr(1, self.x, self.y, 1, 1, false, false)
    
    self.col:draw()
end

function Player:move(x, y)
    if not self.alive then
        return
    end

    self.x = self.x + x
    self.y = self.y + y
end