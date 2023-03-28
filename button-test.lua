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

-- Test function for heat exchanger button
function testHeatExButton()
    rs.setOutput(clutchPeripheral, true) -- Stop elevator motor
    local originalFloor = currentFloor
    rs.setBundledOutput("back", colors.lightGray) -- Set output to light gray
    rs.setBundledInput(heatExPeripheral, colors.red) -- Press heat exchanger button
    os.sleep(1) -- wait 1 second for elevator to move
    assert(currentFloor == FLOORS.HEATEX, "Failed to reach Heat Exchanger Floor") -- Ensure that we have reached floor 1 (HEATEX)
    rs.setBundledOutput("back", 0) -- Clear output
    os.sleep(1) -- Wait one second before moving back
    moveToFloor(originalFloor) -- Move back to starting floor
end
