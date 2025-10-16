--game where animals fall from top player clicks
--before hit the bottom
--game ends when animal hits bottom

function love.load()
  pigFace = love.graphics.newImage("pig.png")
  backgroundImage = love.graphics.newImage("bg.png")
  colorPowerUp =  love.graphics.newImage("extra_box_exclamation.png")
 math.randomseed(os.time())
  math.random(); math.random(); math.random()
  startx = {math.random(0, love.graphics.getWidth() - pigFace:getWidth()), 
            math.random(0, love.graphics.getWidth() - pigFace:getWidth()),  
            math.random(0, love.graphics.getWidth() - pigFace:getWidth()),  
            math.random(0, love.graphics.getWidth() - pigFace:getWidth()), 
            math.random(0, love.graphics.getWidth() - pigFace:getWidth())}
  starty = {0 - math.random(pigFace:getHeight(), pigFace:getHeight() * 2),
            0 - math.random(pigFace:getHeight(), pigFace:getHeight() * 2),
            0 - math.random(pigFace:getHeight(), pigFace:getHeight() * 2),
            0 - math.random(pigFace:getHeight(), pigFace:getHeight() * 1),
            0 - math.random(pigFace:getHeight(), pigFace:getHeight() * 1)}
end

-------------------------------------------------
--MOUSE PRESS
--1 = left, 2 = right, 3 = middle wheel
-------------------------------------------------
function love.mousepressed(x, y, button, istouch)
  if button == 1 then
    --print("left mouse clicked")
    for i, v in ipairs(startx) do
      --if the mouse x and y is within the boundary of a pig picture
      if x >= startx[i] and x <= startx[i] + pigFace:getWidth() and y >= starty[i] and y <= starty[i] + pigFace:getHeight() then
        --print("in bounds")
        math.randomseed(os.time())
        math.random(); math.random(); math.random()
        --reset its y value (go back to the top)
        starty[i] = math.random(pigFace:getHeight(), pigFace:getHeight() * 2) * -1
      end
    end
  end
end

-------------------------------------------------
--UPDATE
-------------------------------------------------
function love.update(dt)
  for i, v in ipairs(starty) do
    --if pig hits the bottom of the screen, lua quits (we lose)
    if starty[i] + pigFace:getHeight() >= love.graphics.getHeight() then
      --print("over the edge")
      love.event.quit()
    end
    --pigs move down 
    starty[i] = starty[i] + 80 * dt
  end
end

-------------------------------------------------
--DRAW
-------------------------------------------------
function love.draw()
  love.graphics.draw(backgroundImage, 0, 0)
  --draw each pig at their respective x and y
  for i, v in ipairs(startx) do
    love.graphics.draw(pigFace, startx[i], starty[i])
  end
  for i, v in ipairs(startx) do
    love.graphics.draw(colorPowerUp, startx[i], starty[i])
  end
end