-- Module Audio contains all function about audios, like load audios, mute audios or volume up and down.
----------------------------------------------------------------------------
-- Declration of namespaces for Audio.
----------------------------------------------------------------------------
stdAudio = {}
-- Namespaces in namespace:
-- 						- playMethods
----------------------------------------------------------------------------
stdAudio.playMethods = {}
----------------------------------------------------------------------------
-- Methods of namespace:
-- 						- musicONOFF(key)
-- 						- audioManagment(key)
-- 						- loadAudio()
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Function is used to ON and OFF audio.
-- Function call functions:
-- 			love.audio.play()
-- 			love.audio.stop()
-- Function call variables:
--			gamestate.music
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdAudio.playMethods.musicONOFF = function(key)
	if key == "m" then
		if gamestate.music == 0 then
			gamestate.music = 1
			love.audio.play(bgSound[gamestate.bgSound])
			eatSound:setVolume(gamestate.volume)
		else
			gamestate.music = 0
			love.audio.stop(bgSound[gamestate.bgSound])
			eatSound:setVolume(0)
		end
	end
end
----------------------------------------------------------------------------
-- Function is used to managment audios.
-- Function call functions:
--			setVolume()
-- Function call variables:
--			gamestate.volume
--			gamestate.bgSound
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdAudio.playMethods.audioManagment = function(key)
	if key == "-" then
		if gamestate.volume>=0 then
			gamestate.volume = gamestate.volume-0.1
		end
		for i = 1, #bgSound do
			bgSound[gamestate.bgSound]:setVolume(gamestate.volume)
		end
		eatSound:setVolume(gamestate.volume)
	end
	if key == "=" then
		if gamestate.volume<1 then
			gamestate.volume = gamestate.volume+0.1	
		end
		for i = 1, #bgSound do
			bgSound[gamestate.bgSound]:setVolume(gamestate.volume)
		end
		eatSound:setVolume(gamestate.volume)
	end
	if key == "[" then
		if gamestate.bgSound > 1 then
			love.audio.stop(bgSound[gamestate.bgSound])
			gamestate.bgSound = gamestate.bgSound - 1
			love.audio.play(bgSound[gamestate.bgSound])
		end
	end
	if key == "]" then
		if gamestate.bgSound < #bgSound then
			love.audio.stop(bgSound[gamestate.bgSound])
			gamestate.bgSound = gamestate.bgSound + 1
			love.audio.play(bgSound[gamestate.bgSound])
		end
	end
end
----------------------------------------------------------------------------
-- Function is used to load new audios.
-- Function call functions:
--			love.audio.newSource()
-- Function call variables:
--			bgSound
--			eatSound
-- Function return:
--			N/A
----------------------------------------------------------------------------
stdAudio.playMethods.loadAudio = function()
	bgSound = {love.audio.newSource("m0_House_of_the_Rising_Sun.mp3","stream"), love.audio.newSource("m1_Rick_Astley.mp3","stream")}
	eatSound = love.audio.newSource("s1_eat.mp3","static")
	if gamestate.music == 1 then
		love.audio.play(bgSound[gamestate.bgSound])
	else
		love.audio.stop(bgSound[gamestate.bgSound])
	end
end