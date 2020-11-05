
require ("Module_Audio")
require ("Module_Button")
require ("Module_Debug")
require ("Module_Game")
require ("Module_Map")
require ("Module_Object")
require ("Module_Screen")	
require ("Module_Snake")
-------------------------------------------------------------------------
-------------------------------------------------------------------------
gamestate = {"menu", debugMode=0, level=0, music=0, volume=1, bgSound=1}
map = {topX=40, topY=40, downX=750, downY=550}
button = {}
button.menu = {}
button.manual = {}
button.credits = {}
button.endScreen = {}
-------------------------------------------------------------------------
-------------------------------------------------------------------------
function love.conf(w)
	w.screen.width = 1024
	w.screen.high = 768
	w.screen.title = "The Dognake"
end
-------------------------------------------------------------------------
-------------------------------------------------------------------------
function love.load()
	love.graphics.setColor(0, 0, 225)
	medium = love.graphics.newFont(25)
	small = love.graphics.newFont(12)
	love.graphics.setBackgroundColor(255, 255, 255)
	---------------------
	--snake speed
	timer = 0
	---------------------
	--snake
	snake = stdSnake.playMethods.snakeCreaction(20, love.graphics.getWidth()/2, love.graphics.getHeight()/2, "up", 20, 20)
	---------------------
	--scoring object
	object = stdObject.scoringObject.playMethods.scoringObjectCreation(snake, 20, 20, 10)
	---------------------
	--sounds and music
	stdAudio.playMethods.loadAudio()
	---------------------
	-- Buttons declarations
	stdScreen.menuScreen.declareButtonsForMenuScreen()
	stdScreen.endScreen.declareButtonsForEndScreen()
	stdScreen.manualScreen.declareButtonsForManualScreen()
	stdScreen.creditScreen.declareButtonsForMCreditScreen()
	---------------------
	-- Graphics
	imageSnakeHead = love.graphics.newImage("g_snakeHead.jpg")
	imageSnakeBody = love.graphics.newImage("g_snakeBody.jpg")
	imageSnakeTail = love.graphics.newImage("g_snakeTail.jpg")
	imageScoringObject = love.graphics.newImage("g_scoringObject1.jpg")
	imageMenuPoster = love.graphics.newImage("g_menuPoster.jpg")
	imageEndPoster = love.graphics.newImage("g_endPoster.jpg")
end
-------------------------------------------------------------------------
-------------------------------------------------------------------------
function love.update(dt)
	-- Game interactions
	if gamestate[1] == "menu" or gamestate[1] == "manual" or gamestate[1] == "credits" or gamestate[1] == "end" then
		stdButton.playMethods.mouseCheck(love.mouse.getX(), love.mouse.getY())
	elseif gamestate[1] == "playing" then
		-- snake control
		timer = timer + dt
		if timer > snake.timerLimit then
			stdSnake.moving.snakeMoves(snake, object)
			timer=0
		end
		snake.timerLimit = stdGame.playMethods.changeLevel(snake)
	end	
	--love.graphics.print(INFO, 390, 550)
end
-------------------------------------------------------------------------
-------------------------------------------------------------------------
function love.draw()
	-- Drawing game
	--love.graphics.setBackgroundColor(255, 255, 255)
	if gamestate[1] == "menu" then -- drawing menu
		stdScreen.menuScreen.drawMenuScreen()
	elseif gamestate[1] == "playing" then -- drawing snake map and snake
		love.graphics.print("Level " .. gamestate.level, 390, 10)
		stdMap.drawing.drawMap()
		stdSnake.drawing.snakeDraw(snake)
		stdObject.scoringObject.drawing.drawScoringObject(object)
		love.graphics.setColor(0, 100, 255)
	elseif gamestate[1] == "manual" then -- drawing manual
		stdScreen.manualScreen.drawManualScreen()
	elseif gamestate[1] == "credits" then -- drawing credits
		stdScreen.creditScreen.drawCreditScreen()
	elseif gamestate[1] == "end" then -- drawing end screen
		stdScreen.endScreen.drawEndScreen(snake)
	end

	--Drawing debug mode
	if gamestate[1] == "playing" and gamestate.debugMode == 1 then
		stdDebug.drawing.printDebugParametrs(snake, object)
	end
	--love.graphics.print(INFO, 360, 580)
end
-------------------------------------------------------------------------
-------------------------------------------------------------------------
function love.mousepressed(x,y)
	if gamestate[1] ~= "playing" then
		stdButton.playMethods.buttonClick(x,y)
	end
	INFO = "x: " .. x .. " y: " .. y
end
-------------------------------------------------------------------------
-------------------------------------------------------------------------
function love.keyreleased(key)
   if key == "escape" then
      	love.event.quit()
   	end
	if gamestate.music == 1 then
   		stdAudio.playMethods.audioManagment(key)
   	end
   	if gamestate[1] == "playing" then
   		stdDebug.playMethods.debugONOFF(key)
   		stdAudio.playMethods.musicONOFF(key)
   		stdSnake.moving.snakeChangeDirection(snake, key)
   end
end