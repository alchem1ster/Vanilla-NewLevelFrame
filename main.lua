local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("PLAYER_LEVEL_UP")

print = function(msg) if msg then DEFAULT_CHAT_FRAME:AddMessage(msg) end end

newLevelFrame = CreateFrame("Frame", nil, UIParent)
newLevelFrameTexture = newLevelFrame:CreateTexture(nil, "BACKGROUND")

function showNewLevelFrame(level)
    if newLevelFrame.footer then
        newLevelFrame.footer:SetText(string.format(NEW_LEVEL_NUM_STR, level))
        if not newLevelFrame:IsVisible() or newLevelFrame:GetAlpha() < 0.1 then
            newLevelFrame:Show()
            UIFrameFadeIn(newLevelFrame, 2, 0, 1)
            newLevelFrame.timeShown = 0
            newLevelFrame:SetScript("OnUpdate", function(self, elapsed)
				local elapsed = arg1 or 0
                newLevelFrame.timeShown = newLevelFrame.timeShown + elapsed
                if newLevelFrame.timeShown >= 5 then
                    UIFrameFadeOut(newLevelFrame, 2, 1, 0)
                    newLevelFrame:SetScript("OnUpdate", nil)
                end
            end)
        end
    end
end

f:SetScript("OnEvent", function()
    if event == "PLAYER_LOGIN" then
        -- setup new frame
        newLevelFrame:SetFrameStrata("BACKGROUND")
        newLevelFrame:SetWidth(400)
        newLevelFrame:SetHeight(200)
        newLevelFrame:SetPoint("TOP", 0, -128)
        -- setup texture
        newLevelFrameTexture:SetTexture("Interface\\AddOns\\NewLevelFrame\\newlevel_frame")
        newLevelFrameTexture:SetAllPoints(newLevelFrame)
        -- setup header text
        newLevelFrame.header = newLevelFrame:CreateFontString(nil, "ARTWORK")
        newLevelFrame.header:SetFont("Fonts\\FRIZQT__.TTF", 18)
        newLevelFrame.header:SetPoint("CENTER", 0, 20)
        newLevelFrame.header:SetText(REACHED_LEVEL_STR)
        -- setup footer text
        newLevelFrame.footer = newLevelFrame:CreateFontString(nil, "ARTWORK")
        newLevelFrame.footer:SetFont("Fonts\\FRIZQT__.TTF", 30)
        newLevelFrame.footer:SetPoint("CENTER", 0, -20)
        newLevelFrame.footer:SetTextColor(207 / 255, 191 / 255, 20 / 255, 1)
        -- hide frame at startup
        newLevelFrame:Hide()
    elseif event == "PLAYER_LEVEL_UP" then
        newLevelFrame.footer:SetText("")
        showNewLevelFrame(arg1)
    end
end)

SLASH_LEVELFRAME1 = "/lvltest"

local function TestLevelFrame(msg, editbox)
    if newLevelFrame.footer then
        newLevelFrame.footer:SetText("")
        showNewLevelFrame(UnitLevel("player"))
    end
end

SlashCmdList["LEVELFRAME"] = TestLevelFrame