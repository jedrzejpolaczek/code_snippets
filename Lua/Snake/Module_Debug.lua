-- Module Debug contains all function about debug mode, like on and off debug mode.
----------------------------------------------------------------------------
-- Declration of namespaces for Debug.
----------------------------------------------------------------------------
stdDebug = {}
-- Namespaces in namespace:
-- 						- drawing
-- 						- playMethods
----------------------------------------------------------------------------
stdDebug.drawing = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- printDebugParametrs(snake, object)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to change level and speed of snake move.
-- Function call functions:
--			love.graphics.print()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdDebug.drawing.printDebugParametrs = function(snake, object)
	local yLine = 480
	love.graphics.print("Screen: " .. gamestate[1], yLine, 0)
	love.graphics.print("Debug Mode: " .. gamestate.debugMode, yLine, 10)
	for i=1, #snake.body do
		love.graphics.print("Body " .. i .. " X: " .. snake.body[i].x .. " Body " .. i .. " Y: " .. snake.body[i].y, yLine, (i+1)*10)
	end
	love.graphics.print("Points: " .. snake.score, yLine, (#snake.body+2)*10)
	love.graphics.print("Object X: " .. object.x .. " Object Y: " .. object.y, yLine, (#snake.body+3)*10)
	love.graphics.print("Deaths: " .. snake.deathCounter, yLine, (#snake.body+4)*10)
	love.graphics.print("Music: " .. gamestate.music, yLine, (#snake.body+5)*10)
	love.graphics.print("Volume: " .. gamestate.volume, yLine, (#snake.body+6)*10)
	love.graphics.print("Song number : " .. gamestate.bgSound, yLine, (#snake.body+7)*10)
end
----------------------------------------------------------------------------
stdDebug.playMethods = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- debugONOFF(key)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to change leve and speed of snake move.
-- Function call functions:
--			N/A
-- Function call variables:
--			gamestate.debugMode
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdDebug.playMethods.debugONOFF = function(key)
	if key == "`" then
		if gamestate.debugMode == 1 then
			gamestate.debugMode = 0
		else 
			gamestate.debugMode = 1
		end
	end
end