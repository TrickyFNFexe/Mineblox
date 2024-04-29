local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local function sendPlayerData()
	local playerData = {}
	for _, player in ipairs(Players:GetPlayers()) do
		local character = player.Character
		if character then
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				local data = {
					Username = player.Name,
					Coordinates = {
						X = humanoidRootPart.Position.X,
						Y = humanoidRootPart.Position.Y,
						Z = humanoidRootPart.Position.Z
					}
				}
				table.insert(playerData, data)
			end
		end
	end

	local postData = HttpService:JSONEncode(playerData)
	local url = "" -- Replace with your own endpoint URL (I aren't leaking nothing)

	local success, response = pcall(function()
		return HttpService:PostAsync(url, postData)
	end)

	if success then
		print("Data sent successfully:", response) --sent player information
	else
		warn("Failed to send data:", response) --failed to send data
	end
end

while true do
	wait(5)
	sendPlayerData()
end
