Collidable = {}
Collidable.__index = Collidable

-- Constructor
function Collidable.new(parent, xOffset, yOffset, w, h, visible)
    local self = setmetatable({}, Player)

    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.visible = visible or false
    self.alive = true

    return self
end

function Collidable:update()
    if (not self.alive) then
        return
    end

    
end


function Collidable:draw()
    if (not self.visible) then
        return
    end

    rectfill(self.x, self.y, self.w, self.h, COLOR.RED)
end