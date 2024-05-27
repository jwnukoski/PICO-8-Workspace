MenuWeapon = {}
MenuWeapon.__index = MenuWeapon
MenuWeapon.X = SCREEN.WIDTH / 2 - 8
MenuWeapon.Y = SCREEN.HEIGHT

-- Constructor
function MenuWeapon.new()
    local self = setmetatable({}, MenuWeapon)

    self.text = ""

    return self
end

function MenuWeapon:draw()
    if not player.alive then
        return
    end
    
    print(self.text, self.X, self.Y, COLOR.WHT)
end

function MenuWeapon:update()
    if not player.alive then
        return
    end

    self.text = ASCII.STAR_THW .. player.weapon
end