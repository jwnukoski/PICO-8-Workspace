SmallShip = {}
SmallShip.__index = SmallShip
SmallShip.SPRITE_INDEX = 17

function SmallShip.new(x, y, health)
    local self = setmetatable({}, SmallShip)

    self.parent = Enemy.new(x, y, self)
    self.health = health
    self.w = 8

    self.parent.col.w = self.w
    self.parent.col.h = self.w

    return self
end

function SmallShip:draw()
    spr(SmallShip.SPRITE_INDEX, self.parent.x, self.parent.y, 1, 1, false, false)
end

function SmallShip:update()
    self.parent:setPos(self.parent.x, self.parent.y + 1)
end

function SmallShip:kill()
    -- Nothing needs to happen here, but it must exist
end