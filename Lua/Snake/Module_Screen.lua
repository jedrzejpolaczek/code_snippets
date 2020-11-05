require ("Module_Button")
require ("Module_Snake")
-- Module Screen contains all function about particular screens in the games like printing screens or declare buttons for screens.
----------------------------------------------------------------------------
-- Declration of namespaces for Screen.
----------------------------------------------------------------------------
stdScreen = {}
-- Namespaces in namespace:
-- 						- menuScreen
-- 						- endScreen
-- 						- manualScreen
-- 						- creditScreen
----------------------------------------------------------------------------
stdScreen.menuScreen = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- declareButtonsForMenuScreen()
-- 						- drawMenuScreen()
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to declare menu screen buttons.
-- Function call functions:
--			buttonSpawn()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdScreen.menuScreen.declareButtonsForMenuScreen = function()
	stdButton.drawing.buttonSpawn(love.graphics.getWidth()*2/5, love.graphics.getHeight()/4, "START GAME", "start", "menu")
	stdButton.drawing.buttonSpawn(love.graphics.getWidth()*2/3, love.graphics.getHeight()*3/5 - 15, "INSTRUCTION", "manual", "menu")
	stdButton.drawing.buttonSpawn(love.graphics.getWidth()*2/3, love.graphics.getHeight()*3/5, "CREDITS", "credits", "menu")
	stdButton.drawing.buttonSpawn(love.graphics.getWidth()*2/3, love.graphics.getHeight()*3/5 + 15, "QUIT GAME", "quit", "menu")
end
----------------------------------------------------------------------------
-- Function is used to draw menu screen.
-- Function call functions:
--			buttonDraw()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdScreen.menuScreen.drawMenuScreen = function()	
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(imageMenuPoster, love.graphics.getWidth()*1/6, love.graphics.getHeight()*2/5)
	love.graphics.setColor(0, 0, 255)
	stdButton.drawing.buttonDraw("start")
	stdButton.drawing.buttonDraw("manual")
	stdButton.drawing.buttonDraw("credits")
	stdButton.drawing.buttonDraw("quit")
end
----------------------------------------------------------------------------
stdScreen.endScreen = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- declareButtonsForEndScreen()
-- 						- drawEndScreen()
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to declare end screen buttons.
-- Function call functions:
--			buttonSpawn()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdScreen.endScreen.declareButtonsForEndScreen = function()
	stdButton.drawing.buttonSpawn(love.graphics.getWidth()*2/3, love.graphics.getHeight()*3/5 - 15, "PLAY AGAIN", "again", "end")
	stdButton.drawing.buttonSpawn(love.graphics.getWidth()*2/3, love.graphics.getHeight()*3/5, "QUIT GAME", "quitEnd", "end")
end
----------------------------------------------------------------------------
-- Function is used to draw end screen.
-- Function call functions:
-- 			buttonDraw()
--			love.graphics.print()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdScreen.endScreen.drawEndScreen = function(snake)
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(imageEndPoster, love.graphics.getWidth()*1/5, love.graphics.getHeight()*2/5)
	love.graphics.setColor(0, 0, 255)
	stdButton.drawing.buttonDraw("again")
	stdButton.drawing.buttonDraw("quitEnd")
	love.graphics.print("Game End", love.graphics.getWidth()/2 -23, love.graphics.getHeight()/4 - 12)
	love.graphics.print("Your score: ", love.graphics.getWidth()/2 - 24, love.graphics.getHeight()/4)
	love.graphics.print(snake.score, love.graphics.getWidth()/2+6, love.graphics.getHeight()/4 + 12)
end
----------------------------------------------------------------------------
stdScreen.manualScreen = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- declareButtonsForManualScreen()
-- 						- drawManualScreen()
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to declare manual screen buttons.
-- Function call functions:
--			buttonSpawn()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdScreen.manualScreen.declareButtonsForManualScreen = function()
	stdButton.drawing.buttonSpawn(love.graphics.getWidth()*2/5 - 30, love.graphics.getHeight()*2/5 - 20, "BACK TO MENU", "menuFromManual", "manual")
end
----------------------------------------------------------------------------
-- Function is used to draw manual screen.
-- Function call functions:
--			love.graphics.print()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdScreen.manualScreen.drawManualScreen = function()
	local manual = {"Move up:", "w", 
					"Move down:", "s", 
					"Move right:", "d", 
					"Move left:", "a",
					"Music on/off:", "m",
					"Volume up:", "=",
					"Volume down:", "-"}
	for i=1, #manual, 2 do
		love.graphics.print(manual[i], love.graphics.getWidth()/3 + 40, love.graphics.getHeight()*2/5 + 30 + i*13)
		love.graphics.print(manual[i+1], love.graphics.getWidth()/2  + 40 , love.graphics.getHeight()*2/5 + 30 + i*13)
	end
	stdButton.drawing.buttonDraw("menuFromManual")
end
----------------------------------------------------------------------------
stdScreen.creditScreen = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- declareButtonsForMCreditScreen()
-- 						- drawCreditScreen()
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to declare credit screen buttons.
-- Function call functions:
--			buttonSpawn()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdScreen.creditScreen.declareButtonsForMCreditScreen = function()
	
	stdButton.drawing.buttonSpawn(love.graphics.getWidth()*2/5 - 30, love.graphics.getHeight()*2/5 - 20, "BACK TO MENU", "menuFromCredit", "credits")
end
----------------------------------------------------------------------------
-- Function is used to draw credit screen.
-- Function call functions:
--			love.graphics.print()
-- Function call variables:
--			N/A
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdScreen.creditScreen.drawCreditScreen = function()
	local credits = {"2d Art", "Marcelina Kurda", 
					"Design", "Mateusz Wozniewski", 
					"Develop", "Jedrzej Polaczek",
					"Sounds", "http://www.freesfx.co.uk"}
	for i=1, #credits, 2 do
		love.graphics.print(credits[i], love.graphics.getWidth()/3, love.graphics.getHeight()*2/5 + 30 + i*13)
		love.graphics.print(credits[i+1], love.graphics.getWidth()/2, love.graphics.getHeight()*2/5 + 30 + i*13)
	end
	stdButton.drawing.buttonDraw("menuFromCredit")
end