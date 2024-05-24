Meteor = {}
Meteor.__index = Meteor

function Meteor.new(x, y)
    local self = setmetatable({}, Meteor)

    self.x = x
    self.y = y
    self.alive = true

    self.flipX = rnd(2) > 1
    self.flipY = rnd(2) > 1
    
    -- Cheap distance effect
    self.speed = flr(rnd(3)) + 1

    return self
end

function Meteor:draw()
    if not self.alive then
        return
    end

    spr(64, self.x, self.y, 1, 1, false, false)

end

function Meteor:update()
    self.y = self.y + self.speed

    if self.y > SCREEN.HEIGHT then
        self.alive = false
    end
end