-- Auto interact with doors that have 'Trick or Treat' above the interaction button

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function onCharacterAdded(newCharacter)
    character = newCharacter
end

player.CharacterAdded:Connect(onCharacterAdded)

local function interactWithDoors()
    for _, door in ipairs(workspace:GetDescendants()) do
        if door:IsA("Model") and door:FindFirstChild("Interaction") then
            local interaction = door.Interaction
            local textLabel = interaction:FindFirstChildOfClass("TextLabel")
            
            if textLabel and textLabel.Text:find("Trick or Treat") then
                fireclickdetector(interaction.ClickDetector)
            end
        end
    end
end

-- Run the interaction function periodically
while true do
    interactWithDoors()
    wait(1) -- Check every second
end