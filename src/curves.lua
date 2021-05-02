function drawGrid(size, color)
	--Graphics.drawLine(10, 25, 100, 250, Color.new(25, 200, 120))
	--debug gride for placing elements
	--size 32 and 64
	size = size or 32
	color = color or Color.new(65, 65, 65)

	--too tired to work out maths
	local amount = SCREEN_WIDTH / size
  local acc = 0
   --x
  --Graphics.debugPrint(0,0,amount, ColourWhite)
	for g = 0,amount do
    
		--Graphics.drawLine(acc ,SCREEN_HEIGHT,0,0, color)
    Graphics.drawLine(0 ,acc,acc,SCREEN_HEIGHT, color)
    acc = acc + size
	end
  --void Graphics.drawLine	(x1,x2,y1,y2,int 	color)		

  
  --y
  amount = SCREEN_HEIGHT / size
  acc = 0
  
  for g = 0,amount do
		Graphics.drawLine( acc,SCREEN_WIDTH ,0,acc, color)
    acc = acc + size
	end
  
end