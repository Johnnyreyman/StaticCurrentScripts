while true do
-- Get the redstone inputs
local frontInput = redstone.getInput("front")
local rightInput = redstone.getInput("right")

-- Calculate the output
local output = frontInput and rightInput

-- Set the output
redstone.setOutput("back", output)
os.sleep(0.1)
end