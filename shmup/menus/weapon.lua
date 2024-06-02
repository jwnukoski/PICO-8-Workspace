MenuWeapon = {}
MenuWeapon.__index = MenuWeapon
MenuWeapon.X = SCREEN.WIDTH - 20
MenuWeapon.Y = SCREEN.HEIGHT
MenuWeapon.MAX_LVL = 10

-- Constructor
function MenuWeapon.new()
    local self = setmetatable({}, MenuWeapon)
    self:reset()
    add(MENUS, self)
    return self
end

function MenuWeapon:draw()
    if not self.alive then
        return
    end
    
    print(self.text, self.X, self.Y, self.color)
end

function MenuWeapon:update()
    if not self.alive then
        return
    end

    if not PLAYER.alive then
        self:kill()
        return
    end

    if PLAYER.weapon >= MenuWeapon.MAX_LVL then
        self.text = (ASCII.STAR_THW .. "MAX")
        self.color = COLOR.YLW
        return
    end

    self.text = ASCII.STAR_THW .. PLAYER.weapon
end

function MenuWeapon:reset()
    self.text = ""
    self.color = COLOR.WHT
    self.alive = true
end

function MenuWeapon:kill()
    self.alive = false
end