

leds_rgb = string.char(0,255,0,0,0,255,0,0,0,255) 
gpio = 1

ws2812.writergb(gpio, leds_rgb)
