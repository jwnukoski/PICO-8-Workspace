MenuScore = {}
MenuScore.__index = MenuScore
MenuScore.X = 0
MenuScore.Y = SCREEN.HEIGHT

-- Constructor
function MenuScore.new()
    local self = setmetatable({}, MenuScore)
    self.score = 0
    self.alive = true
    add(MENUS, self)
    return self
end

function MenuScore:draw()
    if not self.alive then
        return
    end

    print("SCORE: " .. SCORE, self.X, self.Y, COLOR.WHT)
end

function MenuScore:update()
    if not self.alive then
        return
    end

    if not PLAYER.alive then
        self:kill()
        return
    end
end

function MenuScore:kill()
    self.alive = false
end

function MenuScore:reset()
    self.time = 0
    self.alive = true
end