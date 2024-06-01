Cloud = {}
Cloud.__index = Cloud
Cloud.SPRITE_IDS = {69, 71, 73, 75, 77, 101, 103, 105, 107, 109}

function Cloud.new(x, y)
    local self = setmetatable({}, Cloud)

    self.x = x
    self.y = y
    self.alive = true
    self.speed = flr(rnd(2)) + 1
    self.flipX = rnd(2) > 1
    self.spriteId = flr(rnd(#Cloud.SPRITE_IDS)) + 1
    log(self.spriteId)

    return self
end

function Cloud:draw()
    if not self.alive then
        return
    end

    spr(Cloud.SPRITE_IDS[self.spriteId], self.x, self.y, 2, 2, self.flipX, false)
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