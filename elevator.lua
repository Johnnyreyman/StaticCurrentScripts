-- Elevator Configuration
local FLOORS = {
    ["HEATEX"] = 1,
    ["REACTORS"] = 2,
    ["CONTROLROOM"] = 3,
}

-- Redstone peripheral names
local clutchPeripheral = "front" -- The input for the motor starting logic
local gearShiftPeripheral = "bottom" -- The output for the motor direction control
local heatExPeripheral = "left" -- Input trigger button for Heat Exchanger floor
local controlRoomPeripheral = "top" -- Input trigger button for Control Room floor
local reactorsPeripheral = "back" -- Input trigger button for Reactor Room floor

-- Reset elevator to floor 3
rs.setOutput(clutchPeripheral, false)
rs.setOutput(gearShiftPeripheral, false)
print("Elevator is reset to initial floor 3")

-- Print Previous Logs and Clear Logs
dofile("/disk/clear-logs.lua")

-- Initialize current floor to Control Room (3)
local currentFloor = FLOORS["CONTROLROOM"]

-- Function to move the elevator to a target floor
function moveToFloor(targetFloor)
    -- Check if the target floor is valid
    local floorNumber = FLOORS[targetFloor]
    if not floorNumber then
        print("Invalid floor: " .. tostring(targetFloor))
        return
    end

    -- Determine the direction of travel, Up or Down
    local direction = (floorNumber > currentFloor) and "up" or "down"

    -- Move the elevator to the target floor
    print("Elevator moving from floor " .. tostring(currentFloor) .. " to floor " .. tostring(targetFloor) .. " in direction " .. direction)

    -- Loop through each floor until the target is reached
    while currentFloor ~= floorNumber do
        rs.setOutput(clutchPeripheral, false) -- Start the elevator motor
        os.sleep(0.5)

        -- Change the direction if needed
        rs.setOutput(gearShiftPeripheral, direction == "up")

        -- Update current floor
        currentFloor = currentFloor + ((direction == "up") and 1 or -1)

        -- Wait for the elevator to arrive at the next floor
        local waiting = true
        while waiting do
            local _, message = rednet.receive(1)
            if message and message == "Elevator at " .. targetFloor then
                waiting = false
            end
        end
        
        os.sleep(1)
    end
    
    -- Stop the elevator motor
    rs.setOutput(clutchPeripheral, true)
    print("Elevator stopped at floor " .. currentFloor)

end

-- Main program loop to check for button triggers
while true do
    if rs.getInput(heatExPeripheral) then
        print("Heat Exchanger button pressed")
        print("Current floor: " .. currentFloor)
        moveToFloor("HEATEX")
    elseif rs.getInput(reactorsPeripheral) then
        print("Reactor Room button pressed")
        print("Current floor: " .. currentFloor)
        moveToFloor("REACTORS")
    elseif rs.getInput(controlRoomPeripheral) then
        print("Control Room button pressed")
        print("Current floor: " .. currentFloor)
        moveToFloor("CONTROLROOM")
    end

    -- Wait for the next loop iteration
    os.sleep(0.1)
end
