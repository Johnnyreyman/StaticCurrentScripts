-- Define the peripherals
local chatbox = peripheral.wrap("left")

-- Defines list of phrases to trigger lockdown.
local lockdownPhrases = {"Code Black", "under attack", "lock us down", "Renard is coming"}

-- Define a function to handle incoming messages
local function handleIncomingMessage(username, message, uuid, isHidden)
  -- Check if message to Security from authorized players
  if message:match("Security") then -- and (player == "StaticCurrent" or player == "Cyano_SG") then
    -- Check if the message includes a trigger phrase to initiate lockdown
    for _, triggerPhrase in ipairs(lockdownPhrases) do
      if message:match(triggerPhrase) then
        dofile("lockdown.lua")
        return
      end
    end
  end
end

-- main loop to handle incoming messages
while true do
  -- wait for the next chat message
  local event, username, message, uuid, isHidden = os.pullEvent("chat")
  -- handle the message if it exists
  if username and message then
    handleIncomingMessage(username, message, uuid, isHidden)
  end
end
