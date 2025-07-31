print("Hello world, from client!")

local function getInventory()
    return game.Players.LocalPlayer.Character:WaitForChild("Inventory").Value
end

local function getAmount()
    return game.Players.LocalPlayer.Character:WaitForChild("Cash").Value
end

local function countCommand(amount, inventory)
    print("Your inventory is: " .. inventory)
    propCash(amount)
    print("Your cash is: " .. amount)
end

local function dropCommand(amount)
    print("You dropped: " .. amount)
    propCash(drop, amount)
end

game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:Connect(function(player, message)
    if message:sub(1, 6) == "/count" then
        local amount = tonumber(message:sub(8))
        if amount then
            countCommand(amount, getInventory())
        end
    elseif message:sub(1, 5) == "/drop" then
        local amount = tonumber(message:sub(7))
        if amount then
            dropCommand(amount)
        end
    end
end)
