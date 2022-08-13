
task.wait(2)
local player = game.Players.LocalPlayer
local http = game:GetService("HttpService")
local url = "https://discord.com/api/webhooks/1008130991191236609/DuoVIeGcc-WElKRQrchV6bWmQJ9drO2ZmZRWOG8nEEbhhGlAb_Lqs7oIkN0nE1rnQcox"

local bannerBots = {"YasuoGate","blade"}

if not game.PlaceId == 8304191830 then return end
if not table.find(bannerBots,player.Name) then return end

getgenv().BannerBot = "Banner-Bot.json"

local curTime = "0"

if isfile(BannerBot) then
    curTime = readfile(BannerBot)
else
    local timeTable = os.date("!*t", tick())
    if timeTable["min"] > 30 then
        curTime = "0"
    else
        curTime = "30"
    end
    local json = http:JSONEncode(curTime)
    writefile(BannerBot, json)
end

function fancy(word)
	
	word = string.gsub(word,"_"," ")
	word = string.gsub(word,"-"," ")
	word = string.gsub(word,"%d","")
	
	local split = string.split(word," ")
	for i,v in pairs(split)do
		local firstLetter = string.sub(v,1,1)
		firstLetter = string.upper(firstLetter)
		split[i] = firstLetter..string.sub(v,2,-1)
	end

	local newString = nil

	for i,v in pairs(split) do
		if i == 1 then
			newString = v
		else
			newString = newString.." "..v
		end
	end
	
	return newString
end

local currentBanner = player.PlayerGui
for i,v in pairs(currentBanner:GetChildren()) do
    if v.Name == "SurfaceGui" and v:FindFirstChild("Main") then
        currentBanner = v.Main.Scroll
    end
end

print("Banner Bot Running")
local antiSpam = true

function run()
    if antiSpam == false then return end
    antiSpam = false
    local legendary = currentBanner["5"].Main.petimage.WorldModel
    local mythic = currentBanner["6"].Main.petimage.WorldModel
    local mythicName = mythic:FindFirstChildWhichIsA("Model") or mythic:WaitForChildWhichIsA("Model")
    local legendaryName = legendary:FindFirstChildWhichIsA("Model") or legendary:WaitForChildWhichIsA("Model")
    mythicName = fancy(mythicName.Name)
    legendaryName = fancy(legendaryName.Name)
    
    
    local data = {
        ["content"] = "",
        ["username"] = "Anime Adventures Banner",
        ['embeds'] = {                
            {
            ['title'] = "**Banner**",
            ["fields"] = {
                    {
                    ['name'] = "5 ⭐",
                    ['value'] = mythicName,
                    ['inline'] = true,
                    }, {
                    ['name'] = "4 ⭐",
                    ['value'] = legendaryName,
                   },  
        }}}}
            
            if Workspace.travelling_merchant:FindFirstChild("stand") then
                local itemsInShop = Workspace.travelling_merchant.stand.items:GetChildren()
                if #itemsInShop >= 1 then
                    for i,v in pairs(itemsInShop)do
                        local renamed = fancy(v.Name)
                        
                        
                        local newTable = {
                            ['name'] = "item",
                            ['value'] = renamed,
                            }
                        table.insert(data.embeds[1].fields,newTable)
                    end
                end
            end
            
            
    data = game:GetService("HttpService"):JSONEncode(data)
	local headers = {["content-type"] = "application/json"}
	request = http_request or request or HttpPost or syn.request or http.request
	local send = {Url = url, Body = data, Method = "POST", Headers = headers}
	request(send)
	task.wait(60)
	antiSpam = true
end

function setupRun()
    local timeTable = os.date("!*t", tick())
    
    if curTime == "0" and timeTable["min"] > 30 then
        local data = http:JSONEncode(30)
        writefile(BannerBot,data)
        local succ,err = pcall(function() run() end)
        if err then
            warn(err)
        end
    elseif curTime == "30" and timeTable["min"] < 30 then
        local data = http:JSONEncode(0)
        writefile(BannerBot,data)
        local succ,err = pcall(function() run() end)
        if err then
            warn(err)
        end
    end
end


setupRun()
--[[
workspace.travelling_merchant.ChildAdded:Connect(function()
    task.wait(1)
    setupRun()
end)

while task.wait(10) do
    local timeTable = os.date("!*t", tick())
    if tostring(timeTable["min"]) == "0" then
        print("success")
        task.wait(10)
        setupRun()
    end
end
]]
