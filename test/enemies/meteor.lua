Meteor = {}
Meteor.__index = Meteor

function Meteor.new(x, y)
    local self = setmetatable({}, Meteor)
    self.parent = Enemy.new(x, y, self)
    self.health = 1

    self.flipX = rnd(2) > 1
    self.flipY = rnd(2) > 1

    self.speed = flr(rnd(3)) + 1
    self.w = 8
    self.spriteIndex = 64
    self.spriteSize = 1

    -- Larger
    if self.speed == 3 then
        self.w = 16
        self.spriteIndex = 65
        self.spriteSize = 2
    end

    self.parent.col.w = self.w
    self.parent.col.h = self.w

    return self
end

function Meteor:draw()
    spr(self.spriteIndex, self.parent.x, self.parent.y, self.spriteSize, self.spriteSize, false, false)
end

function Meteor:update()
    self.parent:setPos(self.parent.x, self.parent.y + self.speed)
end

function Meteor:kill()
    -- Nothing needs to happen here, but it must exist
end