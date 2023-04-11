-- Set up chatbox peripheral
local chatbox = peripheral.wrap("left")

-- Create list of valid options
local options = {
  "1. Send to IvyKirkland",
  "2. Send to Cyano_SG",
  "3. Send to MarTay_607",
  "4. Broadcast Message",
  "5. Broadcast MineRoast",
  "6. Exit"
}

-- Display menu of options
function displayMenu()
  term.clear()
  term.setCursorPos(1,1)
  print("Select an option:")
  for i=1,#options do
      print(options[i])
  end
end

local jokes = {
  "Why did the creeper cross the road? To blow up StaticCurrent's house on the other side.",
  "Why did the zombie refuse to attack StaticCurrent? He heard he was already dead.",
  "What do you call a group of Minecraft players who refuse to use mods? Vanilla ice cream lovers.",
  "Why did the Enderman refuse to teleport away with Cyano? He heard he was too heavy.",
  "Why did the Ghast refuse to attack IvyKirkland? Because her builds are out of this world.",
  "What's the best way to avoid a Creeper explosion? Stand behind IvyKirkland, she'll protect you with her shield.",
  "Why did the Ghast refuse to attack Cyano? Because he found him too scary to face.",
  "What's the easiest way to defeat a horde of zombies? Ask StaticCurrent, he has plenty of experience.",
  "What do you call a group of Minecraft players who only build secret bases? The Undercover Squad.",
  "What do you call a group of Minecraft players who never stops building? An architect."
}
  


 local staticCurrentList = {
  "Remember God made you special and StaticCurrent by creepers shall be blown up.",
  "What was that noise?! Just Static being killed by another creeper.",
  "StaticCurrent's house burns down from lightning. Ever heard of copper?",
  "Static goes fishin and gets a salmon. Cyano goes fishing in Minecraft and gets a boot.",
  "StaticCurrent cannot read a map. Usual.",
  "StaticCurrent just can't help but die by creepers.",
  "Why did the creeper cross the road? To blow up StaticCurrent's house on the other side.",
  "Why did StaticCurrent stop using TNT? Because he realized it wasn't worth rebuilding his house every time it exploded.",
  "Why did the zombie refuse to attack StaticCurrent? He heard he was already dead.",
  "Why did the Ghast refuse to attack StaticCurrent? He heard he was already scared enough.",
  "Why did the piglin refuse to trade with StaticCurrent? He had nothing to offer.",
  "Why did the Ghast refuse to attack StaticCurrent? He heard he was already scared enough.",
  "What's the easiest way to defeat a horde of zombies? Ask StaticCurrent, he has plenty of experience."
}

-- List of phrases related to Cyano

 local cyanoList = {
  "Cyano without his creative is like Trump once said, SAD.",
  "Cyano_SG is a horror to Smokey the Bear. Remember kids, only you can start forest fires!",
  "Don't waste diamonds on hoes, they're not worth it unless you're into that kind of thing.",
  "Cyano is so attractive that everyone wants a kiss, especially the creepers!",
  "Static goes fishin and gets a salmon. Cyano goes fishing in Minecraft and gets a boot.",
  "Shields are like chastity belts, they keep the creepers out.",
  "Don't build buildings with tnt traps that look good. Cyano will light the fireplace and blow it up!",
  "Ivy and MarTay follow quest lines. Static and Cyano, 'What is this sorcery?'",
  "MarTay607 makes Secret Room! Cyano closed the door.",
  "If at first you don't succeed, call Cyano for creative mode.",
  "What do you call a group of Minecraft players who refuse to use mods? Vanilla ice cream lovers.",
  "What do you call a group of Minecraft players who only build secret bases? The Undercover Squad.",
  "Why did the skeleton invite Cyano to a party? He heard he was great at dancing (in real life).",
  "Why did the Enderman refuse to teleport away with Cyano? He heard he was too heavy.",
  "What's the difference between Cyano and a diamond pickaxe? Cyano is much sharper.",
  "Why did the Ghast refuse to attack Cyano? Because he found him too scary to face."
}

-- List of phrases related to IvyKirkland

local ivyKirklandList = {
  "IvyKirkland - Builds 50th iteration of Castle for the second time!",
  "When in doubt, dig straight down like IvyKirkland.",
  "Why did the Ghast refuse to attack IvyKirkland? Because her builds are out of this world.",
  "What do you call a group of Minecraft players who never stops building? An architect.",
  "What's the best way to avoid a Creeper explosion? Stand behind IvyKirkland, she'll protect you with her shield.",
  "How many Creeper explosions does it take to destroy IvyKirkland's latest build? Just one, unfortunately."
}

 local martayList = {
  "MarTay607 got lost again. Don't worry, he'll find his way back eventually.",
  "Ivy and MarTay follow quest lines. Static and Cyano, 'What is this sorcery?'",
  "Why did the Enderman refuse to teleport away with MarTay? He heard he was too heavy.",
  "What's the difference between MarTay and a redstone circuit? One of them works consistently.",
  "Why did the Ghast refuse to attack MarTay? Because he found him too charming to harm.",
  "Why did the piglin refuse to trade with MarTay? He had nothing to offer.",
  "Why did the skeleton invite MarTay to a party? He heard he was great at making music.",
  "MarTay607 makes Secret Room! Cyano closed the door.",
  "What do you call a group of Minecraft players who love to explore? The Adventurers' Guild.",
}

local mineRoastTriggers = "roast"
local jokeTrigger = "tell me a joke"

-- define a function to handle STATIC Roasts
local function handleIncomingMessage(username, message, uuid, isHidden)
  -- check if the message is directed at Bob
  if message:match("Infomaniac") and message:match("Static") then
    -- check if the message includes a trigger phrase to open the gate
    if message:match(mineRoastTriggers) then
        -- send a response to the user
        local random_index = math.random(1, #staticCurrentList)
        chatbox.sendMessage(staticCurrentList[random_index], "INFOMANIAC")
    end
  end
end

-- define a function to handle Ivy Roasts
local function handleIncomingMessage(username, message, uuid, isHidden)
  -- check if the message is directed at Bob
  if message:match("Infomaniac") and message:match("Ivy") then
    -- check if the message includes a trigger phrase to open the gate
    if message:match(mineRoastTriggers) then
        -- send a response to the user
        local random_index = math.random(1, #ivyKirklandList)
        chatbox.sendMessage(ivyKirklandList[random_index], "INFOMANIAC")
    end
  end
end

-- define a function to handle Cyano Roasts
local function handleIncomingMessage(username, message, uuid, isHidden)
  -- check if the message is directed at Bob
  if message:match("Infomaniac") and message:match("Cyano") then
    -- check if the message includes a trigger phrase to open the gate
    if message:match(mineRoastTriggers) then
        -- send a response to the user
        local random_index = math.random(1, #cyanoList)
        chatbox.sendMessage(cyanoList[random_index], "INFOMANIAC")
    end
  end
end

-- define a function to handle MarTay Roasts
local function handleIncomingMessage(username, message, uuid, isHidden)
  -- check if the message is directed at Bob
  if message:match("Infomaniac") and message:match("MarTay") then
    -- check if the message includes a trigger phrase to open the gate
    if message:match(mineRoastTriggers) then
        -- send a response to the user
        local random_index = math.random(1, #martayList)
        chatbox.sendMessage(martayList[random_index], "INFOMANIAC")
    end
  end
end

-- define a function to handle Jokes
local function handleIncomingMessage(username, message, uuid, isHidden)
  -- check if the message is directed at Bob
  if message:match("Infomaniac") then
    -- check if the message includes a trigger phrase to open the gate
    if message:match(jokeTrigger) then
        -- send a response to the user
        local random_index = math.random(1, #jokes)
        chatbox.sendMessageToPlayer(jokes[random_index], username, "INFOMANIAC")
    end
  end
end



-- Main program loop
while true do
   -- wait for the next chat message
   local event, username, message, uuid, isHidden = os.pullEvent("chat")
   -- handle the message if it exists
   if username and message then
     handleIncomingMessage(username, message, uuid, isHidden)
   end
  -- Display menu and get user input
  displayMenu()
  local option = read()

  -- Handle user's choice
  if option == "1" then
      term.write("Enter Message: ")
      local message = read()
      chatbox.sendMessageToPlayer(message, "IvyKirkland", "INFOMANIAC")
      term.write("Message sent to IvyKirkland.\n")
      sleep(2) -- Pause to display success message
  elseif option == "2" then
      term.write("Enter Message: ")
      local message = read()
      chatbox.sendMessageToPlayer(message, "Cyano_SG", "INFOMANIAC")
      term.write("Message sent to Cyano_SG.\n")
      sleep(2) -- Pause to display success message
  elseif option == "3" then
      term.write("Enter Message: ")
      local message = read()
      chatbox.sendMessageToPlayer(message, "MarTay_607", "INFOMANIAC")
      term.write("Message sent to MarTay_607.\n")
      sleep(2) -- Pause to display success message
  elseif option == "4" then
      term.write("Message to broadcast: ")
      local message = read()
      chatbox.sendMessage(message, "INFOMANIAC")
      term.write("Message broadcasted to everyone.\n")
      sleep(2) -- Pause to display success message
  elseif option == "5" then
      local random_index = math.random(1, #phrases)
      chatbox.sendMessage(phrases[random_index], "INFOMANIAC")
      term.write("Message broadcasted to everyone.")
  elseif option == "6" then
      break -- Exit program
  else
      term.write("Invalid option.\n")
      sleep(2) -- Pause to display error message
  end
end
