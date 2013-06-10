HC = require 'hardoncollider'
function on_collision()
end

function collision_stop()
end

function love.load()
    print("Started")

    stage = require('stage')
    window = stage.create(280, 60, 240, 480)
    Collider = HC(100, on_collision, collision_stop)
    block = require("block")
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
