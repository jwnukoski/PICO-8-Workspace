SCREEN = {
    FPS = 30,
    WIDTH = 128,
    HEIGHT = 120, -- minus 8 for menu
    frameInFPS = 0,

    advanceFrame = function(self)
        self.frameInFPS = self.frameInFPS + 1
        if self.frameInFPS > self.FPS then
            self.frameInFPS = 0
        end
    end
}