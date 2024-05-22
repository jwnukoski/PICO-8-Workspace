START_SCREEN = {}
START_SCREEN.__index = START_SCREEN

-- Constructor
function START_SCREEN.new()
    local self = setmetatable({}, START_SCREEN)
    self.active = true
    return self
end

function START_SCREEN:update()
    if not self.active then
        return
    end
    
    if btn(INPUT.O) or btn(INPUT.X) then
        if self.x > self.MOVE_SPEED then
            self:move(-self.MOVE_SPEED, 0)
        end
    end
end

-- Method to draw the player
function START_SCREEN:draw()
    spr(1, self.x, self.y, 1, 1, false, false)
    print("CONTROLS", SCREEN.WIDTH / 2, 0, COLOR.WHT)
    print(ASCII.ARW_LT, 84, 84, COLOR.YLW)
end