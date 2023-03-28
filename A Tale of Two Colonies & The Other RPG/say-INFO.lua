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

local phrases = {
  "Remember God made you special and StaticCurrent by creepers shall be blown up.",
  "What was that noise?! Just Static being killed by another creeper.",
  "MarTay607 angered the whole population of piglins, will she make the whole nether mad?",
  "Cyano without his creative is like Trump once said, SAD.",
  "IvyKirkland - Builds 50th iteration of Castle for the second time!",
  "Cyano is so attractive that everyone wants a kiss, especially the creepers!",
  "StaticCurrent's house burns down from lightning. Ever heard of copper?",
  "MarTay607 battles cute wilden beast and looses. What aren't they cuddly doggos?",
  "Will StaticCurrent ever hope to discover how to make missiles for revenge on creepers? Nah.",
  "Gold is necessary to live in the nether, take some and the piglins shall respect your authorata!",
  "When in doubt, dig straight down like IvyKirkland.",
  "Bring a bed to the nether and sleep on it. I dare you.",
  "Cyano_SG is a horror to Smokey the Bear. Remember kids, only you can start forest fires!",
  "Remember water buckets save hearts, or bunny slippers.",
  "Don't waste diamonds on hoes, they're not worth it unless you're into that kind of thing.",
  "Shields are like chastity belts, they keep the creepers out.",
  "Static goes fishin and gets a salmon. Cyano goes fishing in Minecraft and gets a boot.",
  "StaticCurrent cannot read a map. Usual.",
  "Don't build buildings with tnt traps that look good. Cyano will light the fireplace and blow it up!",
  "Ivy and MarTay follow quest lines. Static and Cyano, 'What is this sorcery?'",
  "MarTay607 makes Secret Room! Cyano closed the door.",
  "StaticCurrent just can't help but die by creepers.",
  "Why did the creeper cross the road? To blow up StaticCurrent's house on the other side.",
  "If at first you don't succeed, call Cyano for creative mode.",
  "What do you get when you put IvyKirkland and MarTay607 in a room together? A castle-building competition.",
  "Why did the piglin refuse to trade with MarTay? Because he had no gold and a bad attitude.",
  "What's the difference between StaticCurrent and a diamond pickaxe? The pickaxe is more durable.",
  "Why did MarTay607 lose the battle against the wilden beast? She was too busy trying to pet it.",
  "How many Creeper explosions does it take to destroy IvyKirkland's latest build? Just one, unfortunately.",
  "Why did the Ender Dragon refuse to attack Cyano? Because he found him too scary to face.",
  "What do you call a group of Minecraft players who refuse to use mods? Vanilla ice cream lovers.",
  "What's the easiest way to defeat a horde of zombies? Ask StaticCurrent, he has plenty of experience.",
  "What do Minecraft players do after a long day of mining? They go to bedrock.",
  "Why did the chicken cross the road in Minecraft? To escape the player chasing it with a sword.",
  "Why did the Ghast refuse to attack IvyKirkland? Because her builds are out of this world.",
  "What's the difference between MarTay607 and a beacon? The beacon shines brighter.",
  "Why did StaticCurrent stop using TNT? Because he realized it wasn't worth rebuilding his house every time it exploded.",
  "What do you call a group of Minecraft players who only build secret bases? The Undercover Squad.",
  "Why did the skeleton invite Cyano to a party? He heard he was great at dancing (in real life).",
  "What's the best way to avoid a Creeper explosion? Stand behind IvyKirkland, she'll protect you with her shield.",
  "Why did MarTay607 refuse to enter the Nether? She heard it was too hot for her liking.",
  "What do you call a Minecraft player who never dies? A legend, and definitely not StaticCurrent.",
  "How many hearts does IvyKirkland have? Trick question - she doesn't need them because she's already immortal!"
}

-- Main program loop
while true do
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