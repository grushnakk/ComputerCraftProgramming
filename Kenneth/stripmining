local turtleUtils = {}
turtleUtils.TORCH_ID = 50
-- returns true if the current slot contains items the turtle can use as fuel
turtleUtils.isValidFuel = function()
	return turtle.refuel(0)
end

-- searches the turtle inventory for fuel trying to reach the specified level
-- true if level reached, false otherwise
turtleUtils.refuel = function(_fuelLevelNeeded)
	for i=1,16 do
		if turtle.getFuelLevel() >= _fuelLevelNeeded then
			return true
		end
		turtle.select(i)
		if turtleUtils.isValidFuel() then
			turtle.refuel()
		end
	end
	return false
end

turtleUtils.advanceForward = function()
	while not turtle.forward() do
		turtle.dig()
	end
end

turtleUtils.clearUpDown = function() 
	turtle.digDown() -- blocks can't fall down so we only need to dig once
	while turtle.detectUp() do
		turtle.digUp()
	end
end

-- clears the 1x3 column infront of the turtle, with the turtle being on the middle block.
-- the turtle will reposition to the front column
turtleUtils.clearColumn = function()
	turtleUtils.advanceForward()
	turtleUtils.clearUpDown()
end

-- probably not happening too soon
--[[
turtleUtils.selectTorchSlot = function()
	for i=1,16 do
		turtle.select(i)
		if(
	end
end

turtleUtils.placeTorchDown = function() 
	
end
--]]
-- ---------------------------------------------
-- % SCRIPT START                              %
-- ---------------------------------------------

local _args = {...}
local _length
local _tunnels
if #_args ~= 2 then
	print("Usage stripmining <length> <tunnels>")
	return
end
_length = tonumber(_args[1])
_tunnels = tonumber(_args[2])

local fuelNeeded = (3*_tunnels)+(_tunnels*(_length-1)*2)
print("current fuel level: "..turtle.getFuelLevel())
print("fuel needed: "..fuelNeeded)
print("refueling...")
local refuelSuccess = turtleUtils.refuel(fuelNeeded)
print("new fuel level: "..turtle.getFuelLevel())
if not refuelSuccess then
	return
end
print("stipmining...")
for tunnel=1,_tunnels do
	for _=1,3 do
		turtleUtils.clearColumn()
	end
	turtle.turnRight()
	for _=1,_length-1 do
		turtleUtils.clearColumn()
	end
	turtle.turnRight()
	turtle.turnRight()
	for _=1,_length-1 do
		turtleUtils.advanceForward()
	end
	turtle.turnRight()
end
print("fuel Level: "..turtle.getFuelLevel())
