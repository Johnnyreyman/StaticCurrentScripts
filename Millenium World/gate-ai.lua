-- get the advanced chatbox peripheral
local chatbox = peripheral.wrap("left")

-- redstone peripherals
local gate = "top"
-- define a list of phrases that will trigger Bob to open the gate
local openGatePhrases = {"open the gate", "can you let me through", "gate please"}

-- Define Bob's Responses
local response = {
  "Opening the gate now!",
  "Can do!",
  "Open Says Me!",
  "Welcome Back!",
  "Gotcha, opening the gate!"
}

-- define a function to handle incoming messages
local function handleIncomingMessage(username, message, uuid, isHidden)
  -- check if the message is directed at Bob
  if message:match("Bob") then
    -- check if the message includes a trigger phrase to open the gate
    for _, triggerPhrase in ipairs(openGatePhrases) do
      if message:match(triggerPhrase) then
        -- send a response to the user
        local random_index = math.random(1, #response)
        chatbox.sendMessageToPlayer(response[random_index], username, "Bob")
        -- trigger the redstone on top of the advanced computer to open the gate
        redstone.setOutput(gate, true)
        redstone.setOutput(gate, false)
        sleep(5)
        redstone.setOutput(gate, true)
        redstone.setOutput(gate, false)
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
