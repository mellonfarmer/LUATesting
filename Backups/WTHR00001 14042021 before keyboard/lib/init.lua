
SCREEN_WIDTH = 960
SCREEN_HEIGHT = 544

--init timer
exTime = Timer.new()
cTime = Timer.getTime(exTime) --execution time

-- setup pad
cPad = Controls.read()
--Xstatus = none
padDownTime = 0
ColourWhite = Color.new(255,255,255)

weatherData = processJson(getWeatherDataByCity("Banbury"))
Wcity = weatherData.name
Wtemp = weatherData.main.temp
Whumid = weatherData.main.humidity
WwindSpeed = weatherData.wind.speed
Wdesc = weatherData.weather.description
--Wicon = getWeatherIcon(weatherData.weather.icon)

enableGrid = false

showElementBoundingBox = false