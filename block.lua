local block = {}

block.gravity = 300

block.h = 24
block.w = 24
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
block.clinging = false
block.shape = {}

function block:getColor()
    return self.color.r, self.color.g, self.color.b, self.color.a;
end

function block:load()
    block.shape = Collider:addRectangle(block.x, block.y, block.w, block.h)
end

function block:collision(dt, shape_one, shape_two, dx, dy)

    if (self.shape == shape_one) then
        print('shape one!')
    elseif (self.shape == shape_two) then
        print('shape two!')
    end

    self.x = self.x-dx
    self.y = self.y-dy

    if (math.abs(dx) > 0.000000001) then
        self.vx = 0
    end

    if (math.abs(dy)> 0.000000001) then
        self.vy = 0
    end
end

function block:draw()
    love.graphics.setColor(self:getColor())
    self.shape:draw('fill')
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
    self.shape:moveTo(self.x+12, self.y+12)
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

    self.clinging = false
    --test horizontal collision
    if ((self.x >= 496 and self.vx > 0) or (self.x <= 280 and self.vx < 0)) then

        self.vx = 0

        if (self.x > 496) then
            self.x = 496
        end

        if (self.x < 280) then
            self.x = 280
        end

        self:cling()
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

    if (self.clinging) then
        self.vy = -200

        if (self.x == 496) then
            self.vx = -100
        elseif (self.x == 280) then
            self.vx = 100
        else
        end
    end
end

function block:cling()
    if (love.keyboard.isDown("left") or love.keyboard.isDown("right")) then
        self.clinging = true
    end
end

return block
