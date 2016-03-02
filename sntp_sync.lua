
callback = function(sec,usec,server)
    print('sync', sec, usec, server)
end

errcallback = function()
    print('failed!')
end

local ip = '129.6.15.30'  -- from http://tf.nist.gov/tf-cgi/servers.cgi

sntp.sync(ip, callback, errcallback)

