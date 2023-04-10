-- get the advanced chatbox peripheral
local chatbox = peripheral.wrap("left")

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
local function handleIncomingMessage(sender, message)
  -- check if the message is directed at Bob
  if message:match("Bob") then
    -- check if the message includes a trigger phrase to open the gate
    for _, triggerPhrase in ipairs(openGatePhrases) do
      if message:match(triggerPhrase) then
        -- send a response to the user
        local random_index = math.random(1, #response)
        chatbox.say(phrases[random_index], "Bob")
        -- trigger the redstone on top of the advanced computer to open the gate
        redstone.setOutput("top", true)
        redstone.setOutput("top", false)
        sleep(5)
        redstone.setOutput("top", true)
        redstone.setOutput("top", false)
        return
      end
    end
  end
end

-- main loop to handle incoming messages
while true do
  -- get the next incoming message
  local sender, message = chatbox.getMessage()
  -- handle the message if it exists
  if sender and message then
    handleIncomingMessage(sender, message)
  end
end
