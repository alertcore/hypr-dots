local wallList = {}

for item in (io.popen([[ls -pa /home/corn/wallpaper | grep -v /]]):lines()) do
  local quoteItem = '"' .. item .. '"'
  table.insert(wallList, quoteItem)
end

function updateList()

  local list = io.open("/home/corn/wallpaper/script/list.txt", "w")
    print("clearing wallpaper index")
    list:write()
  list:close()

  local list = io.open("/home/corn/wallpaper/script/list.txt", "a")
    for i,v in ipairs(wallList) do
      list:write(v .. "\n")
      print(v .. " added to wallpaper index")
    end
list:close()
end

return updateList
