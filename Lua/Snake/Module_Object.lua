-- Module Object contains all function about objects like change position of objects on the map, drawing objects or checking collision.
----------------------------------------------------------------------------
-- Declration of namespaces for Object.
----------------------------------------------------------------------------
stdObject = {}
-- Namespaces in namespace:
-- 						- scoringObject
----------------------------------------------------------------------------
stdObject.scoringObject = {}
-- Namespaces in namespace:
-- 						- collisions
-- 						- drawing
-- 						- moving
-- 						- playMethods
----------------------------------------------------------------------------
stdObject.scoringObject.collision = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- collisionWithSnakeX(snake, tempX)
-- 						- collisionWithSnakeY(snake, tempY)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to set checking collison object with snake.
-- Function call functions:
--			N/A
-- Function call variables:
--			N/A
-- Function return:
--			colisionX - false when coordinates of snakes are diffrent then corrdinates of object
----------------------------------------------------------------------------
stdObject.scoringObject.collision.collisionWithSnakeX = function (snake, tempX)
	local colisionX = true

	while colisionX do	
		for i=1, #snake.body do
			if ((snake.body[i].x + snake.weigh) >= tempX and (snake.body[i].x + snake.weigh) <= (tempX + object.weigh)) or colisionX then
				colisionX = true
				break
			else
				colisionX = false
			end
		end
	end

	return colisionX
end
----------------------------------------------------------------------------
-- Function is used to set checking collison object with snake.
-- Function call functions:
--			N/A
-- Function call variables:
--			N/A
-- Function return:
--			colisionY - false when coordinates of snakes are diffrent then corrdinates of object
----------------------------------------------------------------------------
stdObject.scoringObject.collision.collisionWithSnakeY = function (snake, tempY)
	local colisionY = true

	while colisionY do	
		for i=1, #snake.body do
			if ((snake.body[i].y + snake.high) >= tempY and (snake.body[i].y + snake.high) <= (tempY + object.high)) or colisionY then
				colisionY = true
			else
				colisionY = false
			end
		end
	end

	return colisionY
end
----------------------------------------------------------------------------
stdObject.scoringObject.drawing = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- drawScoringObject(object)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to create new scoring object.
-- Function call functions:
--			love.graphics.setColor()
-- 			love.graphics.rectangle()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdObject.scoringObject.drawing.drawScoringObject = function(object)
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(imageScoringObject, object.x, object.y)
end
----------------------------------------------------------------------------
stdObject.scoringObject.moving = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- newScoringObjectPosition(snake, object)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to set new scoring object position. Function eliminate 
-- conflict of scoring object position with snake position. Function 
-- prevents to snake go beyond the border of the map.
-- Function call functions:
--			math.random()
-- 			stdObject.scoringObject.collision.collisionWithSnakeX()
-- Function call variables:
--			N/A
-- Function return:
--			tempX - new X variable of scoring object
--			tempY - new Y variable of scoring object
----------------------------------------------------------------------------
stdObject.scoringObject.moving.newScoringObjectPosition = function(snake, object)
	local tempX 
	local tempY 

	local weighTemp = object.weigh
	local highTemp = object.high
	--repeat
		tempX = math.random((map.topX+20)/10, ((map.downX-20)/10))*10
		tempY = math.random((map.topY+20)/10, ((map.downY-20)/10))*10
	--until stdObject.scoringObject.collision.collisionWithSnakeX(snake, tempX)
	
	return tempX, tempY
end
----------------------------------------------------------------------------
stdObject.scoringObject.playMethods = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- scoringObjectCreation(snake, high, weigh, scoreValue)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to create new scoring object.
-- Function call functions:
--			tdScoringObjectLive.playMethods.newScoringObjectPosition()
-- Function call variables:
--			object.x
--			object.y
--			object.high
--			object.weigh
--			object.scoreValue
-- Function return:
--			table
----------------------------------------------------------------------------
stdObject.scoringObject.playMethods.scoringObjectCreation = function(snake, high, weigh, scoreValue)
	local object = {}
	
	object.x, object.y = stdObject.scoringObject.moving.newScoringObjectPosition(snake, object)
	object.high = high
	object.weigh = weigh
	object.scoreValue = scoreValue
	
	return object
end