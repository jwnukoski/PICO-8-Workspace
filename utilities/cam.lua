-- Global camera object
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
    end,

    -- Check if given x and y are within the camera's view given the screen width and heigh values as well
    inView = function(self, x, y, w, h)
        return x + w > self.x and x < self.x + SCREEN.WIDTH and y + h > self.y and y < self.y + SCREEN.HEIGHT
    end

}