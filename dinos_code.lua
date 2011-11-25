-- declare basic variables and libraries
local physics = require "physics"
require "sprite"
--physics.setDrawMode( "hybrid" )
alive = true;
display.setStatusBar( display.HiddenStatusBar )
playerSpeed = 10;
dinoDir = 0;
--launch initial stuff
	physics.start();
	physics.setGravity(0,0);	
	score = 0;
	playerLife = 100;
	score = 0;
    local zwoptexData = require "dinos"
	local spriteData = zwoptexData.getSpriteSheetData()
--local spriteSheet = sprite.newSpriteSheetFromData( "Untitled.png", data )
--display start button

    local startButton = display.newImage("playbuttonmaster.png")
    startButton.x = 100; startButton.y = 565
    transition.to( startButton, { time=200, delay=200, x=100, y=365 } )
    
    spriteSheet = sprite.newSpriteSheetFromData("dinos.png", spriteData)
spriteSet = sprite.newSpriteSet(spriteSheet, 1, 5)
sprite.add( spriteSet, "go", 1, 2, 20)
sprite.add( spriteSet, "stop", 3, 1, 20)
sprite.add( spriteSet, "back", 4, 2, 20)
function resetWater()



water.y = 700;
transition.to(water, {time=30000, y=-210, onComplete=resetWater})
end
function resetWater2()



water2.y = 700;
transition.to(water2, {time=30000, y=-210, onComplete=resetWater2})
end
function restartBG_1()

print("restart 1")
spaceBG_1.x = 160;
spaceBG_1.y = 630;
transition.to(spaceBG_1, {time=50000, y=-210, onComplete=restartBG_1})
end

function restartBG_2()
print("restart 2");
spaceBG_2.x = 160;
spaceBG_2.y = 630;
transition.to(spaceBG_2, {time=50000, y=-210, onComplete=restartBG_2})

end 
function restartBG_3()
print("restart 3");
spaceBG_3.x = 160;
spaceBG_3.y = 630;
transition.to(spaceBG_3, {time=70000, y=-210, onComplete=restartBG_3})

end 
function restartBG_4()
print("restart 4");
spaceBG_4.x = 160;
spaceBG_4.y = 630;
transition.to(spaceBG_4, {time=70000, y=-210, onComplete=restartBG_4})

end 
spaceBG_1 = display.newImage("spaceBG.png");
spaceBG_1.x = 160;
spaceBG_1.y = 210;
transition.to(spaceBG_1, {time=25000, y=-210, onComplete=restartBG_1})

spaceBG_2 = display.newImage("spaceBG.png");
spaceBG_2.x = 160;
spaceBG_2.y = 630;
transition.to(spaceBG_2, {time=50000, y=-210, onComplete=restartBG_2})

spaceBG_3 = display.newImage("spaceBG_2.png");
spaceBG_3.alpha = .5
spaceBG_3.x = 160;
spaceBG_3.y = 210;
transition.to(spaceBG_3, {time=35000, y=-210, onComplete=restartBG_3})

spaceBG_4 = display.newImage("spaceBG_2.png");
spaceBG_4.alpha = .5
spaceBG_4.x = 160;
spaceBG_4.y = 630;
transition.to(spaceBG_4, {time=70000, y=-210, onComplete=restartBG_4})


local title = display.newImage("titletest.png");
checkBounds = function ( event)

if (alive) then
score = score + 1;
 scoreText.text = score
    scoreText:setReferencePoint(display.CenterLeftReferencePoint);
    if (playerLife <= 100) then
    playerLife = playerLife + .01;
    end
player:applyForce(-.10,0);
end

--draw lifebar

 
healthRect.height = (playerLife / 100) * 117

 healthRect:setReferencePoint(display.TopLeftReferencePoint);
 healthRect.y = 170

--Change these later to represent a dynamic device width
    if (player.y < 10) then
       -- player.y = 10;
       --endGame();
       player.y = 10;
       --player:setLinearVelocity(0,0);
      player:applyForce( 0, 3, player.x, player.y )
    elseif  (player.y > 470) then
       player.y = 470;
       player:applyForce( 0, -3, player.x, player.y )
      --  endGame();

    elseif(player.x > 310) then
        player.x = 310;
         player:applyForce( -3, 0, player.x, player.y )
      --endGame();
    

    elseif(player.x < 10) then
       player.x = 10;
       player:applyForce( 3, 0, player.x, player.y )
    --   endGame();
    end
    
    if (playerLife < 0) then
    endGame();
    
    end

--for now, end the game

end

--create a function that controls the start button
function startButton:tap( event ) 
    self:removeSelf();
    title.isVisible = false;
    --have the button listener create the game objects, remove the button, and add new listeners
    Runtime:addEventListener("enterFrame", checkBounds)
    
    --modify this later for multitouch
    Runtime:addEventListener("touch", handleTouch)
   
   --run a function that creates all the blocks and sets them in motion
    createBlocks();
       --draw score
       
       local offsetNum = 8;
	local offsetNumY = 5
    --draw the score
    scoreText = display.newText( "0", 320-offsetNum, 390+offsetNumY, "ArcadeClassic", 36 )
    scoreText:setReferencePoint(display.CenterLeftReferencePoint);
    scoreText:setTextColor(255, 255, 255)
    scoreText:rotate(90);
    
    --display life bar label
     healthText = display.newText( "HEALTH:", 320-offsetNum, 0+offsetNumY, "ArcadeClassic", 36 )
    healthText:setReferencePoint(display.CenterLeftReferencePoint);
    healthText:setTextColor(255, 255, 255)
    healthText:rotate(90);
    
    --display water
    water = display.newImage("water.png");
    water.x = 10; water.y = 240
    water.xScale = 1.2;
    water.yScale = 1.2;
    transition.to(water, {time=5000, xScale=1.4, onComplete=pulseDown})
     transition.to(water, {time=15000, y = -240, onComplete=resetWater})
     
      water2 = display.newImage("water.png");
    water2.x = 10; water2.y = 700
    water2.xScale = 1.2;
    water2.yScale = 1.2;
    transition.to(water2, {time=5000, xScale=1.4, onComplete=pulseDown})
     transition.to(water2, {time=30000, y = -240, onComplete=resetWater2})
    
    --display full health bar
    healthRect = display.newImage("healthbar.png");
    healthRect:setReferencePoint(display.TopLeftReferencePoint);
    healthRect.x = 300; healthRect.y = 170
    
    player = sprite.newSprite( spriteSet )
    player:prepare("go");
    player:play();
   -- player = display.newImage("dinosmall.png")
    physics.addBody(player, {density = .05, friction = .2, bounce = .5 })
	player.bodyType = "dynamic" local type = player.bodyType
	player.id = "player"
		    
	player.x = 100;
	player.y = 100;
		    player.isFixedRotation = true
		    local function onLocalCollision( self, event )
                if ( event.phase == "began" ) then
                    print("woah!");
                   --for now, end the game
                   endGame();
                end
            end
            local function onPostCollision( event )
        if ( event.force > .2 ) then
                print( "Collision force: " .. event.force .. " Friction: " .. event.friction )
       playerLife = playerLife - (event.force)*30
       end
        --end
end
 
player:addEventListener( "postCollision", onPostCollision )
    --add a collision event listener for the player
   --  player.collision = onLocalCollision
  --  player:addEventListener( "collision", player )

end


function endGame()

healthRect.isVisible = false;
print("the game is ova");
Runtime:removeEventListener("enterFrame", checkBounds)
  Runtime:removeEventListener("touch", handleTouch)
  Runtime:removeEventListener( "enterFrame", moveRight )
   Runtime:removeEventListener( "enterFrame", moveLeft )


local function remSelf()
player.isVisible = false;
alive = false; 
end
    

  
--remove player and its listeners
timer.performWithDelay(10, remSelf);


--remove all blocks 



--display game over title
gameOver = display.newImage("gameover.png");
gameOver.x = 320 / 2;
gameOver.y = 480 / 2;

end

function createBlocks()


if (alive) then 

if(score < 14000) then
local diffModified = (3000 - score * .6)
timer.performWithDelay(diffModified, createBlocks); --modify this with difficulty
end
if(score >= 5000) then
local diffModified = (200)
end

--for i=0, 40, 1 do
maxNum = math.floor(3 + score*.01)
if (maxNum > 5) then
maxNum = 5
end

whichEnemy = math.floor(math.random(maxNum));

if (whichEnemy>=2.0) then
local block1a = display.newImage("asteroid_sm.png") 
physics.addBody(block1a, {density = 1.0, friction = .5, bounce = .5, radius = 10})
block1a.bodyType = "dynamic" local type = block1a.bodyType
block1a.cat = "block"
local randAng = 4 + math.random(30);
block1a.angularVelocity = randAng;
block1a.x = 20 + math.random(280);
local rando = 20 +math.random(1 + score*.04);
--local rando = math.random(20);
block1a.y = 680;
local speedModifier = 1;

local randoVert = math.random(10)
local posOrNeg = math.random(10)
local theOne = 1
if (posOrNeg >=5) then
theOne = 1;
end
if (posOrNeg >5) then
theOne = -1;
end
local function removeStuff()

block1a:removeSelf();
block1a.bodyType = nil
block1a.cat = nil
block1a = nil;
end

local randomTime = 15000+ math.random(10000)
block1a:setLinearVelocity(-randoVert*theOne, -playerSpeed - rando);
--transition.to( block1a, { time=5000, y = -200, onComplete=removeStuff});
timer.performWithDelay(100000, removeStuff);


end



if (whichEnemy<=1) then
local block1a = display.newImage("asteroidMED.png") 
physics.addBody(block1a, {density = 1.0, friction = .5, bounce = .5, radius = 40})
block1a.bodyType = "dynamic" local type = block1a.bodyType
block1a.cat = "block"
local randAng = 4 + math.random(30);
block1a.angularVelocity = randAng;
block1a.x = 20 + math.random(280);
local rando = 20 +math.random(1 + score*.03);
--local rando = math.random(20);
block1a.y = 680;
local speedModifier = 1;

local randoVert = math.random(10)
local posOrNeg = math.random(10)
local theOne = 1
if (posOrNeg >=5) then
theOne = 1;
end
if (posOrNeg >5) then
theOne = -1;
end
local function removeStuff()

block1a:removeSelf();
block1a.bodyType = nil
block1a.cat = nil
block1a = nil;
end

local randomTime = 15000+ math.random(10000)
block1a:setLinearVelocity(-randoVert*theOne, -playerSpeed - rando);
--transition.to( block1a, { time=5000, y = -200, onComplete=removeStuff});
timer.performWithDelay(100000, removeStuff);


end



end

end
--add a listener for the button
startButton:addEventListener( "tap", startButton )




--functions to handle player movement
local moveLeft = function( event )
    		
	player:applyForce( .4, -.75, player.x, player.y )
	if (dinoDir ~= -1) then
	player:prepare("back")
	player:play();
	dinoDir = -1
	end
	
end
	
 	    
		    
 
local moveRight = function( event )
    player:applyForce( .4, .75, player.x, player.y )
   if (dinoDir ~= 1) then
   player:prepare("go")
	player:play();
	dinoDir = 1
	end
end


--this is a hacky workaround that adds event listeners when the screen is touched and removes them when the finger is lifted
function handleTouch( event )
   print(event.phase);
   
   local phase = event.phase;
   if (phase == "began") then
        if (event.y < 240) then
    
            Runtime:addEventListener( "enterFrame", moveLeft )
        end
 
        if (event.y > 240) then
    
            Runtime:addEventListener( "enterFrame", moveRight )
        end

   end
   
   if (event.phase == "ended") then
 	   
 	    if (event.y < 240) then
    
            Runtime:removeEventListener( "enterFrame", moveLeft )
        end
 
        if (event.y > 240) then
    
            Runtime:removeEventListener( "enterFrame", moveRight )
        end
player:prepare("stop");
player:play();
dinoDir = 0;
   end
 	  
end

	
	
	