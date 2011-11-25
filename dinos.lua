module(...)


-- This file is for use with Corona Game Edition
--
-- The function getSpriteSheetData() returns a table suitable for importing using sprite.newSpriteSheetFromData()
--
-- Usage example:
--			local zwoptexData = require "ThisFile.lua"
-- 			local data = zwoptexData.getSpriteSheetData()
--			local spriteSheet = sprite.newSpriteSheetFromData( "Untitled.png", data )
--
-- For more details, see http://developer.anscamobile.com/content/game-edition-sprite-sheets

function getSpriteSheetData()

	local sheet = {
		frames = {
		
			{
				name = "dinosmall2.png",
				spriteColorRect = { x = 0, y = 0, width = 53, height = 78 }, 
				textureRect = { x = 2, y = 2, width = 53, height = 78 }, 
				spriteSourceSize = { width = 53, height = 78 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "dinosmall2_2.png",
				spriteColorRect = { x = 0, y = 0, width = 53, height = 78 }, 
				textureRect = { x = 57, y = 2, width = 53, height = 78 }, 
				spriteSourceSize = { width = 53, height = 78 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "dinosmall3.png",
				spriteColorRect = { x = 0, y = 14, width = 53, height = 64 }, 
				textureRect = { x = 2, y = 82, width = 53, height = 64 }, 
				spriteSourceSize = { width = 53, height = 78 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "dinosmall4.png",
				spriteColorRect = { x = 0, y = 14, width = 53, height = 64 }, 
				textureRect = { x = 57, y = 82, width = 53, height = 64 }, 
				spriteSourceSize = { width = 53, height = 78 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "dinosmall4_2.png",
				spriteColorRect = { x = 0, y = 14, width = 53, height = 64 }, 
				textureRect = { x = 2, y = 148, width = 53, height = 64 }, 
				spriteSourceSize = { width = 53, height = 78 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
		}
	}

	return sheet
end