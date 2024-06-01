Cloud = {}
Cloud.__index = Cloud
Cloud.SPRITE_IDS = {69, 71, 73, 75, 77}

function Cloud.new(x, y)
    local self = setmetatable({}, Star)

    self.x = x
    self.y = y
    self.alive = true
    self.speed = flr(rnd(3)) + 1
    self.spriteIndex = Cloud.SPRITE_IDS[flr(rnd(#Cloud.SPRITE_IDS))]
    self.flipX = rnd(2) > 1

    return self
end

function Cloud:draw()
    if not self.alive then
        return
    end

    spr(Cloud.SPRITE_IDS[self.spriteIndex], self.x, self.y, 2, 2, self.flipX, false)
end

function Cloud:update()
    if not self.alive then
        return
    end

    self.y = self.y + self.speed

    if self.y > SCREEN.HEIGHT then
        self:kill()
    end
end

function Cloud:kill()
    self.alive = false
end