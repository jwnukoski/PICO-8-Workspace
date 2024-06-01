Static = {}
Static.__index = Static

function Static.new(x, y, spriteIndex, spriteSize)
    local self = setmetatable({}, Static)

    self.x = x
    self.y = y
    self.alive = true
    self.spriteIndex = spriteIndex
    self.spriteSize = spriteSize

    return self
end

function Static:draw()
    if not self.alive then
        return
    end

    spr(self.spriteIndex, self.x, self.y, self.selfspriteSize, self.spriteSize, false, false)
end

function Static:update()
    if not self.alive then
        return
    end
end

function Static:kill()
    self.alive = false
end