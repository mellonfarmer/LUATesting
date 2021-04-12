function getWeatherDataByCity(city,apiKey)
	apiKey =  apiKey or "d24a2c80e059e356229563f3792b6265"
	Network.init()
	result = Network.requestString("api.openweathermap.org/data/2.5/weather?q="..city.."&appid="..apiKey.."&units=metric")
	Network.term()
	return result
end


function getWeatherIcon(iconCode)
	localPath = "app0:/assets/"
	Network.init()
	result = Network.downloadFile("http://openweathermap.org/img/wn/"..iconCode.."@2x.png",localPath..iconCode..".png")
	Network.term()
	graphic = Graphics.loadImage(result)
	System.deleteFile(localPath..iconCode..".png")
	return graphic
end
