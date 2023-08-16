SETTINGS_REFRESH = 9000 -- Interval in which team channels are refreshed, in MS.
bShowChatIcons = true

voicePlayers = {}
globalMuted = {}

local range = 30 
  
addEventHandler ( "onClientPlayerVoiceStart", root, 
function() 
    if (source and isElement(source) and getElementType(source) == "player") and localPlayer ~= source then
    	
    	local l = getElementData(localPlayer, "RadinhoAberto")
    	local s = getElementData(source, "RadinhoAberto")

    	if l and s and (l == s) then
    		voicePlayers[source] = true
    		return
    	end

    	if not s then
        	local sX, sY, sZ = getElementPosition(localPlayer) 
        	local rX, rY, rZ = getElementPosition(source) 
        	local distance = getDistanceBetweenPoints3D(sX, sY, sZ, rX, rY, rZ) 
        	
        	if distance <= range then 
            	voicePlayers[source] = true 
        	else 
            	cancelEvent()
        	end
        else
        	cancelEvent()
        end 
    end 
end 
)

addEventHandler ( "onClientPlayerVoiceStop", root,
	function()
		voicePlayers[source] = nil
	end
)

addEventHandler ( "onClientPlayerQuit", root,
	function()
		voicePlayers[source] = nil
	end
)
---

function checkValidPlayer ( player )
	if not isElement(player) or getElementType(player) ~= "player" then
		outputDebugString ( "is/setPlayerVoiceMuted: Bad 'player' argument", 2 )
		return false
	end
	return true
end

---

setTimer ( 
	function()
		bShowChatIcons = getElementData ( resourceRoot, "show_chat_icon", show_chat_icon )
	end,
SETTINGS_REFRESH, 0 )