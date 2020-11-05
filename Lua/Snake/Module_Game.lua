-- Module Game contains all function about game.
----------------------------------------------------------------------------
-- Declration of namespaces for Game.
----------------------------------------------------------------------------
stdGame = {}
-- Namespaces in namespace:
-- 						- playMethods
----------------------------------------------------------------------------
stdGame.playMethods = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- changeLevel(snake)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to change level and speed of snake move.
-- Function call functions:
--			N/A
-- Function call variables:
--			gamestate
-- Function return:
--			new value of variable localTimer
----------------------------------------------------------------------------
stdGame.playMethods.changeLevel = function(snake)
	local newLocalTimer = snake.timerLimit

	if snake.score >= 1000 then
		gamestate.level = 0
		newLocalTimer = 0
	elseif snake.score >= 600 then
		gamestate.level = 9
		newLocalTimer = 0.01
	elseif snake.score >= 420 then
		gamestate.level = 8
		newLocalTimer = 0.02
	elseif snake.score >= 340 then
		gamestate.level = 7
		newLocalTimer = 0.03
	elseif snake.score >= 240 then
		gamestate.level = 6
		newLocalTimer = 0.04
	elseif snake.score >= 160 then
		gamestate.level = 5
		newLocalTimer = 0.05
	elseif snake.score >= 120 then
		gamestate.level = 4
		newLocalTimer = 0.06
	elseif snake.score >= 90 then
		gamestate.level = 3
		newLocalTimer = 0.07
	elseif snake.score >= 60 then
		gamestate.level = 2
		newLocalTimer = 0.08
	elseif snake.score >= 30 then
		gamestate.level = 1
		newLocalTimer = 0.09
	else
		gamestate.level = 0
		newLocalTimer = snake.timerLimit
	end
	
	return newLocalTimer
end