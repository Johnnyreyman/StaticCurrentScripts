-- Set up chatbox peripheral
local chatbox = peripheral.wrap("left")

-- Create list of valid options
local options = {
    "1. Send to IvyKirkland",
    "2. Send to Cyano_SG",
    "3. Send to MarTay_607",
    "4. Broadcast Message",
    "5. Exit"
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
      break -- Exit program
  else
      term.write("Invalid option.\n")
      sleep(2) -- Pause to display error message
  end
end
