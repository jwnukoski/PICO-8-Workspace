CAM = {
    x = 0,
    y = 0,
    move = function(self, x, y)
        self:set(self.x + x, self.y + y)
    end,
    set = function(self, x, y)
        self.x = x
        self.y = y
        camera(self.x, self.y)
    end
}