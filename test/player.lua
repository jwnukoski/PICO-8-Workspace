Player = {}
Player.__index = Player

-- Constructor
function Player.new(x, y, color)
    local self = setmetatable({}, Player)
    self.x = x
    self.y = y
    self.color = color
    return self
end

-- Method to draw the player
function Player:draw()
    circfill(self.x, self.y, 8, self.color)
end