
SCREEN_WIDTH = 960
SCREEN_HEIGHT = 544

--init timer
exTime = Timer.new()
cTime = Timer.getTime(exTime)

-- setup pad
cPad = Controls.read()
--Xstatus = none
padDownTime = 0

while true do
  pTime = cTime --previous time 
  cTime = Timer.getTime(exTime) --current time
  dTime = cTime - pTime -- delta time
  
  
  pPad = cPad --previous pad state
  cPad = Controls.read() --current pad state
  
  
	Graphics.initBlend()
	Screen.clear()
  
  if Controls.check(cPad,SCE_CTRL_CROSS) then
    --local togglePressed = 0
    --turn into fuction
    --get current pad -record time
    --compare to previous pad
    if cPad ~= pPad then
      padDownTime = Timer.getTime(exTime)
    end
    ----infunction return key pressed
    
    --check how long key has been held
    if (padDownTime - cTime)>= 500 then 
      Graphics.debugPrint(10, 20, "X Held", Color.new(255,0,0))
    else 
      Graphics.debugPrint(10, 20, "X Pressed"..padDownTime, Color.new(255,0,0))
    end
    
    
    --get time between the two states
    
    --if time less than 500ms count as a press action
    
    --if larger count the button as held
    
    --going forward check how to handle multiple buttons
  end

  
  
	--Graphics.debugPrint(10, 20, "Press time: "..cTime.." Previous Time: "..pTime.." Delta: "..dTime , Color.new(0,0,255))
  
  Graphics.debugPrint(10, 40, "paddownTime: "..padDownTime , Color.new(255,0,0))
  --Graphics.debugPrint(10, 60, "paddownTime: "..padDownTime , Color.new(255,0,0))

	Graphics.termBlend()
	Screen.flip()

	if Controls.check(Controls.read(),SCE_CTRL_TRIANGLE) then
		break
	end

end
--System.exit()
