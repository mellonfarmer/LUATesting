
local df = dofile
function loadlib(str)
	df("app0:/lib/" .. str .. ".lua")
end

loadlib("loadAssets")
loadlib("webRequest")
loadlib("processJson")
loadlib("debug")


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

local pad, oldPad = Controls.read()

Video.init()
Video.open("app0:/assets/background/Cloud.mp4", true)

function printfontStyled(x,y,size,text,font,color)
	size=size or 40
	font = font or fntRoboto

	Font.setPixelSizes(font,size)
	Font.print(font,x,y,text,color)
end

function truncateNumber(toTruncate,length)
  length = length or 1
  return tonumber(string.format("%."..length.."f", toTruncate))  
end


function input()
  oldPad, pad = pad, Controls.read()
  
  if Controls.check(pad, SCE_CTRL_RTRIGGER) and not Controls.check(oldPad, SCE_CTRL_RTRIGGER) then
    if enableGrid == false then
      enableGrid = true
    else
      enableGrid = false
    end
  end
  
  if Controls.check(pad, SCE_CTRL_SELECT) and not Controls.check(oldPad, SCE_CTRL_SELECT) then
    if showElementBoundingBox == false then
      showElementBoundingBox = true
    else
      showElementBoundingBox = false
    end
  end
   
    if Controls.check(pad, SCE_CTRL_SELECT) and not Controls.check(oldPad, SCE_CTRL_SELECT) then
 
	--if Controls.check(Controls.read(),SCE_CTRL_TRIANGLE) then
		--break
  end
end
function update()
	pTime = cTime --previous time
	cTime = Timer.getTime(exTime) --current time
	dTime = cTime - pTime -- delta time
  
  
  
end

function draw()
	Graphics.initBlend()
	Screen.clear()
  
  frame = Video.getOutput()
  --Graphics.drawScaleImage(0, 0, frame, 960 / w, 544 / h)
  
  if frame ~= 0 then
		w = Graphics.getImageWidth(frame)
		h = Graphics.getImageHeight(frame)
		Graphics.setImageFilters(frame, FILTER_LINEAR, FILTER_LINEAR)
		Graphics.drawScaleImage(0, 0, frame, 960 / w, 544 / h)
	end
    --Graphics.drawImage(0,0,frame)
  
  
  
	--drawRect(0,  SCREEN_WIDTH, 0, 60, Color.new(0, 100, 0),true)
	--Graphics.drawImage(0,0,imgBackground)
  --Graphics.drawImage(0,0,imgCloud)
  
	dbgDrawRect(0, SCREEN_WIDTH, 62, 60, Color.new(0, 0, 100))
	Graphics.drawImage(17,16,imgBurger)
	Graphics.drawImage(852,16,imgSearch)
	Graphics.drawImage(915,16,imgDots)
	--City 370,60
	printfontStyled(370,75,40,Wcity,fntFredoka,ColourWhite)

	--debug rectangles
	dbgDrawRect(64,  240, 127, 240, Color.new(255, 0, 0))
	dbgDrawRect(360, 240, 127, 240, Color.new(255, 0, 0))
	dbgDrawRect(656, 240, 127, 240, Color.new(255, 0, 0))


	--weather icon
	--Graphics.drawScaleImage(25,90,Wicon,8,8)



	--temp
	Font.setPixelSizes(fntRoboto,52)
	Font.print(fntRoboto,427,165,truncateNumber(Wtemp).."C",ColourWhite)
	--humidity
	Font.setPixelSizes(fntRoboto,15)
	Font.print(fntRoboto,490,328,Whumid.."%",ColourWhite)
	--description
	printfontStyled(70,390,42,Wdesc,fntFredoka,ColourWhite)
	--Font.setPixelSizes(fntRoboto,40)
	--Font.print(fntRoboto,70,380,Wdesc,ColourWhite)

    --add wind

	--Graphics.debugPrint(0,0,Timer.getTime(exTime), ColourWhite)
  
  if enableGrid == true then
    dbgDrawFullGrid()
  end
  
  --Graphics.debugPrint(0,0,tostring(enableGrid),ColourWhite)
   Graphics.debugPrint(20, 20, "Time (ms): " .. Video.getTime(), Color.new(255, 255, 255))

	Graphics.termBlend()
   Screen.waitVblankStart()
	Screen.flip()
end

while true do
  input()
	update()
	draw()


  
      

  

end
--System.exit()
