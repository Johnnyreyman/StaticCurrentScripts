print("Welcome to the Battle Lab! Currently in beta!")
print("Be careful with testing mobs!")

-- Define redstone switches
local spawnerSwitch = "top"
local zombies = "right"
local blazes = "left"
local piglins = "back"
local pillagers = "bottom"
local wardens = "front"

-- Define menu options
local menuOptions = {
  {label = "Toggle Spawners", fn = function() 
      rs.setOutput(spawnerSwitch, not rs.getOutput(spawnerSwitch))
      print("Spawner state:", rs.getOutput(spawnerSwitch) and "On" or "Off")
    end},
  {label = "Release Zombies", fn = function() 
      rs.setOutput(zombies, not rs.getOutput(zombies))
      print("Zombies:", rs.getOutput(zombies) and "Open" or "Closed")
    end},
	{label = "Release Blazes", fn = function() 
      rs.setOutput(blazes, not rs.getOutput(blazes))
      print("Blazes:", rs.getOutput(blazes) and "Open" or "Closed")
    end},
	{label = "Release Piglins", fn = function() 
      rs.setOutput(piglins, not rs.getOutput(piglins))
      print("Piglins:", rs.getOutput(piglins) and "Open" or "Closed")
    end},
	{label = "Release All Hell", fn = function() 
      rs.setOutput(pillagers, not rs.getOutput(pillagers))
      print("All Hell:", rs.getOutput(pillagers) and "Open" or "Closed")
    end},
	{label = "Release Warden", fn = function() 
      rs.setOutput(wardens, not rs.getOutput(wardens))
      print("Warden:", rs.getOutput(wardens) and "Open" or "Closed")
    end},
  {label = "Exit", fn = function() running = false end},
}

-- Run menu
local running = true
while running do
  -- Print menu
  term.clear()
  print("===== Battle Lab Control Panel =====")
  for i, option in ipairs(menuOptions) do
    print(i .. ") " .. option.label)
  end
  
  -- Get user input
  local choice = tonumber(read())
  if choice and menuOptions[choice] then
    -- Execute user choice
    menuOptions[choice].fn()
-- Show status message
    print("\nPress any key to continue.")
    os.pullEvent("key")
    if choice == 7 then
      running = false
    end
  else
    term.clear()
    print("Invalid choice. Please try again.")
    print("Press any key to continue...")
    os.pullEvent("key")
  end
end

print("Exiting Battle Lab Control Panel...")
