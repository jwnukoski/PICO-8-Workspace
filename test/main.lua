function _draw()
    cls()
    print(ASCII.BIRDS, 84, 84, COLOR.YLW)
end

function _update()
    if btn(INPUT.DN) then
        CAM:move(0, 1)
    end
end

function _init()

end