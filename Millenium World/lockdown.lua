-- This is a script to activate lockdown on the shield projector.

-- Define redstone peripherals
local projector = "back"

-- Define AP peripheral
local broadcast = peripheral.wrap('left')

broadcast.sendMessage("Synolvia Campus is currently in security lockdown. Please shelter in a secured building in 15 seconds.", "SYNOLVIACO-A&S-SYSTEM")
os.sleep(15)
-- Activate redstone output to initiate lockdown
rs.setOutput(projector, true)
broadcast.sendMessage("Synolvia Campus lockdown active.", "SYNOLVIACO-A&S-SYSTEM")

-- Wait for user input to turn off projector and exit script
io.write("Press any key to turn off the disable lockdown.")
io.read()

-- Deactivate redstone output to turn off projector
rs.setOutput(projector, false)

-- Print message indicating that script has ended
print("Lockdown disabled.")

broadcast.sendMessage("Synolvia Campus is no longer in lockdown, proceed on with your day.", "SYNOLVIACO-A&S-SYSTEM")