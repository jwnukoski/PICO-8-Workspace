SmallShip = {}
SmallShip.__index = SmallShip
SmallShip.SPRITE_INDEX = 17

function SmallShip.new(x, y, health, stopPointY)
    local self = setmetatable({}, SmallShip)

    self.parent = Enemy.new(x, y, self)
    self.health = health
    self.points = health
    self.w = 8

    self.parent.col.w = self.w
    self.parent.col.h = self.w
    
    self.stopPointY = stopPointY

    return self
end

function SmallShip:draw()
    spr(SmallShip.SPRITE_INDEX, self.parent.x, self.parent.y, 1, 1, false, false)
end

function SmallShip:update()
    -- goes down mid screen
    if self.parent.y < self.stopPointY then
        self.parent:setPos(self.parent.x, self.parent.y + 1)
        return
    end

    -- shoots when in position
    if SCREEN.frameInFPS == 0 then

        add(bullets, Bullet.new(self.parent.x, self.parent.y + 8, -1, 2, false))
        add(bullets, Bullet.new(self.parent.x, self.parent.y + 8, 1, 2, false))
    end
end

function SmallShip:kill()
    -- Nothing needs to happen here, but it must exist
end