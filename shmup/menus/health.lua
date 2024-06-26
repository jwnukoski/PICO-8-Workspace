MenuHealth = {}
MenuHealth.__index = MenuHealth
MenuHealth.X = SCREEN.WIDTH / 2 - 12
MenuHealth.Y = SCREEN.HEIGHT

-- Constructor
function MenuHealth.new()
    local self = setmetatable({}, MenuHealth)
    self.alive = true
    self.text = ""
    add(MENUS, self)
    return self
end

function MenuHealth:draw()
    if not self.alive then
        return
    end

    print(self.text, self.X, self.Y, COLOR.RED)
end

function MenuHealth:update()
    if not self.alive then
        return
    end

    if #self.text == PLAYER.health then
        return
    end

    if not PLAYER.alive then
        self:kill()
    end

    self.text = ""
    for i = 1, PLAYER.health do
        self.text = self.text .. ASCII.HEART
    end
end

function MenuHealth:kill()
    self.alive = false
end

function MenuHealth:reset()
    self.text = ""
    self.alive = true
end