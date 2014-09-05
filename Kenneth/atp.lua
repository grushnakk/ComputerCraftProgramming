local length
local tArgs
-- functions
local function getFuelNeeded()
	return (6 * length) - turtle.getFuelLevel()
end

local function refuel()
	turtle.refuel()
	local fuelNeeded = getFuelNeeded()
	while fuelNeeded > 0 do
		print("For completing the tunnel the turtle needs " ..fuelNeeded.. " more fuel units.")
		write("Please place fuel in the selected slot and press <enter> to continue.")
		read()
		turtle.refuel()
		fuelNeeded = getFuelNeeded()
	end
end

local function digLayer()
	-- clear central column
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.digDown()
	-- clear left column
	turtle.turnLeft()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.digDown()
	-- clear right column
	turtle.turnLeft()
	turtle.turnLeft()
	turtle.forward()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.digDown()
	-- move back to central position
	turtle.turnLeft()
	turtle.turnLeft()
	turtle.forward()
	turtle.turnRight()
end

local author = "Kenneth Radunz"
local version = "a1.0"
print("Advanced Tunnel Program")
print("Version " ..version)
print("Author " ..author)

-- retrieve args
tArgs = {...}
if #tArgs ~= 2 then
	print("Usage: atp.lua <length> <return[true|false]> <torches[true|false]>")
	return
end

-- check args
length = tonumber(tArgs[1])
if length < 1 or length >= 200 then
	print("Tunnel length must be between 1 and 200")
	return
end

-- refuel
refuel()

-- dig tunnel
for i=1,length do
	digLayer()
	-- TODO: place torch every 5 blocks
end

-- return
if tArgs[2] == "false" then
	return
end
turtle.turnLeft()
turtle.turnLeft()
for i=1,length do
	turtle.forward()
end
turtle.turnLeft()
turtle.turnLeft()
