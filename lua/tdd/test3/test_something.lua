luaunit = require('luaunit')

require('adder')

function testAddPositive()
    luaunit.assertEquals(add(1,1),2)
end

function testAddZero()
    luaunit.assertEquals(add(1,0),0)
    luaunit.assertEquals(add(0,5),0)
    luaunit.assertEquals(add(0,0),0)
end

os.exit( luaunit.LuaUnit.run() )

