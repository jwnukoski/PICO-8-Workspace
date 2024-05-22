Star = {}
Star.__index = Star

function Star.new(x, y, w, h, color)
    local self = setmetatable({}, Star)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.color = color
    self.alive = true
    return self
end

function Star:draw()
    if not self.alive then
        return
    end

    print(ASCII.STAR, self.x, self.y, self.color)
end

function Star:update()
    self.y = self.y + 1

    if self.y > SCREEN.HEIGHT then
        self.alive = false
    end
end