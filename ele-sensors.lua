-- Defining Peripherals
local HEATEX = "left"
local REACTORS = "right"
local CONTROLROOM = "top"

-- Send Message for inputs to Elevator Computer
while true do
    -- Check floor stops
    if rs.getInput(HEATEX)
        rednet.send(12, "Elevator at HEATEX")
        print("Elevator is at floor: Heat Exchanger")
    elseif rs.getInput(REACTORS)
        rednet.send(12,"Elevator at REACTORS")
        print("Elevator is at floor: Reactors Room")
    elseif rs.getInput(CONTROLROOM)
        rednet.send(12, "Elevator at CONTROLROOM")
        print("Elevator is at floor: Control Room")
    end
    -- Wait for next iteration
    os.sleep(0.1)
end