
task.wait(2)
repeat task.wait() until game:IsLoaded()
local player = game.Players.LocalPlayer
local http = game:GetService("HttpService")
local url = "https://discord.com/api/webhooks/1008130991191236609/DuoVIeGcc-WElKRQrchV6bWmQJ9drO2ZmZRWOG8nEEbhhGlAb_Lqs7oIkN0nE1rnQcox"

repeat task.wait() until workspace:FindFirstChild(player.Name)


if not game.PlaceId == 8304191830 then return end

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

--GUI
local screenGui = Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
local frame = Instance.new("Frame")
frame.Position = UDim2.new(0.188,0,0.187,0)
frame.Size = UDim2.new(0,542,0,424)
frame.BackgroundTransparency = 1
frame.Parent = screenGui
frame.Visible = false

getgenv().BannerMentions = "Banner-Mentions.json"

local mentions = {}

if isfile(BannerMentions) then
        mentions = readfile(BannerMentions)
        mentions = http:JSONDecode(mentions)
        print(mentions)
    else
        local tempData = http:JSONEncode(mentions)
        writefile(BannerMentions,tempData)
end


local openButton = Instance.new("TextButton")
openButton.Position = UDim2.new(0.846,0,0.794,0)
openButton.Size = UDim2.new(0.095,0,0.129,0)
openButton.Text = "Open Gui"
openButton.TextScaled = true
openButton.BackgroundColor3 = Color3.fromRGB(98,98,98)
openButton.Parent = screenGui

local sideBar = Instance.new("Frame")
sideBar.BackgroundColor3 = Color3.fromRGB(44,44,44)
sideBar.Position = UDim2.new(-0.048,0,0,0)
sideBar.Size = UDim2.new(0,101,0,403)
sideBar.Parent = frame

local Bannerbutton = Instance.new("TextButton")
Bannerbutton.Position = UDim2.new(.156,0,0.08,0)
Bannerbutton.Size = UDim2.new(0,70,0,64)
Bannerbutton.BackgroundColor3 = Color3.fromRGB(89,89,89)
Bannerbutton.Text = "Banner"
Bannerbutton.ZIndex = 5

local bannerButtonCorner = Instance.new("UICorner")
bannerButtonCorner.Parent = Bannerbutton
Bannerbutton.Parent = sideBar

local bannerFrame = Instance.new("Frame")
bannerFrame.BackgroundColor3 = Color3.fromRGB(68,68,68)
bannerFrame.Position = UDim2.new(0.139,0,0.038,0)
bannerFrame.Size = UDim2.new(0,466,0,387)
bannerFrame.Parent = frame

local title = Instance.new("TextLabel")
title.Position = UDim2.new(-0.048,0,0,0)
title.Size = UDim2.new(0,568,0,19)
title.BackgroundColor3 = Color3.fromRGB(44,44,44)
title.Text = "Lok's Special"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(150,150,150)
title.Parent = frame

local exitButton = Instance.new("TextButton")
exitButton.Position = UDim2.new(1,0,0,0)
exitButton.Size = UDim2.new(0,24,0,19)
exitButton.BackgroundColor3 = Color3.fromRGB(148,148,148)
exitButton.Text = "X"
exitButton.TextColor3 = Color3.fromRGB(0,0,0)
exitButton.TextScaled = true
exitButton.Parent = frame

local bannerScrollingFrame = Instance.new("ScrollingFrame")
bannerScrollingFrame.BackgroundColor3 =Color3.fromRGB(108,108,108)
bannerScrollingFrame.Position = UDim2.new(0.16,0,.262,0)
bannerScrollingFrame.Size = UDim2.new(0,405,0,266)
bannerScrollingFrame.Name = "Banner"
bannerScrollingFrame.Parent = frame

local textboxID = Instance.new("TextBox")
textboxID.BackgroundColor3 = Color3.fromRGB(111,111,111)
textboxID.Position = UDim2.new(0.463,0,0.13,0)
textboxID.Size = UDim2.new(0.253,0,0.095,0)
textboxID.PlaceholderColor3 = Color3.fromRGB(0,0,0)
textboxID.PlaceholderText = "Discord UserId"
textboxID.Text = ""
textboxID.Parent = bannerFrame

local textboxName = Instance.new("TextBox")
textboxName.BackgroundColor3 = Color3.fromRGB(111,111,111)
textboxName.Position = UDim2.new(0.463,0,0.03,0)
textboxName.Size = UDim2.new(0.253,0,0.095,0)
textboxName.PlaceholderColor3 = Color3.fromRGB(0,0,0)
textboxName.PlaceholderText = "Username"
textboxName.Text = ""
textboxName.Parent = bannerFrame

local addBox = Instance.new("TextButton")
addBox.BackgroundColor3 = Color3.fromRGB(111,111,111)
addBox.Position = UDim2.new(0.739,0,0.082,0)
addBox.Size = UDim2.new(0.19,0,0.101,0)
addBox.TextScaled = true
addBox.Text = "Add"
addBox.Parent = bannerFrame

local bannerSelected = Instance.new("TextBox")
bannerSelected.Size = UDim2.new(0.339,0,0.095,0)
bannerSelected.Position = UDim2.new(0.048,0,0.083,0)
bannerSelected.Text = ""
bannerSelected.PlaceholderText = "Item/Unit Name"
bannerSelected.PlaceholderColor3 = Color3.fromRGB(0,0,0)
bannerSelected.Parent = bannerFrame

exitButton.MouseButton1Down:Connect(function()
	toggleGui()
end)

openButton.MouseButton1Down:Connect(function()
	toggleGui()
end)

local curDrop = false

function createDropDownScroll(parent,size,position,newSize,canvasSize)
	local gui = Instance.new("ScrollingFrame")
	gui.Parent = parent
	gui.Position = position
	gui.Size = size
	gui.CanvasSize = canvasSize
	gui.MouseEnter:Connect(function()
		if curDrop == true then return end
		curDrop = true
		gui.Size = newSize
		gui.ZIndex = 20
		for i,v in pairs(gui:GetChildren()) do
			v.ZIndex = 100
		end
	end)

	gui.MouseLeave:Connect(function()
		gui.Size = size
		curDrop = false
		gui.CanvasPosition = Vector2.new(0,0)
		gui.ZIndex = 5
		for i,v in pairs(gui:GetChildren()) do
			v.ZIndex = 5
		end
	end)
	return gui
end

function toggleGui()
	if openButton.Visible == false then
		frame.Visible = false
		openButton.Visible = true
	else
		frame.Visible = true
		openButton.Visible = false
	end
end

function adjustBannerPing(name)
	local GUI = bannerScrollingFrame[name]["Drop"]
	if #GUI:GetChildren() == 0 then
		bannerScrollingFrame[name]:Destroy()
		adjustAllPings()
	end
	for i,v in pairs(GUI:GetChildren()) do
		v.Position = UDim2.new(0,0,0,40*(i-1))
	end
end

function adjustAllPings()
	local GUI = bannerScrollingFrame:GetChildren()
	for i,v in pairs(GUI) do
		local yPos = 10 + (70 * (i-1))
		v.Position = UDim2.new(0.045,0,0,yPos)
	end
end

function addElement(newElement,name)
	local drop = bannerScrollingFrame[name]["Drop"]
	local num = #drop:GetChildren()
	local button = Instance.new("TextButton")
	button.BackgroundColor3 = Color3.fromRGB(113,113,113)
	button.Size = UDim2.new(0,160,0,40)
	button.ZIndex = 5
	button.Text = newElement["User"]
	button.Parent = drop
	button.MouseButton1Down:Connect(function()
		for i,v in pairs(mentions[name])do
			if v == newElement then
				table.remove(mentions[name],i)
			end
		end
		button:Destroy()
		adjustBannerPing(name)
		local data = http:JSONEncode(mentions)
		writefile(BannerMentions,data)
	end)
end

function addBannerPings(name)
	local nameLabel = Instance.new("TextLabel")
	nameLabel.BackgroundColor3 = Color3.fromRGB(68,68,68)
	nameLabel.Size = UDim2.new(0.34,0,0.05,0)
	nameLabel.Parent = bannerScrollingFrame
	nameLabel.Text = name
	nameLabel.Name = name
	nameLabel.TextColor3 = Color3.fromRGB(0,0,0)
	
	local drop = createDropDownScroll(nameLabel,UDim2.new(1.256,0,1,0),UDim2.new(1.226,0,0,0),UDim2.new(1.256,0,3,0),UDim2.new(0,0,5,0))
	drop.Name = "Drop"
	
	for i,v in pairs(mentions[name])do
		addElement(v,name)
	end
	
	adjustBannerPing(name)
	adjustAllPings()
end

for i,v in pairs (mentions) do
	if v == {} then continue end
	addBannerPings(i)
end

addBox.MouseButton1Down:Connect(function()
	if tonumber(textboxID.Text) == nil then
		textboxID.TextEditable = false
		textboxID.Text = "Dev ID"
		wait(1)
		textboxID.Text = ""
		textboxID.TextEditable = true
		return
	end
	
	if bannerSelected.Text ~= nil then
		local data = {User = textboxName.Text, Id = textboxID.Text}
		if mentions[bannerSelected.Text] == nil then
			mentions[bannerSelected.Text] = {}
		end
		table.insert(mentions[bannerSelected.Text],data)
		if not bannerScrollingFrame:FindFirstChild(bannerSelected.Text) then
			addBannerPings(bannerSelected.Text)
		else
			addElement(data,bannerSelected.Text)
		end
		adjustBannerPing(bannerSelected.Text)
		local data = http:JSONEncode(mentions)
		writefile(BannerMentions,data)
	end
end)

--[[
function addItem(name,Gui)
	local button = Instance.new("TextButton")
	button.BackgroundColor3 = Color3.fromRGB(163,163,163)
	button.Size = UDim2.new(0,160,0,40)
	button.ZIndex = 5
	button.Text = name
	button.Parent = Gui
	button.MouseButton1Down:Connect(function()
		if bannerSelected ~= nil then
			bannerSelected.BackgroundColor3 = Color3.fromRGB(163,163,163)
		end
		bannerSelected = button
		bannerSelected.BackgroundColor3 = Color3.fromRGB(90,90,90)
	end)
end
local itemsScroll = createDropDownScroll(bannerFrame,UDim2.new(0.339,0,0.095,0),UDim2.new(0.048,0,0.083,0),UDim2.new(0.339,0,1,0),UDim2.new(0,0,5,0))


for i,v in pairs(game.ReplicatedStorage.packages.assets.ItemModels:GetChildren()) do
	local name = fancy(v.Name)
	mentions[name] = {}
	addItem(name,itemsScroll,i)
end

function itemsAdjust()
	local pos = 0
	if bannerSelected then
		bannerSelected.Position = UDim2.new(0,0,0,0)
		pos+=1
	end
	for i,v in pairs(itemsScroll:GetChildren()) do
		if bannerSelected ~= nil and v.Text == bannerSelected.Text then continue end
		local posY = 40*(pos)
		pos += 1
		v.Position = UDim2.new(0,0,0,posY)
	end
end

function bannerPingAdjust(scroll)
	
end

itemsScroll.MouseLeave:Connect(function()
	itemsAdjust()
end)

itemsAdjust()
]]

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
        ["content"] = mentionString,
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
            
    local mentionPeople = {}
    
    for i,v in pairs(mentions) do
        if mythicName == i or legendaryName == i then
            for p,q in pairs(mentions[i]) do
                table.insert(mentionPeople,q["Id"])
            end
        end
    end
    
    
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
                for l,n in pairs(mentions) do
                    if l == renamed then
                        for p,q in pairs(mentions[l])do
                            table.insert(mentionPeople,q["Id"])
                        end
                    end
                end
            end
        end
    end
    
    local mentionString = ""
    for i,v in pairs(mentionPeople) do
        mentionString = mentionString.."<@"..v.."> "
    end
    data["content"] = mentionString
    
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
    
    if (curTime == "0" and timeTable["min"] > 30) then
        local data = http:JSONEncode(30)
        writefile(BannerBot,data)
        local succ,err = pcall(function() run() end)
        if err then
            warn(err)
        end
    elseif (curTime == "30" and timeTable["min"] < 30)  then
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
