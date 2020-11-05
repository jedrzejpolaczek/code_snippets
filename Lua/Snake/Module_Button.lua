require ("Module_Snake")
-- Module Buttons contains all function about buttons, like load and draw buttons, implement how they work etc.
----------------------------------------------------------------------------
-- Declration of namespaces for Buttons.
----------------------------------------------------------------------------
stdButton = {}
-- Namespaces in namespace:
-- 						- drawing
-- 						- playMethods
----------------------------------------------------------------------------
stdButton.drawing = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- buttonSpawn(x, y, text, id)
-- 						- buttonDraw(givenID)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to 
-- Function call functions:
--			table.insert()
-- Function call variables:
--			button
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdButton.drawing.buttonSpawn = function(x, y, text, id, screen)
	if screen == "menu" then
		table.insert(button.menu, {x=x, y=y, text=text, id=id, mouseover=false})
	end
	if screen == "end" then
		table.insert(button.endScreen, {x=x, y=y, text=text, id=id, mouseover=false})
	end
	if screen == "credits" then
		table.insert(button.credits, {x=x, y=y, text=text, id=id, mouseover=false})
	end
	if screen == "manual" then
		table.insert(button.manual, {x=x, y=y, text=text, id=id, mouseover=false})
	end
end
----------------------------------------------------------------------------
-- Function is used to 
-- Function call functions:
--			love.graphics.setColor()
--			love.graphics.setFont()
--			love.graphics.print()
--			ipairs()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdButton.drawing.buttonDraw = function(givenID)
	for i, v in ipairs(button.menu) do
		if v.id == givenID then
			if v.mouseover == false then
				love.graphics.setColor(0,0,255)
			end
			if v.mouseover == true then
				love.graphics.setColor(255,0,0)
			end
			if v.id == "manual" or v.id == "credits" or v.id == "quit" then
				love.graphics.setFont(small)
			else
				love.graphics.setFont(medium)
			end
			love.graphics.print(v.text, v.x, v.y)
			love.graphics.setFont(small)
			love.graphics.setColor(0,0,255)
		end
	end
	for i, v in ipairs(button.endScreen) do
		if v.id == givenID then
			if v.mouseover == false then
				love.graphics.setColor(0,0,255)
			end
			if v.mouseover == true then
				love.graphics.setColor(255,0,0)
			end
			love.graphics.setFont(small)
			love.graphics.print(v.text, v.x, v.y)
			love.graphics.setColor(0,0,255)
		end
	end
	for i, v in ipairs(button.credits) do
		if v.id == givenID then
			if v.mouseover == false then
				love.graphics.setColor(0,0,255)
			end
			if v.mouseover == true then
				love.graphics.setColor(255,0,0)
			end
			love.graphics.setFont(medium)
			love.graphics.print(v.text, v.x, v.y)
			love.graphics.setFont(small)
			love.graphics.setColor(0,0,255)
		end
	end		
	for i, v in ipairs(button.manual) do
		if v.id == givenID then
			if v.mouseover == false then
				love.graphics.setColor(0,0,255)
			end
			if v.mouseover == true then
				love.graphics.setColor(255,0,0)
			end
			love.graphics.setFont(medium)
			love.graphics.print(v.text, v.x, v.y)
			love.graphics.setFont(small)
			love.graphics.setColor(0,0,255)
		end
	end		
end
----------------------------------------------------------------------------
stdButton.playMethods = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- buttonClick(x, y)
-- 						- mouseCheck()
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to 
-- Function call functions:
--			
-- Function call variables:
--			
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdButton.playMethods.buttonClick = function(x, y)
	if gamestate[1] == "menu" then
		for i, v in ipairs(button.menu) do
			if x > v.x and x < v.x + medium:getWidth(v.text) and y > v.y and y < v.y + medium:getHeight(v.text) then
				if v.id == "start" or v.id == "again" then
					gamestate[1] = "playing"
					stdSnake.playMethods.snakeNewLive(snake)
				end
				if v.id == "manual" then
					gamestate[1] = "manual"
				end
				if v.id == "credits" then
					gamestate[1] = "credits"
				end
				if v.id == "quit" or v.id == "quitEnd" then
					love.event.push("quit")
				end
			end
		end	
	end
	if gamestate[1] == "manual" or gamestate[1] == "credits" then
		for i, v in ipairs(button.manual) do
			if x > v.x and x < v.x + medium:getWidth(v.text) and y > v.y and y < v.y + medium:getHeight(v.text) then
				if v.id == "menuFromManual" or v.id == "menuFromCredit" then
					gamestate[1] = "menu"
				end
			end
		end
	end
	if gamestate[1] == "end" then
		for i, v in ipairs(button.endScreen) do
			if x > v.x and x < v.x + medium:getWidth(v.text) and y > v.y and y < v.y + medium:getHeight(v.text) then
				if v.id == "again" then
					gamestate[1] = "playing"
					stdSnake.playMethods.snakeNewLive(snake)
				end
				if v.id == "quit" or v.id == "quitEnd" then
					love.event.push("quit")
				end
			end
		end
	end
end
----------------------------------------------------------------------------
-- Function is used to 
-- Function call functions:
--			ipairs()
--			getHeight()
--			getWidth()
-- Function call variables:
--			mousover
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdButton.playMethods.mouseCheck = function(mousex, mousey)
	for i, v in ipairs(button.menu) do
		if mousex > v.x and mousex < v.x + medium:getWidth(v.text) and mousey > v.y and mousey < v.y + medium:getHeight(v.text) then
			v.mouseover = true
		else
			v.mouseover = false
		end
	end
	for i, v in ipairs(button.endScreen) do
		if mousex > v.x and mousex < v.x + medium:getWidth(v.text) and mousey > v.y and mousey < v.y + medium:getHeight(v.text) then
			v.mouseover = true
		else
			v.mouseover = false
		end
	end
	for i, v in ipairs(button.credits) do
		if mousex > v.x and mousex < v.x + medium:getWidth(v.text) and mousey > v.y and mousey < v.y + medium:getHeight(v.text) then
			v.mouseover = true
		else
			v.mouseover = false
		end
	end
	for i, v in ipairs(button.manual) do
		if mousex > v.x and mousex < v.x + medium:getWidth(v.text) and mousey > v.y and mousey < v.y + medium:getHeight(v.text) then
			v.mouseover = true
		else
			v.mouseover = false
		end
	end
end
