-- Set up chatbox peripheral
local chatbox = peripheral.wrap("left")

-- Create list of valid options
local options = {
    "1. Send to IvyKirkland",
    "2. Send to StaticCurrent",
    "3. Send to MarTay_607",
    "4. Broadcast Message",
    "5. Broadcast troll joinified",
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

-- Possible Phrases for Option 5
local phrases = {
    "Joinifying all entities in overworld",
    "StaticCurrent has been joinified!",
    "Lost in a Dimension where everything was Joinified!",
    "Currently struggling on top with joinification",
    "Interdimensional Trolls have gotten loose: all players joinified.",
    "Joinifying mobs in all dimensions...",
    "Something happened to IvyKirkland, joinification?",
    "Anybody know a good way to reverse joinification?",
    "For an ethic in joinification, visit Dimension JA-Special-Lab (JASL).",
    "Joinifying LIVE event, Who will be next?",
    "This game is really unjoinifiable.",
    "All Hail our new joinifiable overlords!",
    "MarTay_607 has joined the game... and now she's joinified",
    "What will happen next, are we going to joinify all players?",
    "IvyKirkland has been joinified!",
    "A wild StaticCurrent has joinified!",
    "MarTay_607 just got joinified!",
    "Hey everyone! The Nether just got joinified!",
    "A pack of wolves has just been joinified!",
    "The End is now officially joinified.",
    "Look out below! The ground beneath us has been joinified!",
    "A new day means another chance to get joinified!",
    "Did you hear? The Ender Dragon just got joinified!",
    "Beware, the zombie hoard has been joinified!",
    "Sandstone blocks have just been joinified!?",
    "What is this? StaticCurrent has joinified!?",
    "There's no stopping it now, even the iron golems are being joinified!",
    "Who knew joining forces would lead to so much joinification?",
    "As we speak, Herobrine is being joinified...",
    "Even diamond armor can't protect against being joinified!"
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
        chatbox.sendMessageToPlayer(message, "IvyKirkland", "FORTUNE TELLER")
        term.write("Message sent to IvyKirkland.\n")
        sleep(2) -- Pause to display success message
     elseif option == "2" then
        term.write("Enter Message: ")
        local message = read()
        chatbox.sendMessageToPlayer(message, "StaticCurrent", "FORTUNE TELLER")
        term.write("Message sent to StaticCurrent.\n")
        sleep(2) -- Pause to display success message
     elseif option == "3" then
        term.write("Enter Message: ")
        local message = read()
        chatbox.sendMessageToPlayer(message, "MarTay_607", "FORTUNE TELLER")
        term.write("Message sent to MarTay_607.\n")
        sleep(2) -- Pause to display success message
    elseif option == "4" then
      term.write("Message to broadcast: ")
      local message = read()
      chatbox.sendMessage(message, "FORTUNE TELLER")
      term.write("Message broadcasted to everyone.\n")
      sleep(2) -- Pause to display success message
    elseif option == "5" then
        local random_index = math.random(1, #phrases)
        chatbox.sendMessage(phrases[random_index], "FORTUNE TELLER")
        term.write("Message broadcasted to everyone.")
    elseif option == "6" then
        break -- Exit program
    else
        term.write("Invalid option.\n")
        sleep(2) -- Pause to display error message
    end
end
