-- Module Map contains all function about maps like drawing map.
----------------------------------------------------------------------------
-- Declration of namespaces for Map.
----------------------------------------------------------------------------
stdMap = {}
-- Namespaces in namespace:
-- 						- drawing
----------------------------------------------------------------------------
stdMap.drawing = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- drawMap()
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to draw map.
-- Function call functions:
--			love.graphics.setColor()
-- 			love.graphics.rectangle()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdMap.drawing.drawMap = function()
	love.graphics.setColor(150, 150, 225)
	for i = map.topX-10, map.downX, 10 do 
		love.graphics.rectangle("fill", i, map.topY-10, 10, 10)
		love.graphics.rectangle("fill", i, map.downY+10, 10, 10)
	end
	for i = map.topY-10, map.downY, 10 do 
		love.graphics.rectangle("fill", map.topX-10, i, 10, 10)
		love.graphics.rectangle("fill", map.downX+10, i, 10, 10)
	end
	love.graphics.rectangle("fill", map.downX+10, map.downY+10, 10, 10)
end