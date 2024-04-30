update = require("updateList")

update()

local homeDir = os.getenv("HOME")

function randPaper()
	local file = io.open(homeDir .. "/wallpaper/script/list.txt", "r")
	totalList = {}
	for line in file:lines() do
		table.insert(totalList, line);
	end
	file:close()

  local wallpaper = totalList[math.random(1, #totalList)]
	return wallpaper
end

function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local selected = randPaper()

local last = io.open(homeDir .. "/wallpaper/script/last.txt", "r")
  local lastImageUsed = last:read("*all")
last:close()

function updateLast()
  local last = io.open(homeDir .. "/wallpaper/script/last.txt", "w")
  print("image " .. selected .. " selected, writing to memory")
    last:write(selected)
    last:close()
end

updateLast()

print("last image in memory is " .. lastImageUsed)

while selected == lastImageUsed do
  print("selected image " .. "(" .. selected .. ") deemed redundant, try again")
	selected = randPaper()
  print("test " .. selected .. " instead")
  updateLast()
end

print("selected image (" .. selected .. ") passed redundancy check, passing to swww")

os.execute("swww img " .. homeDir .. "/wallpaper/" .. selected .. " --transition-type center --transition-step 180")
