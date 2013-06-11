local Stage = {}
Stage.__index = Stage

Stage.x = 0
Stage.y = 0
Stage.h = 0
Stage.w = 0
Stage.color = {
    r = 230,
    g = 230,
    b = 230,
    a = 255
}

Stage.frameColor = {
    r = 0,
    g = 0,
    b = 0,
    a = 255
}

Stage.goal = {}

function Stage.create(w,h)
    local new_stage = {}
    setmetatable(new_stage, Stage)
    new_stage.x = (love.graphics.getWidth() - w)/2
    new_stage.y = (love.graphics.getHeight() - h)/2
    new_stage.w = w
    new_stage.h = h
    return new_stage
end

function Stage:load()
    self.goal = Collider:addRectangle(300,300,100,10)
end

function Stage:getBottomY()
    return self.y+self.h
end

function Stage:getRightX()
    return self.x+self.w
end

function Stage:getColor()
    return self.color.r, self.color.g, self.color.b, self.color.a
end

function Stage:getFrameColor()
    return self.frameColor.r, self.frameColor.g, self.frameColor.b, self.frameColor.a
end

function Stage:drawBg()    
    love.graphics.setColor(self:getColor())
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function Stage:drawFg()
    local win_h, win_w = love.graphics.getHeight(), love.graphics.getWidth()
    love.graphics.setColor(self:getFrameColor())
    love.graphics.rectangle("fill", 0, 0, win_w, self.y)
    love.graphics.rectangle("fill", 0, self.y+self.h, win_w, win_h-self.y-self.h)
    love.graphics.rectangle("fill", 0, 0, win_w-self.x-self.w, win_h)
    love.graphics.rectangle("fill", self.x+self.w, 0, win_w-self.x-self.w, win_h)
    love.graphics.setColor(180,120,80,150)
    self.goal:draw("fill")
end

return Stage
