
function printFile(filename)
     file.open(filename, "r")
     print(file.read())
     file.close()
end

printFile("init.lua")
