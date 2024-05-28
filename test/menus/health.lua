MenuHealth = {}
MenuHealth.__index = MenuHealth
MenuHealth.X = 0
MenuHealth.Y = SCREEN.HEIGHT

-- Constructor
function MenuHealth.new()
    local self = setmetatable({}, MenuHealth)

    self.text = ""

    return self
end

function MenuHealth:draw()
    if not player.alive then
        return
    end
    
    print(self.text, self.X, self.Y, COLOR.RED)      
end

function MenuHealth:update()
    if (#self.text == player.health) or (not player.alive) then
        return
    end

    self.text = ""
    for i = 1, player.health do
        self.text = self.text .. ASCII.HEART
    end
end