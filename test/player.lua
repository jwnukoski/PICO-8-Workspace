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
    self.weapon = 1

    self.colSize = 1
    self.colPad = 3
    self.col = Collidable.new(self.x + self.colPad, self.y + self.colPad, self.colSize, self.colSize, false)

    return self
end

function Player:update()
    self:movement()
    self.col:setPos(self.x + self.colPad, self.y + self.colPad)
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