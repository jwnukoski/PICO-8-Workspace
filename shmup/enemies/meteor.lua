Meteor = {}
Meteor.__index = Meteor

function Meteor.new(x, y, health, speed, large)
    local self = setmetatable({}, Meteor)
    self.parent = Enemy.new(x, y, self)
    self.health = health
    self.points = health
    self.w = 8

    self.flipX = rnd(2) > 1
    self.flipY = rnd(2) > 1

    self.speed = speed
    self.spriteIndex = 64
    self.spriteSize = 1

    self.large = large or false
    if self.large then
        self.w = 16
        self.spriteIndex = 65
        self.spriteSize = 2
    end

    -- Set collision size
    self.parent.col.w = self.w
    self.parent.col.h = self.w

    add(ENEMIES, self.parent)

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