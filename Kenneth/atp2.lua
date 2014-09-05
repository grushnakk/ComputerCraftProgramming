 --[[
	Advanced Tunnel Program v2 - for computercraft 1.5
    Copyright (C) 2014  Kenneth Radunz

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

-- variables
local _args
local _length
local _return = false
local _torches = false

-- functions
local function fuelNeeded()
	local const = 5
	if _return then 
		const = 6
	end
	return (const * _length) - turtle.getFuelLevel()
end

local function refuel()
	for i=1,16 do
		if fuelNeeded() <= 0 then 
			return true
		end
		turtle.select(i)
		turtle.refuel()
	end
	return false
end 

local function advanceForward()
	while not turtle.forward() do
		turtle.dig()
	end
end

local function digUpDown()
	turtle.digDown() -- blocks can't fall down so we only need to dig once
	while turtle.detectUp() do
		turtle.digUp()
	end
end

local function digLayer()
	advanceForward()
	digUpDown()
	turtle.turnLeft()
	advanceForward()
	digUpDown()
	turtle.turnLeft()
	turtle.turnLeft()
	advanceForward()
	advanceForward()
	digUpDown()
	turtle.turnLeft()
	turtle.turnLeft()
	advanceForward()
	turtle.turnRight()
end
-- argument handling
_args = {...}
if #_args < 1 or #_args > 3 then
	print("Usage:\natp2 <length> <?return[t|f]> <?torches[t|f]>")
	return
end
_length = tonumber(_args[1])
if _args[2] == "t" then 
	_return = true
end
if _args[3] == "t" then 
	_torches = true
end

-- setup
print("checking fuel...")
if not refuel() then
	print("not enough fuel")
	return
end
-- run
for i=1,_length do
	digLayer()
end

if not _return then
	return
end

turtle.turnLeft()
turtle.turnLeft()
for i=1,_length do
	advanceForward()
end
turtle.turnLeft()
turtle.turnLeft()