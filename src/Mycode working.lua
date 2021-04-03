
--pad = Controls.read()
while true do
	--print("Hello world!")
	Graphics.initBlend()
	Screen.clear()

	if Controls.check(Controls.read(), SCE_CTRL_CROSS) then
		Graphics.debugPrint(10, 10, "Hello World", Color.new(255, 255, 255))

	end
	Graphics.termBlend()

	Screen.flip()

	if Controls.check(Controls.read(),SCE_CTRL_TRIANGLE) then
		break
	end

end
--System.exit()
