addEvent("N3xT.onOpenRadio", true)
addEvent("N3xT.onEffectRadio", true)

local screen = {guiGetScreenSize()}
local x, y = (screen[1] / 1366), (screen[2] / 768)

local visible
local aclname
local press

local radio = function()
    local panelWidth = x * 200
    local panelX = screen[1] - panelWidth - (x * 39)
    dxDrawImage(panelX, y * 318, panelWidth, y * 450, "files/gfx/radio.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

    if aclname and press then
        dxDrawText("Grup: " .. aclname .. "\n\nTroll,Gereksiz Konuşmak\n\nKüfür Vb. Yasaktır.\n\n" .. press, panelX + x * 46, y * 645, panelX + x * 131, y * 673, tocolor(0, 0, 0, 255), x * 0.80, "default", "left", "top", false, false, false, true, false)
    end
end

bindKey("z", "both",
    function()
        if (visible == true) then
            if (press ~= "#006400Konuşuyorsun") then
                press = "#006400Konuşuyorsun"
                playSound("files/sfx/effect.mp3")
            else
                press = "#ff0000Konuşmuyorsun"
                playSound("files/sfx/effect.mp3")
            end
        end
    end
)

addEventHandler("N3xT.onOpenRadio", root,
    function(acl)
        if (visible ~= true) then
            addEventHandler("onClientRender", root, radio)
            setElementData(localPlayer, "RadinhoAberto", acl)
            playSoundFrontEnd(8)
            visible = true
            aclname = acl
            press = "#ff0000Konuşmuyorsun"
        else
            removeEventHandler("onClientRender", root, radio)
            setElementData(localPlayer, "RadinhoAberto", nil)
            playSoundFrontEnd(8)
            visible = false
        end
    end
)

addEventHandler("N3xT.onEffectRadio", root, function() playSound("files/sfx/effect.mp3") end)
