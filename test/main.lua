player = nil

function _draw()
    cls()
    print(ASCII.BIRDS, 84, 84, COLOR.YLW)

    -- Draw the player
    player:draw()
end

function _update()
    if btn(INPUT.DN) then
        CAM:move(0, 1)
    end
end

function _init()
    player = Player.new(64, 64, COLOR.GRN)
end