MenuGameCompleted = {}
MenuGameCompleted.__index = MenuGameCompleted

-- Constructor
function MenuGameCompleted.new()
    local self = setmetatable({}, MenuGameCompleted)
    self.alive = true
    add(MENUS, self)
    return self
end

function MenuGameCompleted:draw()
    rectfill(0, 0, SCREEN.WIDTH, SCREEN.HEIGHT, COLOR.BLK)

    print("Game Completed!", 0 , 32, COLOR.GRN)
    print("Thanks for playing!", 0, 40, COLOR.WHT)
    print("Press " .. ASCII.KEY_O .. " to restart", 0, 48, COLOR.WHT)
    
    print("Your score was: " .. SCORE, 0, 56, COLOR.WHT)

    print("DEV SITE: jwnukoski.com", 0 , SCREEN.HEIGHT - 16, COLOR.WHT)
    print("github.com/jwnukoski", 0, SCREEN.HEIGHT - 8, COLOR.WHT)
end

function MenuGameCompleted:update()
    if (btn(INPUT.O)) then
        RESET()
        self.alive = false
    end
end
