Player = {}
Player.__index = Player
Player.MOVE_SPEED = 5
Player.WIDTH = 8
Player.HEIGHT = 8
Player.BOUNDS_RIGHT = SCREEN.WIDTH - Player.WIDTH - Player.MOVE_SPEED

-- Constructor
function Player.new(x, y, color)
    local self = setmetatable({}, Player)
    self.x = x
    self.y = y
    self.color = color
    return self
end

function Player:update()
    -- Left
    if btn(INPUT.LT) then
        if self.x > self.MOVE_SPEED then
            self:move(-self.MOVE_SPEED, 0)
        end
    -- Right
    elseif btn(INPUT.RT) then
        if self.x < self.BOUNDS_RIGHT then
            self:move(self.MOVE_SPEED, 0)
        end
    end
end

-- Method to draw the player
function Player:draw()
    spr(1, self.x, self.y, 1, 1, false, false)
end

function Player:move(x, y)
    self.x = self.x + x
    self.y = self.y + y
end