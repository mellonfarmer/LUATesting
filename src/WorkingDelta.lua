
SCREEN_WIDTH = 960
SCREEN_HEIGHT = 544



exTime = Timer.new()

CurrentTime = Timer.getTime(exTime)
while true do
  PreviousTime = CurrentTime
  CurrentTime = Timer.getTime(exTime)
  deltaTime = CurrentTime - PreviousTime
  
	Graphics.initBlend()
	Screen.clear()
  
  
	Graphics.debugPrint(10, 20, "Current time: "..CurrentTime.." Previous Time: "..PreviousTime.." Delta: "..deltaTime , Color.new(0,0,255))
  
  Graphics.debugPrint(10, 40, "exTime: "..Timer.getTime(exTime), Color.new(255,0,0))

	Graphics.termBlend()
	Screen.flip()

	if Controls.check(Controls.read(),SCE_CTRL_TRIANGLE) then
		break
	end

end
--System.exit()
