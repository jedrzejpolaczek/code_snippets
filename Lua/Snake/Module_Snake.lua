-- Module Snake contains all function about snake like change position of snake on the map, drawing snake or checking collision.
----------------------------------------------------------------------------
-- Declration of namespaces for Snake.
----------------------------------------------------------------------------
stdSnake = {}
-- Namespaces in namespace:
-- 						- collision
-- 						- rawing
-- 						- moving
-- 						- playMethodsd
----------------------------------------------------------------------------
stdSnake.collision = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- snakeCheckCollision_ScroingObjects(snake, object)
-- 						- snakeCheckCollision_Map(snake)
-- 						- snakeCheckCollision_Body(snake)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to checking collisions with scoring objects.
-- Function call functions:
--			stdSnake.playMethods.snakeGrow()
--			love.audio.play()
--			stdScoringObjectLive.newScoringObjectPosition()
-- Function call variables:
--			object.x
--			object.y
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.collision.snakeCheckCollision_ScroingObjects = function(snake, object)
	local checkXsnake = (snake.body[1].x >= object.x) and (snake.body[1].x <= (object.x + object.weigh))
	local checkXobject = ((snake.body[1].x + snake.weigh) >= object.x) and ((snake.body[1].x + snake.weigh) <= (object.x + object.weigh))
	local checkX = checkXsnake or checkXobject
	
	local checkYsnake = (snake.body[1].y >= object.y) and (snake.body[1].y <= (object.y + object.high))
	local checkYobject = ((snake.body[1].y + snake.high) >= object.y) and ((snake.body[1].y + snake.high) <= (object.y + object.high))
	local checkY = checkYsnake or checkYobject

	if checkX and checkY then
		stdSnake.playMethods.snakeGrow(snake, object)
		love.audio.play(eatSound)
		object.x, object.y = stdObject.scoringObject.moving.newScoringObjectPosition(snake, object)
	end
end
----------------------------------------------------------------------------
-- Function is used to checking collisions with map's borders.
-- Function call functions:
--			stdSnake.playMethods.snakeDeath(snake)
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.collision.snakeCheckCollision_Map = function(snake) 
	local snakeX
	local snakeY
	if snake.direction == "up" then
		snakeX = snake.body[1].x
		snakeY = snake.body[1].y
	elseif snake.direction == "down" then
		snakeX = snake.body[1].x
		snakeY = snake.body[1].y + snake.high
	elseif snake.direction == "left" then
		snakeX = snake.body[1].x
		snakeY = snake.body[1].y
	else
		snakeX = snake.body[1].x + snake.weigh
		snakeY = snake.body[1].y
	end		

	if snakeX > map.downX then
		stdSnake.playMethods.snakeDeath(snake)
	elseif snakeX < map.topX then
		stdSnake.playMethods.snakeDeath(snake)
	elseif snakeY < map.topY then
		stdSnake.playMethods.snakeDeath(snake)
	elseif snakeY > map.downY then
		stdSnake.playMethods.snakeDeath(snake)
	end
end
----------------------------------------------------------------------------
-- Function is used to checking collisions with snake's body.
-- Function call functions:
--			stdSnake.playMethods.snakeDeath(snake)
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.collision.snakeCheckCollision_Body = function(snake)
	for i = 5, #snake.body do
		if snake.body[1].x == snake.body[i].x and snake.body[1].y == snake.body[i].y then
			stdSnake.playMethods.snakeDeath(snake)
		end
	end
end
----------------------------------------------------------------------------
stdSnake.drawing = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- snakeDraw(snake)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to give feedback how images should rotate and correct 
-- their position.
-- Function call functions:
--			N/A
-- Function call variables:
--			N/A
-- Function return:
--			imageRotation
--			xCorrect
--			yCorrect 
----------------------------------------------------------------------------
stdSnake.drawing.rotate = function(direction, weigh, high)
	local imageRotation = 0
	local xCorrect = 0
	local yCorrect = 0

	if direction == "up" then
		imageRotation =  0
		xCorrect = 0
		yCorrect = 0
	elseif direction == "right" then
		imageRotation =  math.pi/2
		xCorrect = xCorrect + weigh
		yCorrect = 0
	elseif direction == "down" then
		imageRotation =  math.pi
		xCorrect = xCorrect + weigh
		yCorrect = yCorrect + high
	elseif direction == "left" then
		imageRotation =  math.pi + math.pi/2
		xCorrect = 0
		yCorrect = yCorrect + high
	end

	return imageRotation, xCorrect, yCorrect
end
----------------------------------------------------------------------------
-- Function is used to snake/game screen.
-- Function call functions:
--			love.graphics.rectangle()
--			love.graphics.setColor()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.drawing.snakeDraw = function(snake)
	local imageRotation = 0
	local xCorrect = 0
	local yCorrect = 0
	
	--Drawing tail
		love.graphics.setColor(255, 255, 255)
		imageRotation, xCorrect, yCorrect = stdSnake.drawing.rotate(snake.body[#snake.body].direction, snake.weigh, snake.high)
		love.graphics.draw(imageSnakeTail, snake.body[#snake.body].x + xCorrect, snake.body[#snake.body].y + yCorrect, imageRotation)
	--Drawing body
	for i=#snake.body-1, 2, -1 do
		imageRotation, xCorrect, yCorrect = stdSnake.drawing.rotate(snake.body[i].direction, snake.weigh, snake.high)
		love.graphics.draw(imageSnakeBody, snake.body[i].x + xCorrect, snake.body[i].y + yCorrect, imageRotation)
	 	
	 	if snake.body[i].direction ~= snake.body[i+1].direction then
			love.graphics.setColor(0, 0, 255)
			love.graphics.rectangle("fill", snake.body[i].x, snake.body[i].y, 20, 20)
			love.graphics.setColor(255, 255, 255)
			
			imageRotation, xCorrect, yCorrect = stdSnake.drawing.rotate(snake.body[#snake.body].direction, snake.weigh, snake.high)
			love.graphics.draw(imageSnakeTail, snake.body[#snake.body].x + xCorrect, snake.body[#snake.body].y + yCorrect, imageRotation)
		end
	end

	--Drawing head
		imageRotation, xCorrect, yCorrect = stdSnake.drawing.rotate(snake.body[1].direction, snake.weigh, snake.high)
		love.graphics.draw(imageSnakeHead, snake.body[1].x + xCorrect, snake.body[1].y + yCorrect, imageRotation)
		love.graphics.setColor(0, 0, 255)
end
----------------------------------------------------------------------------
stdSnake.moving = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- snakeChangeDirection(snake, key)
-- 						- snakeMoveBody(snake)
-- 						- snakeMakeMove(snake)
-- 						- snakeMoves(snake, object)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to change direction wherein snake moves.
-- Function call functions:
--			N/A
-- Function call variables:
--			snake.direction
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.moving.snakeChangeDirection = function(snake, key)
	if key == "d" and ((snake.body[1].x+snake.step) ~= snake.body[2].x or (snake.body[1].y) ~= snake.body[2].y) then
		snake.direction = "right"
		snake.body[1].direction = "right"
	elseif key == "a" and ((snake.body[1].x-snake.step) ~= snake.body[2].x or (snake.body[1].y) ~= snake.body[2].y) then
		snake.direction = "left"
		snake.body[1].direction = "left"
	elseif key == "w" and ((snake.body[1].y-snake.step) ~= snake.body[2].y or (snake.body[1].x) ~= snake.body[2].x) then
		snake.direction = "up"
		snake.body[1].direction = "up"
	elseif key == "s" and ((snake.body[1].y+snake.step) ~= snake.body[2].y or (snake.body[1].x) ~= snake.body[2].x) then
		snake.direction = "down"
		snake.body[1].direction = "down"
	end
end
----------------------------------------------------------------------------
-- Function is used to moves snake's body. Function start changing body 
-- position from tail to head.
-- Function call functions:
--			N/A
-- Function call variables:
--			snake.body[n].x
--			snake.body[n].y
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.moving.snakeMoveBody = function(snake)
	for i = #snake.body, 2, -1 do
		snake.body[i].x = snake.body[i].parent.x
		snake.body[i].y = snake.body[i].parent.y
		snake.body[i].direction = snake.body[i].parent.direction
	end
end
----------------------------------------------------------------------------
-- Function is used to make one move of snake.
-- Function call functions:
--			stdSnake.moving.snakeMoveBody(snake)
-- Function call variables:
--			snake.body[1].x
--			snake.body[1].y
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.moving.snakeMakeMove = function(snake)
	if snake.direction == "right"  then
		stdSnake.moving.snakeMoveBody(snake)
		snake.body[1].x = snake.body[1].x + snake.step
	elseif snake.direction == "left" then
		stdSnake.moving.snakeMoveBody(snake)
		snake.body[1].x = (snake.body[1].x - snake.step)
	elseif snake.direction == "up" then
		stdSnake.moving.snakeMoveBody(snake)
		snake.body[1].y = (snake.body[1].y - snake.step)		
	elseif snake.direction == "down" then
		stdSnake.moving.snakeMoveBody(snake)
		snake.body[1].y = snake.body[1].y + snake.step
	end
end
----------------------------------------------------------------------------
-- Function is used to makes one move of snake withcollison conditions etc.
-- Function call functions:
--			stdSnake.moving.snakeMakeMove(snake)
--			stdSnake.collision.snakeCheckCollision_ScroingObjects(snake, object)
--			stdSnake.collision.snakeCheckCollision_Map(snake)
--			stdSnake.collision.snakeCheckCollision_Body(snake)
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
 stdSnake.moving.snakeMoves = function(snake, object)
	stdSnake.moving.snakeMakeMove(snake)
	stdSnake.collision.snakeCheckCollision_ScroingObjects(snake, object)
	stdSnake.collision.snakeCheckCollision_Map(snake)
	stdSnake.collision.snakeCheckCollision_Body(snake)
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
stdSnake.playMethods = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- snakeCreaction(step, xPosition, yPosition, direction)
-- 						- snakeNewLive(snake)
-- 						- snakeGrow(snake, object)
-- 						- snakeDeath(snake)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to create new instance of snake.
-- Function call functions:
--			N/A
-- Function call variables:
--			snake.step
--			snake.direction
--			snake.score
--			snake.deathCounter
--			snake.high
--			snake.weigh
--			snake.body
-- Function return:
--			table of tables
----------------------------------------------------------------------------
stdSnake.playMethods.snakeCreaction = function(step, xPosition, yPosition, direction, snakeHigh, snakeWeigh)
	local snake = {}
	snake.startLong = 3
	snake.startX = xPosition
	snake.startY = yPosition
	snake.startStep = step
	snake.startDirection = direction

	snake.step = snake.startStep
	snake.direction = snake.startDirection
	snake.score = 0
	snake.deathCounter = 0
	snake.high = snakeHigh
	snake.weigh = snakeWeigh
	snake.timerLimit = 0.1
	
	snake.body = {}
	snake.body[1] = {}
	snake.body[1].x = snake.startX
	snake.body[1].y = snake.startY
	snake.body[1].direction = snake.direction
	snake.body[1].imageRotation = 0
	
	for i=2, snake.startLong do
		snake.body[i] = {}
		snake.body[i].parent = snake.body[i-1]
		snake.body[i].x = xPosition
		snake.body[i].y = yPosition + ((i-1)*snake.high)
		snake.body[i].direction = snake.body[i].parent.direction
		snake.body[i].imageRotation = 0
	end
	
	return snake
end	
----------------------------------------------------------------------------
-- Function is used to restart snake's parameters.
-- Function call functions:
--			N/A
-- Function call variables:
--			snake.body
--			snake.score
--			snake.direction
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.playMethods.snakeNewLive = function(snake)
	for i = snake.startLong + 1, #snake.body do
		snake.body[i] = nil
	end
	for i = 1, #snake.body do
		snake.body[i].x = snake.startX
		snake.body[i].y = snake.startY + ((i-1)*snake.high)
		snake.body[i].direction = snake.body[i].startDirection
	end
	snake.score = 0
	snake.direction = snake.startDirection
end
----------------------------------------------------------------------------
-- Function is used to extend snake. Direction of extend is depend on 
-- direction in which snake is moving.
-- Function call functions:
--			tabel.insert()
-- Function call variables:
--			snake.score
--			snake.parent
--			snake.body
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.playMethods.snakeGrow = function(snake, object)
	snake.score = snake.score + object.scoreValue
	table.insert(snake.body, {})
	snake.body[#snake.body].parent = snake.body[#snake.body-1]
	if snake.direction == "right" then
		snake.body[#snake.body].x = snake.body[#snake.body].parent.x-snake.step
		snake.body[#snake.body].y = snake.body[#snake.body].parent.y
	elseif snake.direction == "left" then
		snake.body[#snake.body].x = snake.body[#snake.body].parent.x+snake.step
		snake.body[#snake.body].y = snake.body[#snake.body].parent.y
	elseif snake.direction == "up" then
		snake.body[#snake.body].x = snake.body[#snake.body].parent.x
		snake.body[#snake.body].y = snake.body[#snake.body].parent.y-snake.step
	else
		snake.body[#snake.body].x = snake.body[#snake.body].parent.x
		snake.body[#snake.body].y = snake.body[#snake.body].parent.y+snake.step
	end
end
----------------------------------------------------------------------------
-- Function is used to set end of the game. Function don't change screen.
-- Function call functions:
--			N/A
-- Function call variables:
--			snake.deathCounter
--			gamestate
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdSnake.playMethods.snakeDeath = function(snake)
	snake.deathCounter = snake.deathCounter + 1
	gamestate[1] = "end"
end