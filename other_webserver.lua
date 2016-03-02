wifi.setmode(wifi.STATION)
wifi.sta.config("ADV","internet")
print(wifi.sta.getip())

led1 = 0
led2 = 1

gpio.mode(led1, gpio.OUTPUT)
gpio.write(led1, gpio.HIGH)
gpio.mode(led2, gpio.OUTPUT)
gpio.write(led2, gpio.HIGH)

srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        buf = buf.."<h1> ESP8266 Web Server</h1>";
        buf = buf.."<p>GPIO0 <a href=\"?pin1=ON\"><button>ON</button></a>&nbsp;<a href=\"?pin1=OFF\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO2 <a href=\"?pin2=ON\"><button>ON</button></a>&nbsp;<a href=\"?pin2=OFF\"><button>OFF</button></a></p>";
        local _on,_off = "",""
        if (_GET.pin1 == "ON") then
              gpio.write(led1, gpio.LOW);
        elseif (_GET.pin1 == "OFF") then
              gpio.write(led1, gpio.HIGH);
        elseif (_GET.pin2 == "ON" )then
              gpio.write(led2, gpio.LOW);
        elseif (_GET.pin2 == "OFF") then
              gpio.write(led2, gpio.HIGH);
        end
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)