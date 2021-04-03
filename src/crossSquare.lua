
--pad = Controls.read()
while true do
	--print("Hello world!")
	Graphics.initBlend()
	Screen.clear()

	if Controls.check(Controls.read(), SCE_CTRL_CROSS) then
		Graphics.debugPrint(10, 10, "Hello World", Color.new(255, 255, 255))

	end

	if Controls.check(Controls.read(), SCE_CTRL_SQUARE) then
		Network.init()

		ip_addr = Network.getIPAddress()
		ip_string = ("IP address :"..ip_addr)

		Graphics.debugPrint(10, 10, ip_string, Color.new(255, 255, 255))
		Network.term()

	end
	Graphics.termBlend()
	Screen.flip()

	if Controls.check(Controls.read(),SCE_CTRL_TRIANGLE) then
		break
	end

end
--System.exit()
