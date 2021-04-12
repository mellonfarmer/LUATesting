background =  Graphics.loadImage("app0:/assets/background/background.png")
blueSquare = Graphics.loadImage("app0:/assets/tiles/bluesquare.png")
blueSquareT = Graphics.loadImage("app0:/assets/tiles/bluesquareT.png")
logo = Graphics.loadImage("app0:/assets/tiles/logo.png")

squarePressed = false

SCREEN_WIDTH = 960
SCREEN_HEIGHT = 544

logoPosX = (SCREEN_WIDTH / 2)
logoPosY = (SCREEN_HEIGHT/ 2)

speed = 1

pad = Controls.read()

--init logo
	Graphics.initBlend()
	Screen.clear()

	Graphics.drawImage(logoPosX, logoPosY, logo)

	Graphics.termBlend()
	Screen.flip()

while true do
	pad = Controls.read()
	--print("Hello world!")
	Graphics.initBlend()
	Screen.clear()

	Graphics.drawImage(0,0,background)
	--Graphics.drawImage(360, 250, blueSquare)
	--if logoPosX > 0 and logoPosY > 0 and logoPosX < SCREEN_WIDTH and logoPosY < SCREEN_HEIGHT then
		if Controls.check(pad, SCE_CTRL_UP) then
			logoPosY = logoPosY - speed
		end
		if Controls.check(pad,SCE_CTRL_DOWN) then
			logoPosY = logoPosY + speed
		end
		if Controls.check(pad,SCE_CTRL_LEFT) then
			logoPosX = logoPosX - speed
		end
		if Controls.check(pad,SCE_CTRL_RIGHT) then
			logoPosX = logoPosX + speed
		end
	--end
	Graphics.drawImage(logoPosX, logoPosY, logo)

	if Controls.check(pad,SCE_CTRL_RTRIGGER) then
		if speed ~= 10 then
			speed = speed + 1
		end
	end
	if Controls.check(pad,SCE_CTRL_LTRIGGER) then
		if speed ~= 1 then
			speed = speed - 1
		end
	end

	if Controls.check(Controls.read(), SCE_CTRL_CROSS) then
		Graphics.debugPrint(10, 20, "Hello World", Color.new(0,0,0))
	end

	if squarePressed ==true then
		Graphics.drawImage(360, 250, blueSquare)
	end


	if Controls.check(Controls.read(), SCE_CTRL_SQUARE) then
		if squarePressed == false then

			squarePressed = true

		elseif squarePressed == true then

			squarePressed = false

		end

	end
	Graphics.debugPrint(10, 20, "speed: "..speed.." LogoX: "..logoPosX.." LogoY: "..logoPosY , Color.new(0,0,0))

	Graphics.termBlend()
	Screen.flip()

	if Controls.check(Controls.read(),SCE_CTRL_TRIANGLE) then
		break
	end

end
--System.exit()
