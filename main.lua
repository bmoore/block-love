function love.load()
    print("Started")
    window = {}
    window.x = 280
    window.y = 60
    window.h = 480
    window.w = 240
    block = require("block")
end

function love.draw()
    --draw the background
    love.graphics.setColor(230,230,230,255)
    love.graphics.rectangle("fill", 280, 60, 240, 480)

    --draw the block
    block:draw()
    
    --draw the stage frame
    love.graphics.setColor(0,0,0,255)
    love.graphics.rectangle("fill", 0, 0, 800, 60)
    love.graphics.rectangle("fill", 0, 540, 800, 60)
    love.graphics.rectangle("fill", 0, 0, 280, 600)
    love.graphics.rectangle("fill", 520, 0, 280, 600)
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
