Player = {}
Player.__index = Player

Player.MOVE_SPEED = 2
Player.WIDTH = 8
Player.HEIGHT = 8
Player.BOUNDS_RIGHT = SCREEN.WIDTH - Player.WIDTH
Player.BOUNDS_BOTTOM = SCREEN.HEIGHT - Player.HEIGHT

-- Constructor
function Player.new(x, y, color)
    local self = setmetatable({}, Player)

    self.x = x
    self.y = y
    self.color = color
    self.health = 4
    self.alive = true

    return self
end

function Player:update()
    self:movement()
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
end

function Player:move(x, y)
    if not self.alive then
        return
    end

    self.x = self.x + x
    self.y = self.y + y
end