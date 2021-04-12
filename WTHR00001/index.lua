
local df = dofile
function loadlib(str)
	df("app0:/lib/" .. str .. ".lua")
end

loadlib("loadAssets")
loadlib("webRequest")
loadlib("processJson")

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
function drawGrid(size,color)
	--Graphics.drawLine(10, 25, 100, 250, Color.new(25, 200, 120))
	--debug gride for placing elements
	--size 32 and 64
	size = size or 32
	color = color or Color.new(65, 65, 65)

	--too tired to work out maths
	amount = SCREEN_WIDTH /size

	for g = 0,amount do
		Graphics.drawLine(g*amount, , 100, 250, Color.new(25, 200, 120))
	end

end


function printfontStyled(x,y,size,text,font,color)
	size=size or 40
	font = font or fntRoboto

	Font.setPixelSizes(font,size)
	Font.print(font,x,y,text,color)
end


function drawRect(x,xs,y,ys,color,DEBUG)
	--half area add origin -center

	local xs = xs + x

	local ys = ys + y
	local dbgy = (ys)+10

	local DEBUG = DEBUG or false

	if DEBUG == true then
		Graphics.debugPrint(x,dbgy,"x: "..x.." xs: "..xs.." y: "..y.." xy: "..ys, ColourWhite)
	end
	Graphics.fillRect(x, xs, y, ys, color)
end



function update()
	pTime = cTime --previous time
	cTime = Timer.getTime(exTime) --current time
	dTime = cTime - pTime -- delta time
end

function draw()
	Graphics.initBlend()
	Screen.clear()
	drawRect(0,  SCREEN_WIDTH, 0, 60, Color.new(0, 100, 0),true)
	Graphics.drawImage(0,0,imgBackground)

	drawRect(0, SCREEN_WIDTH, 60, 60, Color.new(0, 0, 100),true)
	Graphics.drawImage(20,16,imgBurger)
	Graphics.drawImage(859,16,imgSearch)
	Graphics.drawImage(927,16,imgDots)
	--City 370,60
	printfontStyled(370,60,40,Wcity,fntFredoka,ColourWhite)

	--debug rectangles
	drawRect(60,  240, 120, 240, Color.new(255, 0, 0))
	drawRect(360, 240, 120, 240, Color.new(255, 0, 0))
	drawRect(660, 240, 120, 240, Color.new(255, 0, 0))


	--weather icon
	--Graphics.drawScaleImage(25,90,Wicon,8,8)



	--temp
	Font.setPixelSizes(fntRoboto,52)
	Font.print(fntRoboto,427,165,Wtemp.."C",ColourWhite)
	--humidity
	Font.setPixelSizes(fntRoboto,15)
	Font.print(fntRoboto,490,328,Whumid.."%",ColourWhite)
	--description
	printfontStyled(70,380,42,Wdesc,fntFredoka,ColourWhite)
	--Font.setPixelSizes(fntRoboto,40)
	--Font.print(fntRoboto,70,380,Wdesc,ColourWhite)

    --add wind

	--Graphics.debugPrint(0,0,Timer.getTime(exTime), ColourWhite)
	Graphics.termBlend()
	Screen.flip()
end

while true do

	update()
	draw()

	if Controls.check(Controls.read(),SCE_CTRL_TRIANGLE) then
		break
	end

end
--System.exit()
