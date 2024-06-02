MenuGameCompleted = {}
MenuGameCompleted.__index = MenuGameCompleted

-- Constructor
function MenuGameCompleted.new()
    local self = setmetatable({}, MenuGameCompleted)
    add(MENUS, self)
    return self
end

function MenuGameCompleted:draw()
    print("Game Completed!", 50, 50, COLOR.GRN)
    print("Thanks for playing!", 50, 60, COLOR.WHT)
    print("Press " .. ASCII.KEY_O .. " to restart", 50, 70, COLOR.WHT)

    print("DEVELOPER SITES: jwnukoski.com", 50, 90, COLOR.WHT)
    print("github.com/jwnukoski", 50, 110, COLOR.WHT)
end

function MenuGameCompleted:update()
    if (btnp(INPUT.O)) then
        RESET()
    end
end
