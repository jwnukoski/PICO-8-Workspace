Spinner = {}
Spinner.__index = Spinner
Spinner.SPRITE_INDEX = 35

function Spinner.new(x, y, health, stopPointY, shotsAllowed, dropsUpgrade)
    local self = setmetatable({}, Spinner)

    self.parent = Enemy.new(x, y, self)
    self.health = health
    self.points = health
    self.w = 16

    self.shotsTaken = 0
    self.shotsAllowed = shotsAllowed
    self.bypassLeaveBehavior = shotsAllowed == -1

    self.parent.dropsUpgrade = dropsUpgrade or false

    self.parent.col.w = self.w
    self.parent.col.h = self.w

    self.stopPointY = stopPointY

    add(ENEMIES, self.parent)

    return self
end

function Spinner:draw()
    spr(Spinner.SPRITE_INDEX, self.parent.x, self.parent.y, 2, 2, false, false)
end

function Spinner:update()
    -- goes down mid screen
    if self.parent.y < self.stopPointY then
        self.parent:setPos(self.parent.x, self.parent.y + 1)
        return
    end

    -- Shoot. -1 bypasses leaving.
    if (self.shotsTaken < self.shotsAllowed) or (self.bypassLeaveBehavior) then
        if SCREEN.frameInFPS == 0 or SCREEN.frameInFPS == 5 or SCREEN.FPS == 10 or SCREEN.FPS == 15 or SCREEN.frameInFPS == 20 then
            sfx(2)

            local x = self.parent.x + 4
            local y = self.parent.y + 4
  
            Bullet.new(x, y, 1, 0, false)
            Bullet.new(x, y, -1, 0, false)
            Bullet.new(x, y, 0, 1, false)
            Bullet.new(x, y, 0, -1, false)

            Bullet.new(x, y, 1, 1, false)
            Bullet.new(x, y, -1, 1, false)

            Bullet.new(x, y, 1, -1, false)
            Bullet.new(x, y, -1, -1, false)

            if not self.bypassLeaveBehavior then
                self.shotsTaken = self.shotsTaken + 1
            end

            return
        end

        return
    end

    -- leave
    if self.parent.x < SCREEN.WIDTH then
        self.parent:setPos(self.parent.x - 1, self.parent.y + 1)
        return
    else
        self.parent:setPos(self.parent.x + 1, self.parent.y + 1)
        return
    end
end

function Spinner:kill()
    -- Nothing needs to happen here, but it must exist
end