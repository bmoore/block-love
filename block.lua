local block = {}

block.gravity = 300

block.height = 24
block.width = 24
block.color = {
    r = 130,
    g = 150,
    b = 255,
    a = 255
}
block.x = window.x
block.y = window.y
block.vx = 0
block.vy = 0

function block:getColor()
    return self.color.r, self.color.g, self.color.b, self.color.a;
end

function block:draw()
    love.graphics.setColor(self:getColor())
    love.graphics.rectangle("fill", self.x, self.y, self.height, self.width)
end

function block:update(dt)
    self:updateVelocity(dt)
    self:updatePosition(dt)
end

function block:updatePosition(dt)
    self.y = self.y + (self.vy*dt) + (self.gravity*(dt^2)/2)
    if (self.y > 516) then
        self.y = 516
    end

    self.x = self.x + (self.vx*dt)
end

function block:updateVelocity(dt)
    self.vy = self.vy + self.gravity*dt
    if (self.y >= 516 and self.vy > 0) then
        self.vy = 0
    end

    left = love.keyboard.isDown("left")
    right = love.keyboard.isDown("right")
    if (left) then
        self.vx = self.vx - (self.gravity*dt)
        if (self.vx+200 < 0) then
            self.vx = -200
        end
    elseif (right) then
        self.vx = self.vx + (self.gravity*dt)
        if (self.vx-200 > 0) then
            self.vx = 200
        end
    else
        if (self.vx > 0) then
            self.vx = self.vx - self.gravity*dt
            if (self.vx < 0) then
                self.vx = 0
            end
        end

        if (self.vx < 0) then
            self.vx = self.vx + self.gravity*dt
            if (self.vx > 0) then
                self.vx = 0
            end
        end
    end

    if ((self.x > 496 and self.vx > 0) or (self.x < 280 and self.vx < 0)) then
        self.vx = 0-self.vx
    end
end

function block:keypressed(key, update)
    if (key == "up") then
        self:jump()
    end
end

function block:jump()
    if (self.vy == 0) then
        self.vy = -200
    end
end

return block
