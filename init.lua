
-- docs here: https://nodemcu.readthedocs.org/en/dev/


print("\n")
print("ESP8266 Started")


compile_lua = function(luaFile)
    for i, f in ipairs(luaFile) do
        if file.open(f) then
            file.close()
            print("Compile File:"..f)
            node.compile(f)
            print("Remove File:"..f)
            -- file.remove(f)
        end
    end
end

exec_if_exists = function(lcFile)
    if file.open(lcFile) then
        dofile(lcFile)
    else
        print(lcFile .. " not exist")
    end
end


-- compile_lua("webserver.lua")
-- exec_if_exists("webserver.lc")

dofile("other_webserver.lua")

collectgarbage()
