
local df = dofile
function loadlib(str)
	df("app0:/lib/" .. str .. ".lua")
end

loadlib("loadAssets")

SCREEN_WIDTH = 960
SCREEN_HEIGHT = 544

--init timer
exTime = Timer.new()
cTime = Timer.getTime(exTime)

-- setup pad
cPad = Controls.read()
--Xstatus = none
padDownTime = 0
ColourWhite = Color.new(255,255,255)
while true do
  pTime = cTime --previous time 
  cTime = Timer.getTime(exTime) --current time
  dTime = cTime - pTime -- delta time
  
	Graphics.initBlend()
	Screen.clear()
  
  Graphics.drawImage(0,0,imgBackground)
  
  Graphics.drawImage(25,16,imgBurger)
  Graphics.drawImage(861,16,imgSearch)
  Graphics.drawImage(908,16,imgDots)
  --City 370,60
  Font.setPixelSizes(fntRoboto,40)
  Font.print(fntRoboto,370,60,"Banbury",ColourWhite)
  
  
  --weather icon
  Graphics.drawScaleImage(25,90,imgWeatherIcon,8,8)

  
  
  --temp
  Font.setPixelSizes(fntRoboto,52)
  Font.print(fntRoboto,427,165,"19C",ColourWhite)
  Font.setPixelSizes(fntRoboto,15)
  Font.print(fntRoboto,490,328,"65%",ColourWhite)

  Font.setPixelSizes(fntRoboto,40)
  Font.print(fntRoboto,70,388,"Scattered Clouds",ColourWhite)
  
    --add wind


	Graphics.termBlend()
	Screen.flip()

	if Controls.check(Controls.read(),SCE_CTRL_TRIANGLE) then
		break
	end

end
--System.exit()
