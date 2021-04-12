function drawRect(x,xs,y,ys)
	--print("x: "..x.." xs: "..xs.." y: "..y.." xy: "..ys)
	dbgx = (xs/2)+x --half area add origin
	dbgy = (ys/2)+y
	local xs = xs + x --x destination
	local ys = ys + y

	print("xs: "..xs.." xy: "..ys)
	print("x: "..dbgx.." y: "..dbgy)

end


--drawRect(60,240,120,240)
drawRect(60,  240, 120, 240)
drawRect(360, 240, 120, 240)
drawRect(660, 240, 120, 240)
