-- Global camera object with helpers
CAM = {
    x = 0,
    y = 0,
    
    -- Move the camera by x and y amounts
    move = function(self, x, y)
        self:set(self.x + x, self.y + y)
    end,

    -- Set the camera to x and y
    set = function(self, x, y)
        self.x = x
        self.y = y
        camera(self.x, self.y)
    end
}