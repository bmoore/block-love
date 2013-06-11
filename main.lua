HC = require 'hardoncollider'
function on_collision(dt, shape_one, shape_two, dx, dy)
    block:collision(dt, shape_one, shape_two, dx, dy)

    print("dt: " .. dt)
    print("shape_one: ")
    print(shape_one)
    print("shape_two: ")
    print(shape_two)
    print("dx: " .. dx)
    print("dy: " .. dy)
end

function collision_stop()
end

function love.load()
    print("Started")

    Collider = HC(100, on_collision, collision_stop)

    stage = require('stage')
    window = stage.create(240, 480)
    window:load()

    block = require("block")
    block:load()

end

function love.draw()
    --draw the background
    window:drawBg()

    --draw the block
    block:draw()
    
    --draw the stage frame
    window:drawFg()
end

function love.update(dt)
    --update the block
    block:update(dt)
    Collider:update(dt)
end

function love.focus(f)
end

function love.keypressed(key, unicode)
    block:keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
end

function love.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
end

function love.quit()
    print("Ended")
end
