Meteor = {}
Meteor.__index = Meteor

function Meteor.new(x, y)
    local self = setmetatable({}, Meteor)

    self.x = x
    self.y = y
    self.alive = true

    self.flipX = rnd(2) > 1
    self.flipY = rnd(2) > 1

    self.speed = flr(rnd(3)) + 1
    self.colSize = 8
    self.spriteIndex = 64
    self.spriteSize = 1

    -- Larger
    if self.speed == 3 then
        self.colSize = 16
        self.spriteIndex = 65
        self.spriteSize = 2
    end

    self.col = Collidable.new(self.x, self.y, self.colSize, self.colSize, true)

    return self
end

function Meteor:draw()
    if not self.alive then
        return
    end

    spr(self.spriteIndex, self.x, self.y, self.spriteSize, self.spriteSize, false, false)

    self.col:draw()
end

function Meteor:update()
    if not self.alive then
        return
    end

    self.y = self.y + self.speed

    if self.y > SCREEN.HEIGHT then
        self:kill()
    end

    self.col:setPos(self.x, self.y)
    self.col:collidesWith(player.col, function()
        player:damage()
        self:explode()
        self:kill()
    end)
end

function Meteor:explode()
    if self.colSize ~= 8 then
        local offset = self.colSize / 4
        add(explosions, Explosion.new(self.x + offset, self.y + offset, 1, 1))
    else
        add(explosions, Explosion.new(self.x, self.y, 1, 1))
    end
    
    self:kill()
end

function Meteor:kill()
    self.col:kill()
    self.alive = false
end